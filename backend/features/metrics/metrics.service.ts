import { Score } from "./metrics.types";
import { Statement } from "../statements/statements.model";
import { groupBy } from "../../common/utils";

export class Metrics {
  readonly METRIC_TYPES = [
    "moduleScore",
    "moduleAvgAttempts",
    "moduleCompletionRatio",
  ] as const;

  private data: Statement[];

  private readonly _computed: {
    moduleScore: { [actor: string]: Score };
    moduleAvgAttempts: number;
    moduleCompletionRatio: number;
  } = {
    moduleScore: {},
    moduleAvgAttempts: 0,
    moduleCompletionRatio: 0,
  };

  constructor(data: Statement[]) {
    this.data = data;
  }

  public setData(data: Statement[]): void {
    this.data = data;
  }

  get computed() {
    return { ...this._computed };
  }

  compute(...metrics: (typeof this.METRIC_TYPES)[number][]) {
    for (const metric of metrics) {
      this[metric]();
    }
    return this;
  }

  /* -------------------------------------------------------------------------- */
  /*                                   METRICS                                  */
  /* -------------------------------------------------------------------------- */
  private moduleScore() {
    const statementsGroupedByActor = groupBy(this.data, "actor_id");
    const scores: { [K: string]: Score } = {};
    for (const actor in statementsGroupedByActor) {
      const scoredStatements = statementsGroupedByActor[actor].filter(
        (s) => s.verb === "scored"
      );
      const attempts = scoredStatements.length;
      const highestScore = scoredStatements.reduce((prev, curr) => {
        if (!curr.result?.score || curr.result.score.raw === undefined)
          return prev;
        if (curr.result.score.raw >= prev) return curr.result.score.raw;
        return prev;
      }, 0);
      const completed = !!statementsGroupedByActor[actor].find(
        (s) => s.verb === "completed"
      );
      scores[actor] = {
        attempts,
        highestScore,
        completed,
      };
    }
    this._computed.moduleScore = scores;
  }

  private moduleAvgAttempts() {
    if (!this._computed.moduleScore) this.moduleScore();
    if (!this._computed.moduleScore) return;
    const scores = this._computed.moduleScore;
    const actors = Object.keys(scores);
    const actualAttempts = actors
      .filter((actor) => scores[actor].attempts > 0)
      .map((actor) => scores[actor]);
    this._computed.moduleAvgAttempts = actualAttempts.length
      ? actualAttempts.reduce((prev, curr) => curr.attempts + prev, 0) /
        actualAttempts.length
      : 0;
  }

  private moduleCompletionRatio() {
    if (!this._computed.moduleScore) this.moduleScore();
    if (!this._computed.moduleScore) return;
    const scores = this._computed.moduleScore;
    const actors = Object.keys(scores);
    this._computed.moduleCompletionRatio =
      actors.filter((user) => scores[user].completed).length / actors.length;
  }
}
