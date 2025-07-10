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

/**
 * Recommend to review modules based on the forgetting curve.
 * @query {string} actorId - The ID of the actor (student).
 */
router.get("/review/:actor_id", RecommenderController.getReviewRecommendations);

export default router;