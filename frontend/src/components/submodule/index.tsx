import { CheckCircle, InfoIcon, Layers, Sparkles } from "lucide-react";
import { useActor } from "@/context/actor-context";
import { useStatementsByActorAndModule } from "@/hooks/use-statements";
import { useModuleMetrics } from "@/hooks/use-metrics";
import { cn } from "@/lib/utils";
import { formatDuration } from "@/utils/date";
import StarRating from "../star-rating";
import TimeMetric from "../time-metric";
import ScoreChart from "../score-chart";
import Resource from "../resource";
import { ResourceType } from "@/types/dto";
import {
  Tooltip,
  TooltipTrigger,
  TooltipContent,
} from "@/components/ui/tooltip";

export const Submodule = ({ module }: any) => {
  const { currentActor } = useActor();
  const { data } = useStatementsByActorAndModule(module.id, currentActor?.id);
  const { data: metrics } = useModuleMetrics(module.id, currentActor?.id);

  if (!data || !metrics || !currentActor) return null;
  // TODO: make this part nicer
  const completed = !!metrics.completion.data.find(
    (d) => d.actor === currentActor.id
  )?.value;
  const visits =
    metrics.totalVisits.data.find((d) => d.actor === currentActor.id)?.value ||
    0;
  const timeSpent = metrics.timeSpent.data.find(
    (d) => d.actor === currentActor.id
  )?.value;
  const lastVisit = metrics.lastVisit.data.find(
    (d) => d.actor === currentActor.id
  )?.value;
  const performance = metrics.performance.data.find(
    (d) => d.actor === currentActor.id
  )?.value;
  const rating = metrics.rating.data.find(
    (d) => d.actor === currentActor.id
  )?.value;

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
        <span className="capitalize">{module.title}</span>
        {completed && (
          <span className="flex-1 flex justify-end">
            <CheckCircle />
          </span>
        )}
        {visits === 0 && (
          <Tooltip>
            <TooltipTrigger asChild>
              <div className="flex items-center gap-1 cursor-pointer">
                <Sparkles size={18} className="fill-amber-400 text-amber-300" />
                <InfoIcon color="blue" className="w-4 h-4 text-gray-500" />
              </div>
            </TooltipTrigger>
            <TooltipContent side="top">
              You haven't visited this submodule yet!
            </TooltipContent>
          </Tooltip>
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
          score={Math.round(performance * 100)}
          max={100}
          mean={Math.round(metrics.performance.mean * 100)}
          passed={completed}
        />
      )}
      {module.resources.length &&
        module.resources.map((resource: ResourceType) => (
          <Resource key={resource.id} resource={resource} />
        ))}
      <div className="mt-4 mr-4 flex gap-2 w-full items-center justify-end">
        {metrics?.rating ? "Your rating of this module:" : "Rate this module:"}
        <StarRating rating={rating} of={5} />
      </div>
    </div>
  );
};
