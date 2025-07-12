import { useState } from "react";
import { useActorsByRole } from "@/hooks/use-actors";
import { useCourseMetrics } from "@/hooks/use-metrics";
import {
  Select,
  SelectTrigger,
  SelectValue,
  SelectContent,
  SelectItem,
} from "@/components/ui/select";
import {
  Table,
  TableHeader,
  TableBody,
  TableRow,
  TableHead,
  TableCell,
} from "@/components/ui/table";
import { ChartBarBig, InfoIcon } from "lucide-react";
import {
  Tooltip,
  TooltipTrigger,
  TooltipContent,
} from "@/components/ui/tooltip";
import { CourseDetailsDto, MetricKey } from "@/types/dto";
import { columnConfig } from "./table-config";
import { cn } from "@/lib/utils";
import { Button } from "../ui/button";
import Charts from "./charts";

export default function CourseMetrics({
  course,
}: {
  course: CourseDetailsDto;
}) {
  const { data: students = [] } = useActorsByRole("student");
  const [studentId, setStudentId] = useState<string>("");
  const [openMetric, setOpenMetric] = useState<MetricKey | null>(null);

  const {
    data: metrics,
    loading,
    error,
  } = useCourseMetrics(course.id, studentId || undefined);

  const selector = (
    <div className="w-80 mb-6">
      <Select value={studentId} onValueChange={(v) => setStudentId(v)}>
        <SelectTrigger className="cursor-pointer">
          <SelectValue placeholder="Choose a student" />
        </SelectTrigger>
        <SelectContent>
          {students?.map((s) => (
            <SelectItem className="cursor-pointer" key={s.id} value={s.id}>
              {s.name}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  );

  if (!studentId) {
    return (
      <div className="p-6 space-y-4">
        {selector}
        <div className="p-4 bg-blue-50 rounded-md border border-blue-200">
          <h4 className="text-lg font-semibold">
            Compare a student with overall class for this course
          </h4>
          <p className="text-sm text-gray-700">
            Select one of your students above to see how they stack up against
            the class averages on key course metrics.
          </p>
        </div>
      </div>
    );
  }

  if (loading) return <p>Loading metrics...</p>;
  if (error) return <p className="text-red-500">Error loading metrics!</p>;
  if (!metrics) return null;

  const getStudentData = (key: MetricKey) =>
    metrics[key].data.find((d) => d.actor === studentId);

  return (
    <div>
      <div>{selector}</div>
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>Metric</TableHead>
            <TableHead className="text-right">Class Mean</TableHead>
            <TableHead className="text-right">Class Min</TableHead>
            <TableHead className="text-right">Class Max</TableHead>
            <TableHead className="text-right">
              {students?.find((s) => s.id === studentId)?.name}
            </TableHead>
            <TableHead className="text-right">Student Min</TableHead>
            <TableHead className="text-right">Student Max</TableHead>
            <TableHead>Compare</TableHead>
          </TableRow>
        </TableHeader>

        <TableBody>
          {columnConfig.map(({ key, label, formatter, description }) => {
            const classMetric: any = metrics[key];
            const studentEntry = getStudentData(key);
            const classMean = classMetric.mean;
            const studentMean = studentEntry?.mean ?? 0;

            return (
              <TableRow key={key}>
                <TableCell>
                  <div className="flex items-center gap-1">
                    {label}
                    <Tooltip>
                      <TooltipTrigger asChild>
                        <InfoIcon className="w-4 h-4 text-gray-400 cursor-pointer" />
                      </TooltipTrigger>
                      <TooltipContent side="top">{description}</TooltipContent>
                    </Tooltip>
                  </div>
                </TableCell>
                <TableCell className="text-right">
                  {formatter(classMetric.mean)}
                </TableCell>
                <TableCell className="text-right">
                  {formatter(classMetric.min)}
                </TableCell>
                <TableCell className="text-right">
                  {formatter(classMetric.max)}
                </TableCell>

                {studentEntry ? (
                  <>
                    <TableCell
                      className={cn(
                        "text-right",
                        studentMean >= classMean
                          ? "bg-green-100 text-green-800"
                          : "bg-red-100 text-red-800"
                      )}
                    >
                      {formatter(studentMean)}
                    </TableCell>

                    <TableCell className="text-right">
                      {formatter(studentEntry.min)}
                    </TableCell>

                    <TableCell className="text-right">
                      {formatter(studentEntry.max)}
                    </TableCell>
                  </>
                ) : (
                  <TableCell colSpan={3} className="text-center text-gray-400">
                    No data.
                  </TableCell>
                )}
                <TableCell>
                  <div className="flex items-start gap-2">
                    <Button
                      onClick={() => setOpenMetric(key)}
                      variant="ghost"
                      className="cursor-pointer"
                    >
                      <ChartBarBig />
                      View
                    </Button>
                  </div>
                </TableCell>
              </TableRow>
            );
          })}
        </TableBody>
      </Table>

      <Charts
        metricKey={openMetric}
        open={openMetric !== null}
        onOpenChange={(o) => !o && setOpenMetric(null)}
        metrics={metrics!}
        studentId={studentId}
      />
    </div>
  );
}
