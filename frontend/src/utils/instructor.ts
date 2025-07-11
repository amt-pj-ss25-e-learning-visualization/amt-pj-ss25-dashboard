import type { ModuleDto, ActorDto } from "@/types/dto";
import { url } from "@/lib/utils";
import { MetricObject } from "../../../backend/features/metrics/metrics.types";

const base = import.meta.env.VITE_SERVER;

export interface Summary {
  actorId: string;
  name: string;
  performance: number;
}

export async function fetchStudentSummaries(
  students: ActorDto[] | null,
  modules: ModuleDto[] | null,
): Promise<Summary[] | null> {

  async function fetchMetrics(
    moduleId: string,
    actorId: string
  ): Promise<MetricObject> {
    const res = await fetch(url(base, "modules", moduleId, "actors", actorId, "metrics"));
    if (!res.ok) throw new Error(res.statusText);
    return res.json();
  }

  if (!students || !modules) return null;

  return Promise.all(
    students.map(async (stu) => {
      const allMetrics = await Promise.all(
        modules.map((mod) => fetchMetrics(mod.id, stu.id))
      );

      const avgPerf =
        allMetrics.reduce((sum, m) => sum + m.performance.mean, 0) /
        (modules.length || 1);

      return {
        actorId: stu.id,
        name: stu.name,
        performance: avgPerf,
      };
    })
  );
}
