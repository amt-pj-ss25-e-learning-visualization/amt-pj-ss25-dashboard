import { useActor } from "@/context/actor-context";
import { useStatementsByActorAndModule } from "@/hooks/use-statements";
import { useMetrics } from "@/hooks/use-metrics";
import { SubModuleType } from "@/types/dto";
import { cn } from "@/lib/utils";
import { formatDuration } from "@/utils/date";
import { CheckCircle, Layers, Sparkles } from "lucide-react";
// Components
import ScoreChart from "../score-chart";
import Resource from "../resource";
import StarRating from "../star-rating";
import TimeMetric from "../time-metric";
import { MetricName } from "../../../../backend/features/metrics/metrics.types";

export const Submodule = ({ module }: { module: SubModuleType }) => {
  const { currentActor } = useActor();
  const { data: statements } = useStatementsByActorAndModule(
    module.id,
    currentActor?.id
  );
  const { data: metrics }: any = useMetrics(module.id, currentActor?.id);

  if (!statements || !metrics || !currentActor) return null;

  function getMetricValue(key: MetricName): number {
    const metric = metrics[key];
    const entry = metric.data.find((d: any) => d.actor === currentActor?.id);
    return entry?.value ?? metric.mean;
  }
  const completed = getMetricValue("completion") > 0;
  const visits = getMetricValue("totalVisits");
  const timeSpent = getMetricValue("timeSpent");
  const lastVisit = getMetricValue("lastVisit");
  const performance = getMetricValue("performance");
  const rating = getMetricValue("rating");

  return (
    <div
      className={cn(
        "pl-5 ml-2 border-l-2 border-blue-100 mt-6 space-y-2",
        completed ? "border-green-200" : ""
      )}
    >
      <div
        className={cn(
          "flex items-center gap-2 text-base font-medium text-blue-600",
          completed ? "text-green-500" : ""
        )}
      >
        <Layers className="w-4 h-4" />
        {module.title}
        {completed && (
          <span className="flex-1 flex justify-end">
            <CheckCircle />
          </span>
        )}
        {visits === 0 && (
          <Sparkles size={18} className="fill-amber-400 text-amber-300" />
        )}
      </div>
      {!completed && visits > 0 && (
        <TimeMetric
          timeSpent={formatDuration(timeSpent || 0)}
          lastVisit={formatDuration(lastVisit || 0)}
          visits={visits}
        />
      )}
      {performance !== undefined && (
        <ScoreChart
          max={100}
          score={Math.round(performance * 100)}
          mean={Math.round(metrics.performance.mean * 100)}
          passed={completed}
        />
      )}
      {module.resources.length &&
        module.resources.map((resource) => (
          <Resource key={resource.id} resource={resource} />
        ))}
      <div className="mt-4 mr-4 flex gap-2 w-full items-center justify-end">
        {metrics?.rating ? "Your rating of this module:" : "Rate this module:"}
        <StarRating rating={rating} of={5} />
      </div>
    </div>
  );
};
