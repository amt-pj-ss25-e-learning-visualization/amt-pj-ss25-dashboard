import {
  Label,
  PolarGrid,
  PolarRadiusAxis,
  RadialBar,
  RadialBarChart,
} from "recharts";
import { ChartContainer, ChartTooltip, ChartTooltipContent } from "../ui/chart";

const ScoreChart = ({
  score,
  max,
  mean,
  passed,
}: {
  score: number;
  max: number;
  mean: number;
  passed: boolean;
}) => {
  const chartData = [
    {
      label: "avg",
      score: mean,
      fill: "var(--color-gray-200)",
    },
    {
      label: "actor",
      score: score,
      fill: passed ? "var(--color-green-500)" : "var(--color-blue-500)",
    },
    { label: "max", score: max, fill: "transparent" },
  ];

  return (
    <div>
      <ChartContainer
        config={{
          avg: {
            label: "Avg. Student Score",
          },
          actor: {
            label: "Your Highscore",
          },
        }}
        className="mx-auto aspect-square max-h-[250px]"
      >
        <RadialBarChart
          data={chartData}
          startAngle={90}
          endAngle={450}
          innerRadius={80}
          outerRadius={120}
        >
          <ChartTooltip
            content={
              <ChartTooltipContent className="w-40" hideLabel nameKey="label" />
            }
          />
          <PolarGrid
            gridType="circle"
            radialLines={false}
            stroke="none"
            polarRadius={[86, 74]}
          />
          <RadialBar dataKey="score" background cornerRadius={10} />
          <PolarRadiusAxis tick={false} tickLine={false} axisLine={false}>
            <Label
              content={({ viewBox }) => {
                if (viewBox && "cx" in viewBox && "cy" in viewBox) {
                  return (
                    <text
                      x={viewBox.cx}
                      y={viewBox.cy}
                      textAnchor="middle"
                      dominantBaseline="middle"
                    >
                      <tspan
                        x={viewBox.cx}
                        y={viewBox.cy}
                        className="fill-foreground text-4xl font-bold"
                      >
                        {chartData[1].score.toLocaleString()}
                      </tspan>
                      <tspan
                        x={viewBox.cx}
                        y={(viewBox.cy || 0) + 30}
                        className="fill-muted-foreground"
                      >
                        Your score
                      </tspan>
                      <tspan
                        x={viewBox.cx}
                        y={(viewBox.cy || 0) + 45}
                        className="fill-muted-foreground"
                      >
                        of {max}
                      </tspan>
                    </text>
                  );
                }
              }}
            />
          </PolarRadiusAxis>
        </RadialBarChart>
      </ChartContainer>
    </div>
  );
};
export default ScoreChart;
