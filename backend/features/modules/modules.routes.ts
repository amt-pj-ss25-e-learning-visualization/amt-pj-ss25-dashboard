import express from "express";
import ModulesController from "./modules.controller";

const router = express.Router();

/**
 * Returns all modules
 */
router.get("/", ModulesController.getAll);

/**
 * Returns a module by its UUID
 * @param {string} id - The UUID of the module
 */
router.get("/:id", ModulesController.getById);

/**
 * Returns modules filtered by a specific course.
 * @param {string} courseId - The UUID of the course
 */
router.get(
  "/course/:courseId",
  ModulesController.getByField({ course_id: "courseId" })
);

/**
 * Returns all modules with the specified instructor.
 * @param {string} instructorId - The UUID of the instructor
 */
router.get(
  "/instructor/:instructorId",
  ModulesController.getByField({ instructor_id: "instructorId" })
);

export default router;
