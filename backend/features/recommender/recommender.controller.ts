import { Request, Response } from "express";
import { TopicInterestRecommender } from "./services/topicInterest.service";

const getTopicInterestRecommendations = async (req: Request, res: Response): Promise<void> => {
    try {
        const { actor_id } = req.params;
        if (!actor_id) {
            res.status(400).json({ error: "Actor ID is required" });
            return;
        }

        const recommendations = await TopicInterestRecommender.getRecommendations(actor_id);
        res.json(recommendations);
    }
    catch (error) {
        console.error("Error fetching topic-interest recommendations:", error);
        res.status(500).json({ error: "Failed to fetch recommendations" });
    }
};

export default {
    getTopicInterestRecommendations,
};