import { useApi } from "./use-api";
<<<<<<< HEAD
import { ModuleMetricsDTO, CourseScoreDTO } from "../../../backend/features/metrics/metrics.dto";


// Fetches module metrics for a given module and actor by calling the generic useApi hook with the appropriate endpoint segments
export function useMetrics(moduleId?: string, actorId?: string) {
=======
import {
  ModuleMetricsDTO,
  CourseMetricDTO,
} from "../../../backend/features/metrics/metrics.dto";

export function useModuleMetrics(moduleId: string, actorId?: string) {
>>>>>>> 3d2c7b35fa57dd802e4ba1b36c647efec2a7f722
  return useApi<ModuleMetricsDTO["response"]>([
    "modules",
    moduleId,
    actorId ? "actors" : undefined,
    actorId,
    "metrics",
  ]);
}

<<<<<<< HEAD
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
=======
export function useCourseMetrics(courseId: string, actorId?: string) {
  return useApi<CourseMetricDTO["response"]>([
    "courses",
    courseId,
    actorId ? "actors" : undefined,
    actorId,
    "metrics",
    "aggregated",
  ]);
}
>>>>>>> 3d2c7b35fa57dd802e4ba1b36c647efec2a7f722
