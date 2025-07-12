import { RecommenderDto } from "@/types/dto";
import { useApi } from "./use-api";

// Recommend modules based on similar students.
export function useRecommendationsBySimilarActors(actorId: string) {
  const { data, loading, error } = useApi<RecommenderDto[]>(["/recommendations/similar/", actorId]);
  return {
    data: data || [],
    loading,
    error,
  };
}

// Recommend to review modules based on the forgetting curve.
export function useRecommendationsByReview(actorId: string) {
  const { data, loading, error } = useApi<RecommenderDto[]>(["/recommendations/review/", actorId]);
  return {
    data: data || [],
    loading,
    error,
  };
}

// Recommend modules based on topic interest.
export function useRecommendationsByTopic(actorId: string) {
  const { data, loading, error } = useApi<RecommenderDto[]>(["/recommendations/topic/", actorId]);
  return {
    data: data || [],
    loading,
    error,
  };
}