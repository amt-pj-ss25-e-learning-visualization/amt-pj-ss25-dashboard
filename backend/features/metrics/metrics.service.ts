import { Statement } from "../statements/statements.model";
import {
  forgettingEffect,
  groupBy,
  mean,
  parseISO8601,
  sum,
} from "../../common/utils";
import { Verb } from "../statements/statements.constants";
import { LearningResource } from "../learningResources/learningResources.model";
import { Module } from "../modules/modules.model";
import { ISO8601Duration } from "../../common/types";
import {
  AggregatedMetricObject,
  Metric,
  MetricNames,
  MetricObject,
} from "./metrics.types";

/**
 * Class that contains functions for the calculation of metrics.
 */
export class Metrics {
  /**
   * Fetchtes the statements of a module, as well as its learning resource.
   * Then exectutes the calculation for all the metrics.
   */
  static async compute(module_id: string): Promise<MetricObject> {
    const statements = (await Statement.findAll({ where: { module_id } })).sort(
      (b, a) =>
        new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime()
    );
    const learningResources = (
      (await Module.findOne({
        where: { id: module_id },
        include: [
          {
            model: LearningResource,
            as: "resources",
          },
        ],
      })) as Module & { resources: LearningResource[] }
    ).resources;

    return {
      attempts: this.getAttempts(statements),
      performance: this.getPerformance(statements),
      masteryRaw: this.getMastery(statements, false),
      masteryEbbinghaus: this.getMastery(statements, true),
      completion: this.getCompletion(statements),
      timeSpent: this.getTimeSpent(statements),
      realVsExpectedTime: this.getTimeToExpectedTime(
        statements,
        learningResources
      ),
      lastVisit: this.getLastVisit(statements),
      totalVisits: this.getTotalVisits(statements),
      rating: this.getRating(statements),
    };
  }

  /**
   * Aggregates each of the metrics for each actor and also the mean values.
   * This can be used to calculate metric values on a course level, for instance.
   */
  static aggregate(metrics: MetricObject[]): AggregatedMetricObject {
    const aggregatedMetrics: Partial<AggregatedMetricObject> = {};
    for (const metricName of MetricNames) {
      const data = metrics
        .reduce((prev, curr) => {
          const flattenedData = [...prev];
          for (const actorData of curr[metricName].data) {
            const index = flattenedData.findIndex(
              (d) => d.actor === actorData.actor
            );
            if (index !== -1) {
              flattenedData[index].values = [
                ...flattenedData[index].values,
                actorData.value,
              ];
            } else {
              flattenedData.push({
                actor: actorData.actor,
                values: [actorData.value],
              });
            }
          }
          return flattenedData;
        }, [] as { actor: string; values: number[] }[])
        .map((dataEntry) => ({
          ...dataEntry,
          ...this.getStatistics(dataEntry.values),
          sum: sum(...dataEntry.values),
        }));
      aggregatedMetrics[metricName] = {
        data,
        ...this.getStatistics(data, "mean"),
        meanOfSums: mean(...data.map((d) => d.sum)),
      };
    }
    return aggregatedMetrics as AggregatedMetricObject;
  }

  /* --------------------------- METRIC CALCULATION --------------------------- */

  /**
   * Attempts calculated as the number of `scored` statements for an actor.
   */
  private static getAttempts(statements: Statement[]): Metric {
    const data = this.calculateOnActor(
      statements,
      [Verb.scored],
      (actor, groups) => groups[actor].length
    );
    const withoutNoAttempt = data
      .filter((d) => d.value > 0)
      .map((d) => d.value);
    return { data, ...this.getStatistics(withoutNoAttempt) };
  }

  /**
   * Performance calculated as the highest result value of an actor's `scored` statements.
   */
  private static getPerformance(statements: Statement[]): Metric {
    const data = this.calculateOnActor(
      statements,
      [Verb.scored],
      (actor, groups) =>
        Math.max(
          ...groups[actor]
            .map((statement) => statement.result?.score?.scaled)
            .filter((statement) => statement !== undefined)
        )
    );
    return { data, ...this.getStatistics(data, "value") };
  }

  /**
   * Mastery calculated based on the most recent `evaluated` statement.
   * If `withForgetting = true` then the forgetting curve function is applied
   * for the period from the last `evaluated` statement until the `completed` statement.
   * For evaluations beyond this period the value falls back to the value without
   * the forgetting curve function applied.
   */
  private static getMastery(
    statements: Statement[],
    withForgetting: boolean
  ): Metric {
    const completedStatementsGrouped = groupBy(
      statements.filter((statement) => statement.verb === Verb.completed),
      "actor_id"
    );
    const data = this.calculateOnActor(
      statements,
      [Verb.evaluated],
      (actor, groups) => {
        const lastEntry = groups[actor][groups[actor].length - 1];
        if (lastEntry?.result?.score?.scaled === undefined) return null;
        if (!withForgetting) return lastEntry.result.score.scaled;
        const from = new Date(lastEntry.timestamp).getTime();
        const to = completedStatementsGrouped[actor]?.length
          ? new Date(
              completedStatementsGrouped[actor][
                completedStatementsGrouped[actor].length - 1
              ].timestamp
            ).getTime()
          : Date.now();
        if (to <= from) return lastEntry.result.score.scaled;
        const timePastInMin = (to - from) / 60000;
        const forgetRate = forgettingEffect(
          timePastInMin,
          groups[actor].length
        );
        return lastEntry.result.score.scaled * forgetRate;
      }
    );
    return { data, ...this.getStatistics(data, "value") };
  }

