import { Area, AreaChart, CartesianGrid, XAxis, YAxis } from "recharts";
import {
  ChartConfig,
  ChartContainer,
  ChartLegend,
  ChartLegendContent,
  ChartTooltip,
  ChartTooltipContent,
} from "@/components/ui/chart";
import { AggregatedMetricObject } from "../../../../backend/features/metrics/metrics.types";
import { masteryColors, masteryDescription } from "@/utils/progress";
import { CourseDto } from "@/types/dto";
import { InfoIcon } from "lucide-react";
import { Tooltip, TooltipContent, TooltipTrigger } from "../ui/tooltip";

export default function ForgettingCurve({
  metrics,
  course,
}: {
  metrics: AggregatedMetricObject | null;
  course: CourseDto;
}) {
  if (!metrics) return null;

  const ebbValues = metrics.masteryEbbinghaus.data[0]?.values || [];
  const chartData = ebbValues.map((v, i) => ({
    module: `Month ${i + 1}`,
    ebb: v * 100,
  }));

  const chartConfig = {
    ebb: {
      label: "Ebbinghaus %",
      color: masteryColors.ebb,
    },
  } satisfies ChartConfig;

  return (
    <div className="space-y-2">
      <div className="flex items-center gap-2">
        <h3 className="text-xl font-semibold">
          Forgetting curve for {course.title} course
        </h3>
        <Tooltip>
          <TooltipTrigger asChild>
            <InfoIcon
              size={20}
              className="text-muted-foreground cursor-pointer"
            />
          </TooltipTrigger>
          <TooltipContent side="top" className="max-w-xs">
            {masteryDescription.ebb}
          </TooltipContent>
        </Tooltip>
      </div>

      <ChartContainer
        style={{ width: "100%", height: 250 }}
        config={chartConfig}
      >
        <AreaChart
          accessibilityLayer
          data={chartData}
          margin={{ top: 20, bottom: 0, left: 0, right: 0 }}
        >
          <CartesianGrid vertical={false} />
          <XAxis
            dataKey="module"
            tickLine={false}
            axisLine={false}
            tickMargin={8}
          />
          <YAxis
            domain={[0, 120]}
            tickFormatter={(value) => `${value.toFixed(0)}%`}
          />
          <ChartTooltip
            cursor={false}
            content={<ChartTooltipContent indicator="line" />}
          />
          <Area
            dataKey="ebb"
            type="natural"
            fill={masteryColors.ebb}
            stroke={masteryColors.ebb}
            fillOpacity={0.4}
          />
          <ChartLegend content={<ChartLegendContent />} />
        </AreaChart>
      </ChartContainer>
    </div>
  );
}
