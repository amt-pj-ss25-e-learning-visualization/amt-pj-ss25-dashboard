import express from "express";
import { BaseController } from "../../common/baseController";
import { Actor } from "./actors.model";

const router = express.Router();
const ActorsController = new BaseController(Actor);

/**
 * Returns all actors
 */
router.get("/", ActorsController.getAll);

/**
 * Returns an actor by its UUID
 * @param {string} id - The UUID of the actor
 */
router.get("/:id", ActorsController.getById);

/**
 * Returns actors filtered by a specific role.
 * @param {string} role - The role of the actor
 */
router.get("/role/:role", ActorsController.getByField("role", "role"));

export default router;
