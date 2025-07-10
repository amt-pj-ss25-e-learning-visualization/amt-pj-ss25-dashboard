import { Module } from "../../modules/modules.model";
import { Statement } from "../../statements/statements.model";
import { Course } from "../../courses/courses.model";
import { Op } from "sequelize";

/**
 * TopicInterestRecommender recommends modules based on the topics of courses that a given actors has completed.
 * NOTE: Current implementation with sequelize operators heavily increases API response times (without: ~1800ms => with: ~150ms).
 */
export class TopicInterestRecommender {
  static async getRecommendations(actorId: string, top: number): Promise<Module[]> {
    try {
      // Query the statements to find completed modules for the given actor
      const completedStatements = await Statement.findAll({
        where: {
          actor_id: actorId,
          verb: "completed",
        },
        attributes: ["module_id"],
      });

      // Unwrap/Flatten array of objects, which contain the completed module_ids, to an array of module IDs
      const completedModuleIds = completedStatements.map((statement) => statement.module_id);

      // Fetch course IDs for completed modules
      const completedModules = await Module.findAll({
        where: {
          id: { [Op.in]: completedModuleIds },
        },
        attributes: ["course_id"],
      });

      // Again, flatten an array of objects, which contain the completed course_ids, to an array of course IDs
      const completedCourseIds = completedModules.map((module) => module.course_id);

      // Get subject of courses associated with completed modules
      const completedCourses = await Course.findAll({
        where: {
          id: { [Op.in]: completedCourseIds },
        },
        attributes: ["subject"],
      });

      // Once again, flatten an array of objects, which contain subjects of completed courses, to an array of subjects
      const completedCourseSubjects = completedCourses
        .map((course) => course.subject?.trim()) 
        .filter((subject) => subject);

      // Query courses for matching subjects, while excluding already completed courses
      const matchingCourses = await Course.findAll({
        where: {
          subject: { [Op.in]: completedCourseSubjects },
          id: { [Op.notIn]: completedCourseIds },
        },
        attributes: ["id"],
      });

      // ...one last time, flatten an array of objects, which contain the matching course IDs, to an array of IDs
      const matchingCourseIds = matchingCourses.map((course) => course.id);

      // Fetch all modules that match the subjects, are not completed and are not top-level modules
      const recommendedModules = await Module.findAll({
        where: {
          id: { [Op.notIn]: completedModuleIds },
          parent_id: null,
          course_id: { [Op.in]: matchingCourseIds },
        },
        limit: top
      });

      return recommendedModules;
    } catch (error) {
      console.error("Error fetching topic-based recommendations:", error);
      return [];
    }
  }
}