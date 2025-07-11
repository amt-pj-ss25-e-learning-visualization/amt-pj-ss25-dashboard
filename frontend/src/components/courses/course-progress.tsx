import { Card } from "@/components/ui/card";
import { CourseDetailsDto } from "@/types/dto";
import { TooltipProvider } from "@/components/ui/tooltip";
import { ProgressChart } from "../progress-chart";
import { useActor } from "@/context/actor-context";
import { useAggregatedMetrics } from "@/hooks/use-metrics";

export function CourseProgress({ course }: { course: CourseDetailsDto }) {
  const { currentActor } = useActor();
  const { data: aggregatedMetrics } = useAggregatedMetrics(
    course.id,
    currentActor?.id
  );

  if (currentActor?.role === "instructor") return null;

  return (
    <TooltipProvider>
      <Card className="p-4 space-y-4">
        {!aggregatedMetrics ? (
          <p className="text-red-600">
            Overall progress on this course is not available yet!
          </p>
        ) : (
          <ProgressChart
            actorId={currentActor?.id}
            data={aggregatedMetrics}
            course={course}
          />
        )}
      </Card>
    </TooltipProvider>
  );
}
