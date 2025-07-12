import { Bar, BarChart, XAxis, YAxis } from "recharts";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from "@/components/ui/dialog";
import {
  ChartConfig,
  ChartContainer,
  ChartTooltip,
  ChartTooltipContent,
} from "@/components/ui/chart";
import { columnConfig, metricColors } from "./table-config";
import { MetricKey } from "@/types/dto";

const chartConfig = {
  value: {
    label: "Average",
  },
  classAverage: {
    label: "Class Average",
  },
  studentAverage: {
    label: "Student Average",
  },
} satisfies ChartConfig;

export default function Charts({
  metricKey,
  open,
  onOpenChange,
  metrics,
  studentId,
}: {
  metricKey: MetricKey | null;
  open: boolean;
  onOpenChange: (open: boolean) => void;
  metrics: Record<MetricKey, any>;
  studentId: string;
}) {
  if (!metricKey) return null;

  const selectedMetric = columnConfig.find((c) => c.key === metricKey)!;
  const classMean = metrics[metricKey].mean;
  const studentEnt = metrics[metricKey].data.find(
    (d: any) => d.actor === studentId
  )!;
  const studentMean = studentEnt.mean;
  const colors = metricColors[metricKey];

  const chartData = [
    { name: "studentAverage", value: studentMean, fill: colors.student },
    { name: "classAverage", value: classMean, fill: colors.class },
  ];

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent>
        <DialogHeader className="flex items-center justify-between">
          <div>
            <DialogTitle>{selectedMetric.label} Comparison</DialogTitle>
            <DialogDescription className="my-4">
              {selectedMetric.description}
            </DialogDescription>
          </div>
        </DialogHeader>

        <ChartContainer config={chartConfig}>
          <BarChart
            data={chartData}
            layout="vertical"
            margin={{ left: 20, right: 20 }}
            accessibilityLayer
          >
            <XAxis dataKey="value" type="number" hide />
            <YAxis
              dataKey="name"
              type="category"
              tickLine={false}
              tickMargin={10}
              axisLine={false}
              tickFormatter={(value) =>
                chartConfig[value as keyof typeof chartConfig]?.label
              }
            />
            <ChartTooltip
              formatter={(value: number) => selectedMetric.formatter(value)}
              cursor={false}
              content={<ChartTooltipContent />}
            />{" "}
            <Bar dataKey="value" layout="vertical" radius={5} />
          </BarChart>
        </ChartContainer>
      </DialogContent>
    </Dialog>
  );
}
