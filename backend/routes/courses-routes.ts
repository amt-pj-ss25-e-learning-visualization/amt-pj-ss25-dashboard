import express from "express";
import CoursesController from '../controllers/courses-controller';

const router = express.Router();

/**
 * Returns all courses
 */
router.get('/', CoursesController.getAll);

/**
 * Returns a course by its UUID, including its course structure.
 * @param {string} id - The UUID of the course
 */
router.get('/:id', CoursesController.getById);

export default router;