  /**
   * For all modules an actor initilized, the function checks if the actor has also a
   * `completed` statement for that module. If yes the value is 1, otherwise 0.
   */
  private static getCompletion(statements: Statement[]): Metric {
    const completedStatementsGrouped = groupBy(
      statements.filter((statement) => statement.verb === Verb.completed),
      "actor_id"
    );
    const data = this.calculateOnActor(
      statements,
      [Verb.initialized],
      (actor) => (completedStatementsGrouped[actor]?.length ? 1 : 0)
    );
    return { data, ...this.getStatistics(data, "value") };
  }

  /**
   * Calculates the time spent as the sum of parsed duration values \
   * in statements with the verb `exited`. \
   * Time in milliseconds.
   */
  private static getTimeSpent(statements: Statement[]): Metric {
    const data = this.calculateOnActor(
      statements,
      [Verb.exited],
      (actor, groups) =>
        sum(...groups[actor].map((s) => parseISO8601(s.result?.duration)))
    );
    return { data, ...this.getStatistics(data, "value") };
  }

  /**
   * Calculates the expected time as sum of the `typical_learning_time` of all learning resources.
   * Then the function calculates the average of the actual time spent divided by the expected time
   * across all learning sessions.
   */
  private static getTimeToExpectedTime(
    statements: Statement[],
    resources: LearningResource[]
  ): Metric {
    const expectedTime = sum(
      ...resources.map((r) =>
        parseISO8601(r.typical_learning_time as ISO8601Duration)
      )
    );
    const data = this.calculateOnActor(
      statements,
      [Verb.exited],
      (actor, groups) =>
        mean(
          ...groups[actor].map(
            (s) => parseISO8601(s.result?.duration) / expectedTime
          )
        )
    );
    return { data, ...this.getStatistics(data, "value") };
  }

  /**
   * Calculates the time that has passed since the last initialization or exit of a module.
   * The time is calculated only up to the completion of the module.
   */
  private static getLastVisit(statements: Statement[]): Metric {
    const completedStatementsGrouped = groupBy(
      statements.filter((statement) => statement.verb === Verb.completed),
      "actor_id"
    );
    const data = this.calculateOnActor(
      statements,
      [Verb.exited, Verb.initialized],
      (actor, groups) => {
        const from = new Date(
          groups[actor][groups[actor].length - 1].timestamp
        ).getTime();
        const to = !completedStatementsGrouped[actor]
          ? Date.now()
          : new Date(
              completedStatementsGrouped[actor][
                completedStatementsGrouped[actor].length - 1
              ].timestamp
            ).getTime();
        return Math.max(to - from, 0);
      }
    );
    return { data, ...this.getStatistics(data, "value") };
  }

  /**
   * Number of module visits calculated as number of `initilized` statements.
   */
  private static getTotalVisits(statements: Statement[]): Metric {
    const data = this.calculateOnActor(
      statements,
      [Verb.initialized],
      (actor, groups) => groups[actor].length
    );
    return { data, ...this.getStatistics(data, "value") };
  }

  /**
   * The most recent rating of the module.
   */
  private static getRating(statements: Statement[]): Metric {
    const data = this.calculateOnActor(
      statements,
      [Verb.rated],
      (actor, groups) => {
        const rating =
          groups[actor][groups[actor].length - 1].result?.score?.raw;
        return rating !== undefined ? rating : null;
      }
    );
    return { data: data, ...this.getStatistics(data, "value") };
  }

  /* ---------------------------------- UTILS --------------------------------- */

  /**
   * This function filters statements by a given set of verbs, groups them by `actor_id`,
   * then performs a specified calculation for each actor and pushes the respective actor
   * and calculation outcome into a result array.
   */
  private static calculateOnActor(
    statements: Statement[],
    verbs: Verb[],
    calculation: (
      actor: string,
      groups: { [actor: string]: Statement[] }
    ) => number | null
  ) {
    const statementsByActor = groupBy(
      statements.filter((statement) => verbs.some((v) => v === statement.verb)),
      "actor_id"
    );
    const data: Metric["data"] = [];
    for (const actor in statementsByActor) {
      const value = calculation(actor, statementsByActor);
      if (value === null) continue;
      data.push({ actor, value });
    }
    return data;
  }

  private static getStatistics(data: any[], key?: string) {
    const values = (!key ? data : data.map((d) => d[key])) as number[];
    return {
      mean: mean(...values),
      min: Math.min(...values),
      max: Math.max(...values),
    };
  }
}
