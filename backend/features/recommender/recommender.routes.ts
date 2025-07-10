import { Router } from "express";
import TopicInterestController from "./recommender.controller";

const router = Router();

/**
 * Recommend modules based on topic interest.
 * @query {string} actorId - The ID of the actor (student).
 */
router.get("/topic/:actor_id", TopicInterestController.getTopicInterestRecommendations);

export default router;