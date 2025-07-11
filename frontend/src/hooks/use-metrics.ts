import { useApi } from "./use-api";
import { ModuleMetricsDTO, CourseScoreDTO } from "../../../backend/features/metrics/metrics.dto";


// Fetches module metrics for a given module and actor by calling the generic useApi hook with the appropriate endpoint segments
export function useMetrics(moduleId?: string, actorId?: string) {
  return useApi<ModuleMetricsDTO["response"]>([
    "modules",
    moduleId,
    "actors",
    actorId,
    "metrics",
  ]);
}

// Fetches and returns the aggregated metric of a course based on the module metrics
export function useAggregatedMetrics(courseId?: string, actorId?: string) {
  return useApi<CourseScoreDTO["response"]>([
    "courses",
    courseId,
    "actors",
    actorId,
    "metrics",
    "aggregated"
  ]);
}