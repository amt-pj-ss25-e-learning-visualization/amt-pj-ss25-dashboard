import { CourseDetailsDto, StatementDto } from "@/types/dto";
import { CheckCircle, Layers, Sparkles } from "lucide-react";
import { Ressource } from "../ressource";
import { useActor } from "@/context/actor-context";
import { useStatementsByActorAndModule } from "@/hooks/use-statements";
import { useMemo } from "react";
import { parseISO8601 } from "../../../../backend/common/utils";
import { ISO8601Duration } from "../../../../backend/common/types";
import { useScore } from "@/hooks/use-metrics";
import { cn } from "@/lib/utils";
import { StarRating } from "../rating";
import { TimeMetric } from "../timeMetric";
import { Score } from "../score";
import { formatDuration } from "@/utils/date";

type Module = CourseDetailsDto["modules"][number]["submodules"][number];

type Props = {
  module: Module;
};

const initialized = (s: StatementDto) => s.verb === "initialized";
const rated = (s: StatementDto) => s.verb === "rated";
const exited = (s: StatementDto) => s.verb === "exited";
const scored = (s: StatementDto) => s.verb === "scored";
const sortRecency = (a: StatementDto, b: StatementDto) =>
  new Date(b.timestamp).getTime() - new Date(a.timestamp).getTime();

export const Submodule = ({ module }: Props) => {
  const { currentActor } = useActor();
  const { data } = useStatementsByActorAndModule(module.id, currentActor?.id);
  const { data: score } = useScore(module.id, currentActor?.id);
  const metrics = useMemo(() => {
    if (!data) return {};
    const visited = data.filter(initialized).length;
    const timeSpentInMilliseconds =
      data
        .filter(exited)
        .map((s) =>
          s.result?.duration
            ? parseISO8601(s.result?.duration as ISO8601Duration)
            : 0
        )
        .reduce((prev, curr) => prev + curr, 0) *
      60 *
      1000;
    const timeSpent =
      timeSpentInMilliseconds === 0
        ? undefined
        : formatDuration(timeSpentInMilliseconds);
    const exitsSorted = data.filter(exited).sort(sortRecency);
    const timeSinceLastVisit = exitsSorted.length
      ? formatDuration(
          Date.now() - new Date(exitsSorted[0].timestamp).getTime()
        )
      : undefined;
    const ratedSorted = data.filter(rated).sort(sortRecency);
    const rating = ratedSorted.length
      ? ratedSorted[0].result?.score
      : undefined;
    const scoredData = data.filter(scored);
    const maxScore = scoredData[0]
      ? scoredData[0].result?.score?.max
      : undefined;

    return {
      visited,
      timeSpent,
      timeSinceLastVisit,
      rating,
      score,
      maxScore,
    };
  }, [data, score]);

  if (!data) return null;

  return (
    <div
      className={cn(
        "pl-5 ml-2 border-l-2 border-blue-100 mt-6 space-y-2",
        metrics.score?.actor?.completed ? "border-green-200" : ""
      )}
    >
      <div
        className={cn(
          "flex items-center gap-2 text-base font-medium text-blue-600",
          metrics.score?.actor?.completed ? "text-green-500" : ""
        )}
      >
        <Layers className="w-4 h-4" />
        {module.title}
        {metrics.score?.actor?.completed && (
          <span className="flex-1 flex justify-end">
            <CheckCircle />
          </span>
        )}
        {metrics.visited === 0 && (
          <Sparkles size={18} className="fill-amber-400 text-amber-300" />
        )}
      </div>
      {!metrics.score?.actor?.completed && (
        <TimeMetric
          timeSpent={metrics.timeSpent}
          lastVisit={metrics.timeSinceLastVisit}
          visits={metrics.visited}
        />
      )}
      {/* TODO: Attempts */}
      {/* TODO: Completion ratio */}
      {metrics.score && metrics.maxScore && (
        <Score score={metrics.score} max={metrics.maxScore} />
      )}
      {module.resources.length &&
        module.resources.map((ressource) => (
          <Ressource key={ressource.id} ressource={ressource} />
        ))}
      <div className="mt-4 mr-4 flex gap-2 w-full items-center justify-end">
        {metrics?.rating ? "Your rating of this module:" : "Rate this module:"}
        <StarRating rating={metrics?.rating?.raw} of={metrics?.rating?.max} />
      </div>
    </div>
  );
};
