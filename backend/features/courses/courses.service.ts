import { omitFields } from "../../common/utils";
import { Actor } from "../actors/actors.model";
import { LearningResource } from "../learningResources/learningResources.model";
import { Module } from "../modules/modules.model";
import { Course } from "./courses.model";
import { CourseTree } from "./courses.types";

export class Courses {
  /**
   * Fetches submodules recursively for a given module ID.
   * @param {string} moduleId - The ID of the module to fetch submodules for.
   * @returns {Promise<any[]>} - An array of submodules.
   */
  private async fetchSubmodules(moduleId: string): Promise<any[]> {
    const submodules = await Module.findAll({
      where: { parent_id: moduleId },
      include: [
        { model: Actor, as: "instructor" },
        { model: LearningResource, as: "resources" },
      ],
    });
    return Promise.all(
      submodules.map(async (submodule: any) => {
        const plainSubmodule = submodule.get({ plain: true });
        plainSubmodule.submodules = await this.fetchSubmodules(
          plainSubmodule.id
        );
        return plainSubmodule;
      })
    );
  }

  async getCourseTree(id: Course["id"]) {
    try {
      const course = await Course.findByPk(id);
      if (!course) {
        throw Error("Course not found!");
      }
      // Fetch top-level modules for this course
      const modules = await Module.findAll({
        where: { course_id: id, parent_id: null },
        include: [
          { model: Actor, as: "instructor" },
          { model: LearningResource, as: "resources" },
        ],
      });
      // Recursively fetch submodules for each top-level module
      const modulesWithHierarchy = await Promise.all(
        modules.map(async (mod: any) => {
          const plainMod = mod.get({ plain: true });
          plainMod.submodules = await this.fetchSubmodules(plainMod.id);
          return plainMod;
        })
      );

      const courseObj = course.get({ plain: true }) as any;
      courseObj.modules = modulesWithHierarchy;

      return omitFields(courseObj, [
        "course_id",
        "instructor_id",
        "module_resources",
      ]) as CourseTree;
    } catch (error) {
      console.error(error);
      return;
    }
  }
}
