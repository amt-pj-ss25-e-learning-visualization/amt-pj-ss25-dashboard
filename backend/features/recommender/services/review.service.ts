import { Statement } from "../../statements/statements.model";
import { Module } from "../../modules/modules.model";
import { forgettingEffect } from "../../../common/utils";
import { Op } from "sequelize";

/**
 * ReviewRecommender recommends modules to review based on the forgetting curve.
 * See "../../../common/utils.ts" for the applied forgettingEffect function.
 */
export class ReviewRecommender {
  static async getRecommendations(actorId: string, top: number): Promise<Module[]> {
    try {
      // Query the statements to find completed modules for the given actor
      const completedStatements = await Statement.findAll({
        where: {
          actor_id: actorId,
          verb: "completed",
        },
        attributes: ["module_id", "timestamp", "result"],
      });

      // Convert the timestamp to milliseconds since Unix epoch
      // and unwrap scaled score from nested result object 
      const completedModules = completedStatements.map((statement) => ({
        moduleId: statement.module_id,
        timestamp: new Date(statement.timestamp).getTime(),
        score: statement.result?.score?.scaled || 1,
      }));

      // Calculate the forgetting effect for each completed module
      // This factors in the last performance (assumes good score means less forgetting) and the time since completion
      const now = Date.now();
      const modulesWithAdjustedScores = completedModules.map(({ moduleId, timestamp, score }) => {

        // Time since the module was completed (in milliseconds, see previously)
        const timeSince = now - timestamp;

        // Count how many times the module was already completed
        const repetitions = completedStatements.filter((s) => s.module_id === moduleId).length;

        // Apply forgetting effect to module based on time since completion and repetitions
        const forgettingScore = forgettingEffect(timeSince, repetitions);

        // Factor in the last module completion score
        const adjustedScore = forgettingScore * score;

        return { moduleId, adjustedScore };
      });

      /**
       * Sort modules by adjusted score (ascending) and 
       * select X (defined by top param) modules to review.
       * Lower adjusted score means higher priority for review
       * (e.g. 0.30 means only 30% of the original mastery remaining).
       */
      const modulesToReview = modulesWithAdjustedScores
        .sort((a, b) => a.adjustedScore - b.adjustedScore)
        .slice(0, top)
        .map((module) => module.moduleId);

      // Query the module details for the recommended module IDs
      const recommendedModules = await Module.findAll({
        where: {
          id: { [Op.in]: modulesToReview },
        },
      });

      return recommendedModules;
    }
    catch (error) {
      console.error("Error fetching review recommendations:", error);
      return [];
    }
  }
}