import { Request, Response } from "express";
import { SimilarStudentsRecommender } from "./services/similarStudents.service";
import { TopicInterestRecommender } from "./services/topicInterest.service";
import { ReviewRecommender } from "./services/review.service";

const getSimilarStudentsRecommendations = async (req: Request, res: Response): Promise<void> => {
    try {
        const { actor_id } = req.params;
        if (!actor_id) {
            res.status(400).json({ error: "Actor ID is required" });
            return;
        }

        const recommendations = await SimilarStudentsRecommender.getRecommendations(actor_id, 5);
        res.json(recommendations);
    }
    catch (error) {
        console.error("Error fetching course-progress recommendations:", error);
        res.status(500).json({ error: "Failed to fetch recommendations" });
    }
};

const getTopicInterestRecommendations = async (req: Request, res: Response): Promise<void> => {
    try {
        const { actor_id } = req.params;
        if (!actor_id) {
            res.status(400).json({ error: "Actor ID is required" });
            return;
        }

        const recommendations = await TopicInterestRecommender.getRecommendations(actor_id, 5);
        res.json(recommendations);
    }
    catch (error) {
        console.error("Error fetching topic-interest recommendations:", error);
        res.status(500).json({ error: "Failed to fetch recommendations" });
    }
};

const getReviewRecommendations = async (req: Request, res: Response): Promise<void> => {
    try {
        const { actor_id } = req.params;
        if (!actor_id) {
            res.status(400).json({ error: "Actor ID is required" });
            return;
        }

        const recommendations = await ReviewRecommender.getRecommendations(actor_id, 5);
        res.json(recommendations);
    }
    catch (error) {
        console.error("Error fetching review recommendations:", error);
        res.status(500).json({ error: "Failed to fetch recommendations" });
    }
};

export default {
    getSimilarStudentsRecommendations,
    getTopicInterestRecommendations,
    getReviewRecommendations
};