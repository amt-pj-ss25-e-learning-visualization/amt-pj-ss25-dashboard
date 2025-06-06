import { useApi } from "./use-api";
import { ScoreDTO } from "../../../backend/features/metrics/metrics.dto";

export function useScore(moduleId?: string, actorId?: string) {
  return useApi<ScoreDTO["response"]>([
    "modules",
    moduleId,
    "actors",
    actorId,
    "metrics/moduleScore",
  ]);
}
