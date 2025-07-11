<<<<<<< HEAD
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
=======
import { BarChart, Bar, XAxis, YAxis } from "recharts";
import { useMemo, useState } from "react";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { Progress } from "@/components/ui/progress";
import { CourseDetailsDto } from "@/types/dto";
import { Info } from "lucide-react";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip";
import { useCourseMetrics } from "@/hooks/use-metrics";
import { useActor } from "@/context/actor-context";
import {
  ChartConfig,
  ChartContainer,
  ChartTooltip,
  ChartTooltipContent,
} from "../ui/chart";

const colors: Record<string, string> = {
  performance: "#60A5FA",
  mastery: "#6366F1",
  completion: "#0bbc5a",
};

const descriptions: Record<string, string> = {
  performance:
    "Performance measures your engagement and consistency in the course.",
  mastery: "Mastery reflects how well you understand the course material.",
  completion: "Completion shows how much of the course you've finished.",
};

const chartConfig = {
  performance: {
    label: "Performance",
    color: colors.performance,
  },
  mastery: {
    label: "Mastery",
    color: colors.Mastery,
  },
  completion: {
    label: "Completion",
    color: colors.Completion,
  },
} satisfies ChartConfig;

export function CourseProgress({ course }: { course: CourseDetailsDto }) {
  const [expanded, setExpanded] = useState(false);
  const { currentActor } = useActor();
  const { data: metrics } = useCourseMetrics(course.id, currentActor?.id);

  const data = useMemo(() => {
    if (!currentActor || !metrics) return undefined;
    const performance = Math.round(
      100 *
        (metrics.performance.data.find((d) => d.actor === currentActor.id)
          ?.mean || 0)
    );
    const mastery = Math.round(
      100 *
        (metrics.masteryEbbinghaus.data.find((d) => d.actor === currentActor.id)
          ?.mean || 0)
    );
    const completion = Math.round(
      100 *
        (metrics.completion.data.find((d) => d.actor === currentActor.id)
          ?.mean || 0)
    );
    return {
      actor: { performance, mastery, completion },
      avg: {
        performance: Math.round(100 * metrics.performance.mean),
        mastery: Math.round(100 * metrics.masteryEbbinghaus.mean),
        completion: Math.round(100 * metrics.completion.mean),
      },
    };
  }, [metrics]);

  if (!data || !currentActor) return null;
>>>>>>> 3d2c7b35fa57dd802e4ba1b36c647efec2a7f722

  return (
    <TooltipProvider>
      <Card className="p-4 space-y-4">
<<<<<<< HEAD
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
=======
        <div className="flex justify-between items-center">
          <h3 className="text-lg font-semibold text-blue-700">
            Overall learning progress for {course.title} course
          </h3>
          <Button
            variant="outline"
            size="sm"
            className="cursor-pointer"
            onClick={() => setExpanded((prev) => !prev)}
          >
            {expanded ? "Collapse" : "Expand stats"}
          </Button>
        </div>

        <ChartContainer
          className="h-15 border-1 rounded-2xl"
          config={chartConfig}
        >
          <BarChart
            layout="vertical"
            data={[data.actor]}
            margin={{ top: 0, bottom: 0, left: 8, right: 8 }}
          >
            <XAxis type="number" hide domain={[0, 300]} />
            <YAxis type="category" dataKey="name" hide />
            <ChartTooltip
              cursor={false}
              content={<ChartTooltipContent hideLabel className="w-[150px]" />}
            />
            <Bar
              dataKey="performance"
              stackId="a"
              fill={colors.performance}
              radius={[8, 0, 0, 8]}
            />
            <Bar dataKey="mastery" stackId="a" fill={colors.mastery} />
            <Bar
              dataKey="completion"
              stackId="a"
              fill={colors.completion}
              radius={[0, 8, 8, 0]}
            />
          </BarChart>
        </ChartContainer>

        {expanded && (
          <>
            <Separator />
            <div className="space-y-6">
              {Object.keys(data.actor).map((learningKey) => {
                const key = learningKey as
                  | "performance"
                  | "mastery"
                  | "completion";
                const value = data.actor[key];
                const classAvg = data.avg[key];

                return (
                  <div key={key}>
                    <div className="flex justify-between items-center text-sm font-medium mb-1">
                      <div className="flex items-center gap-1 capitalize">
                        {key}
                        <Tooltip>
                          <TooltipTrigger asChild>
                            <Info className="w-3 h-3 text-muted-foreground cursor-pointer" />
                          </TooltipTrigger>
                          <TooltipContent side="top" className="text-xs">
                            {descriptions[key]}
                          </TooltipContent>
                        </Tooltip>
                      </div>
                      <span className="text-muted-foreground">{value}%</span>
                    </div>

                    <div className="mb-2">
                      <Progress
                        value={value}
                        className="h-2"
                        progressColor={colors[key]}
                      />
                      <span className="text-xs text-muted-foreground ml-1">
                        You
                      </span>
                    </div>

                    <div className="relative mb-2">
                      <Progress
                        value={classAvg}
                        className="h-2 opacity-60"
                        progressColor={colors[key]}
                      />
                      <div className="absolute top-005 right-0 text-[10px] text-muted-foreground">
                        {classAvg}%
                      </div>
                      <span className="text-xs text-muted-foreground ml-1">
                        Class Average
                      </span>
                    </div>
                  </div>
                );
              })}
            </div>
          </>
>>>>>>> 3d2c7b35fa57dd802e4ba1b36c647efec2a7f722
        )}
      </Card>
    </TooltipProvider>
  );
}
