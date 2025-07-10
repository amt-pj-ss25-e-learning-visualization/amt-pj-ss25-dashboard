import { Statement } from "../../statements/statements.model";
import { Module } from "../../modules/modules.model";
import { Op } from "sequelize";

/**
 * SimilarStudentsRecommender recommends modules based on the completed modules of similar students.
 * Similarity is calculated using the Jaccard index.
 */
export class SimilarStudentsRecommender {
  static async getRecommendations(actorId: string, top: number): Promise<Module[]> {
    try {
      // Get all completed modules and their associated students
      const allStatements = await Statement.findAll({
        where: {
          verb: "completed",
        },
        attributes: ["actor_id", "module_id"],
      });

      // Create a map of users - their completed modules
      const userModuleMap: Record<string, Set<string>> = {};
      allStatements.forEach((statement) => {
        const actorId = statement.actor_id;
        const moduleId = statement.module_id;

        if (!userModuleMap[actorId]) {
          userModuleMap[actorId] = new Set();
        }
        userModuleMap[actorId].add(moduleId);
      });

      const currentUserModules = userModuleMap[actorId] || new Set();
      const similarityScores: Record<string, number> = {};

      // Iterate through all other users (skipping the one specified by actorId)
      for (const [otherActorId, otherModules] of Object.entries(userModuleMap)) {
        if (otherActorId === actorId) continue; 

        // Calculate Jaccard similarity  index to measure similarity in courses to other users
        const intersection = new Set([...currentUserModules].filter((module) => otherModules.has(module)));
        const union = new Set([...currentUserModules, ...otherModules]);
        const jaccardIndex = intersection.size / union.size;
        similarityScores[otherActorId] = jaccardIndex;
      }

      // Select top X similar students (passed from recommender.controller) & sort by similarity (descending)
      const topSimilarStudents = Object.entries(similarityScores)
        .sort(([, scoreA], [, scoreB]) => scoreB - scoreA) // Sort 
        .slice(0, top)
        .map(([actorId]) => actorId);

      // Use the found similar students to...
      const modulesToRecommend = new Set<string>();
      for (const similarActorId of topSimilarStudents) {
        
        // ...recommend modules completed by these students that the given student hasn’t completed yet
        const similarModules = userModuleMap[similarActorId] || new Set();
        for (const moduleId of similarModules) {
          if (!currentUserModules.has(moduleId)) {
            modulesToRecommend.add(moduleId);
          }
        }
      }

      // Query the module details for the recommended module IDs
      const recommendedModules = await Module.findAll({
        where: {
          id: { [Op.in]: Array.from(modulesToRecommend) },
        },
      });

      return recommendedModules;
    }
    catch (error) {
      console.error("Error fetching similar-students recommendations:", error);
      return [];
    }
  }
}