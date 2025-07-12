import { ModuleDto } from "@/types/dto";
import { useState } from "react";
import { useActorsByRole } from "@/hooks/use-actors";
import { useModuleMetrics } from "@/hooks/use-metrics";
import {
  Select,
  SelectTrigger,
  SelectValue,
  SelectContent,
  SelectItem,
} from "@/components/ui/select";
import { CardContent } from "../ui/card";
import { formatDuration } from "@/utils/date";

export default function ModuleMetrics({ module }: { module: ModuleDto }) {
  const { data: students = [] } = useActorsByRole("student");
  const [studentId, setStudentId] = useState<string>("");

  const {
    data: metrics,
    loading,
    error,
  } = useModuleMetrics(module.id, studentId || undefined);

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
            Compare a student with overall class for this module
          </h4>
          <p className="text-sm text-gray-700">
            Select one of your students above to see how they stack up against
            the class averages on key module metrics.
          </p>
        </div>
      </div>
    );
  }

  if (loading) return <p>Loading metrics...</p>;
  if (error) return <p className="text-red-500">Error loading metrics!</p>;
  if (!metrics) return null;

  const hasMetrics =
    metrics && Object.values(metrics).some((m) => m.mean !== null);

  return (
    <CardContent>
      <div>{selector}</div>
      {studentId && (
        <div>
          {!hasMetrics ? (
            <p className="text-sm text-gray-500">
              No metrics available for student or module.
            </p>
          ) : loading ? (
            <p>Loading metrics...</p>
          ) : (
            <div className="grid grid-cols-2 gap-4">Class Averages</div>
          )}
        </div>
      )}
    </CardContent>
  );
}
