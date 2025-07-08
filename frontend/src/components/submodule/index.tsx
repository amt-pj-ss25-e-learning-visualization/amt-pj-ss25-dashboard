import { CourseDetailsDto } from "@/types/dto";
import { CheckCircle, Layers, Sparkles } from "lucide-react";
import { Ressource } from "../ressource";
import { useActor } from "@/context/actor-context";
import { useStatementsByActorAndModule } from "@/hooks/use-statements";
import { useMetrics } from "@/hooks/use-metrics";
import { cn } from "@/lib/utils";
import { StarRating } from "../rating";
import { TimeMetric } from "../timeMetric";
import { Score } from "../score";

type Module = CourseDetailsDto["modules"][number]["submodules"][number];

type Props = {
  module: Module;
};

const formatDuration = (milli: number): string => {
  const totalSeconds = Math.floor(milli / 1000);
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);

  return `${hours}h ${minutes}m`;
};

export const Submodule = ({ module }: Props) => {
  const { currentActor } = useActor();
  const { data } = useStatementsByActorAndModule(module.id, currentActor?.id);
  const { data: metrics } = useMetrics(module.id, currentActor?.id);

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
        <Score
          score={Math.round(performance * 100)}
          max={100}
          mean={Math.round(metrics.performance.mean * 100)}
          passed={completed}
        />
      )}
      {module.resources.length &&
        module.resources.map((ressource) => (
          <Ressource key={ressource.id} ressource={ressource} />
        ))}
      <div className="mt-4 mr-4 flex gap-2 w-full items-center justify-end">
        {metrics?.rating ? "Your rating of this module:" : "Rate this module:"}
        <StarRating rating={rating} of={5} />
      </div>
    </div>
  );
};
