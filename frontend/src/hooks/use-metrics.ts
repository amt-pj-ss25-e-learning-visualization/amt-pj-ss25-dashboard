import { useApi } from "./use-api";
import {
  ModuleMetricsDTO,
  CourseMetricDTO,
} from "../../../backend/features/metrics/metrics.dto";

export function useModuleMetrics(moduleId: string, actorId?: string) {
  return useApi<ModuleMetricsDTO["response"]>([
    "modules",
    moduleId,
    actorId ? "actors" : undefined,
    actorId,
    "metrics",
  ]);
}

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
