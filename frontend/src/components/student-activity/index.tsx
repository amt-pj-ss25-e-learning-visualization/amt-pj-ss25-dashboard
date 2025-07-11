import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip,
  ResponsiveContainer,
} from "recharts";
import { useStatementsByActor } from "@/hooks/use-statements";
import { ActorDto, StatementDto } from "@/types/dto";
import { Folder, FileText, Clock } from "lucide-react";
import { formatDateTime } from "@/utils/date";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import StudentRecommendations from "../student-recommendations";

export default function StudentActivity({
  currentActor,
}: {
  currentActor: ActorDto;
}) {
  const {
    data: statements,
    loading,
    error,
  } = useStatementsByActor(currentActor?.id);

  if (!currentActor) return null;
  if (loading) return <p className="text-sm">Loading student activity...</p>;
  if (error)
    return <p className="text-sm text-red-500">Failed to load activity.</p>;
  if (!statements?.length)
    return <p className="text-sm">No activity found for this student.</p>;

  // Group statements by moduleId
  const grouped = statements.reduce(
    (acc: Record<string, StatementDto[]>, statement) => {
      const key = statement.module_id;
      if (!acc[key]) acc[key] = [];
      acc[key].push(statement);
      return acc;
    },
    {}
  );

  // Chart data for verb frequency
  const verbFrequency = statements.reduce((acc: Record<string, number>, s) => {
    acc[s.verb] = (acc[s.verb] || 0) + 1;
    return acc;
  }, {});
  const chartData = Object.entries(verbFrequency).map(([verb, count]) => ({
    verb,
    count,
  }));

  return (
    <div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card className="w-full">
          <CardHeader>
            <CardTitle className="text-lg text-blue-700">
              {currentActor.name}'s Activity Overview
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4 max-h-[500px] overflow-y-auto pr-2">
            {Object.entries(grouped).map(([moduleId, moduleStatements]) => (
              <div
                key={moduleId}
                className="border rounded-md p-4 shadow-sm bg-gray-50"
              >
                <h3 className="text-md font-semibold flex gap-2 items-center text-blue-900">
                  <Folder className="w-4 h-4" /> Module ID: {moduleId}
                </h3>
                <ul className="pl-4 mt-2 text-sm space-y-2">
                  {moduleStatements.map((s) => (
                    <li
                      key={s.id}
                      className="text-gray-700 flex items-start gap-2"
                    >
                      <FileText className="w-4 h-4 mt-0.5" />
                      <span>
                        <strong>{s.verb}</strong> –{" "}
                        {s.result?.score
                          ? `Scored ${s.result.score.raw}/${s.result.score.max}`
                          : "No score"}{" "}
                        –{" "}
                        <span className="text-gray-500 text-xs flex items-center gap-1">
                          <Clock className="w-3 h-3" />
                          {formatDateTime(s.timestamp)}
                        </span>
                      </span>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </CardContent>
        </Card>

        <Card className="w-full">
          <CardHeader>
            <CardTitle className="text-lg text-blue-700">
              Activity Frequency by Verb
            </CardTitle>
          </CardHeader>
          <CardContent className="h-[500px]">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={chartData}>
                <XAxis dataKey="verb" />
                <YAxis allowDecimals={false} />
                <Tooltip />
                <Bar dataKey="count" fill="#3b82f6" />
              </BarChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>
      </div>

      <StudentRecommendations />
    </div>
  );
}
