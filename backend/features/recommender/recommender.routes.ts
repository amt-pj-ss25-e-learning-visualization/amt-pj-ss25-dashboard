import { Router } from "express";
import RecommenderController from "./recommender.controller";

const router = Router();

/**
 * Recommend modules based on similar students.
 * @query {string} actorId - The ID of the actor (student).
 */
router.get("/similar/:actor_id", RecommenderController.getSimilarStudentsRecommendations);

/**
 * Recommend modules based on topic interest.
 * @query {string} actorId - The ID of the actor (student).
 */
router.get("/topic/:actor_id", RecommenderController.getTopicInterestRecommendations);

export default router;