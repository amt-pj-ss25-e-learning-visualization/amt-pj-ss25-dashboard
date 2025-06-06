import express from "express";
import StatementsController from "./statements.controller";

const router = express.Router();

/**
 * Returns all statements
 */
router.get("/", StatementsController.getAll);

/**
 * Returns a statement by its UUID
 * @param {string} id - The UUID of the statement
 */
router.get("/:id", StatementsController.getById);

/**
 * Returns statements filtered by a specific actor, module, or verb.
 * @param {string} actorId - The UUID of the actor
 * @param {string} moduleId - The UUID of the module
 * @param {string} verb - The activity verb
 */
router.get(
  "/actor/:actorId",
  StatementsController.getByField({ actor_id: "actorId" })
);
router.get(
  "/module/:moduleId",
  StatementsController.getByField({ module_id: "moduleId" })
);
router.get("/verb/:verb", StatementsController.getByField({ verb: "verb" }));

router.get(
  "/module/:moduleId/actor/:actorId",
  StatementsController.getByField({
    actor_id: "actorId",
    module_id: "moduleId",
  })
);
// TODO: Do we need an endpoint for filtering by timestamp (e.g. last X entries for a specific student/module)?

export default router;
