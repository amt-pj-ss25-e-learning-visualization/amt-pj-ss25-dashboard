import { useApi } from "./use-api";
import { ModuleMetricsDTO } from "../../../backend/features/metrics/metrics.dto";

export function useMetrics(moduleId?: string, actorId?: string) {
  return useApi<ModuleMetricsDTO["response"]>([
    "modules",
    moduleId,
    "actors",
    actorId,
    "metrics",
  ]);
}
