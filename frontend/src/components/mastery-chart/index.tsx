import { Bar, BarChart, XAxis, YAxis } from "recharts";
import { ChartConfig, ChartContainer } from "../ui/chart";

const masteryConfig = {
  current: { label: "Your current level" },
  delta: { label: "Your Current Mastery Level" },
  performance: { label: "performance" },
} satisfies ChartConfig;
const performanceConfig = {
  current: { label: "Your current level" },
  delta: { label: "Your Current Mastery Level" },
  performance: { label: "performance" },
} satisfies ChartConfig;

type Props = {
  raw: number;
  ebbinghaus: number;
  performance: number;
  passed: boolean;
  avgMastery: number;
  avgPerformance: number;
  attempts: number;
};

const MasteryChart = ({
  raw,
  ebbinghaus,
  performance,
  passed,
  avgMastery,
  avgPerformance,
  attempts,
}: Props) => {
  return (
    <div className="pl-4 flex gap-10 mt-4 mb-4">
      <div className="w-[50%]">
        <div className="flex justify-between mb-1">
          <span className="font-medium">Performance</span>
          <span>
            {performance}% ({attempts} attempts)
          </span>
        </div>
        <div className="relative mb-2">
          <div className="w-[100%] h-6 bg-gray-200 rounded-md absolute left-0 bottom-0" />
          <ChartContainer config={performanceConfig} className="w-[100%] h-6">
            <BarChart
              accessibilityLayer
              data={[{ label: "performance", current: performance }]}
              layout="vertical"
              margin={{ left: 3 }}
            >
              <YAxis dataKey="label" type="category" axisLine={false} hide />
              <XAxis dataKey="current" type="number" hide domain={[0, 100]} />
              <Bar
                fill={
                  passed ? "var(--color-green-500)" : "var(--color-blue-500)"
                }
                dataKey="current"
                layout="vertical"
                radius={5}
              />
            </BarChart>
          </ChartContainer>
        </div>
        Course Average: {avgPerformance}%
      </div>
      <div className="w-[50%]">
        <div className="flex justify-between mb-1">
          <span className="font-medium">Mastery</span>
          <span>
            {ebbinghaus}% {passed ? null : "(" + raw + "%)"}
          </span>
        </div>
        <div className="relative mb-2">
          <div className="w-[100%] h-6 bg-gray-200 rounded-md absolute left-0 bottom-0 " />
          <ChartContainer config={masteryConfig} className="w-[100%] h-6">
            <BarChart
              accessibilityLayer
              data={[
                {
                  label: "mastery",
                  current: ebbinghaus,
                  delta: raw - ebbinghaus,
                },
              ]}
              layout="vertical"
              margin={{ left: 3 }}
            >
              <YAxis dataKey="label" type="category" axisLine={false} hide />
              <XAxis dataKey="current" type="number" hide domain={[0, 100]} />
              <Bar
                dataKey="current"
                fill="var(--color-purple-800)"
                stackId="a"
                layout="vertical"
                radius={[4, 0, 0, 4]}
              />
              <Bar
                dataKey="delta"
                fill="var(--color-purple-300)"
                stackId="a"
                layout="vertical"
                radius={[0, 4, 4, 0]}
              />
            </BarChart>
          </ChartContainer>
        </div>
        Course Average: {avgMastery}%
      </div>
    </div>
  );
};
export default MasteryChart;
