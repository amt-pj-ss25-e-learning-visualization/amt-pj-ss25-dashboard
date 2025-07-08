import { LearningResourceAttributes } from "../learningResources/learningResources.model";
import { ModuleAttributes } from "../modules/modules.model";
import { CourseAttributes } from "./courses.model";

export type Module = Omit<ModuleAttributes, "course_id" | "instructor_id"> & {
  instructor: { id: string } | null;
  resources: LearningResourceAttributes[];
  submodules: Module[];
};

export type CourseTree = CourseAttributes & {
  modules: Module[];
};
