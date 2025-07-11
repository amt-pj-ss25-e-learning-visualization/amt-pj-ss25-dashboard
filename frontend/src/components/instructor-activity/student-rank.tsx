import { useMemo } from "react";
import { useStatements } from "@/hooks/use-statements";
import { useActors } from "@/hooks/use-actors";
import {
  Table,
  TableHeader,
  TableBody,
  TableRow,
  TableHead,
  TableCell,
} from "@/components/ui/table";
import {
  Tooltip,
  TooltipTrigger,
  TooltipContent,
} from "@/components/ui/tooltip";
import { Info } from "lucide-react";

function StudentRank() {
  const { data: statements = [], loading, error } = useStatements();
  const { data: actors = [] } = useActors();

  const studentScores = useMemo(
    () =>
      statements
        .filter((s) => s.verb === "evaluated" && s.result?.score)
        .map((s) => ({
          actorId: s.actor_id!,
          raw: Number(s.result!.score!.raw),
        })),
    [statements]
  );

  // Group by student
  const grouped = useMemo(() => {
    const map: Record<string, { raws: number[] }> = {};
    for (const { actorId, raw } of studentScores) {
      if (!map[actorId]) map[actorId] = { raws: [] };
      map[actorId].raws.push(raw);
    }
    return Object.entries(map).map(([actorId, { raws }]) => {
      const avgRaw = raws.reduce((a, b) => a + b, 0) / raws.length;
      return { actorId, avgRaw };
    });
  }, [studentScores]);

  const sorted = useMemo(
    () => [...grouped].sort((a, b) => b.avgRaw - a.avgRaw),
    [grouped]
  );

  const findActor = (id: string) => actors.find((a) => a.id === id);

  if (loading) return <p className="text-sm">Loading student rankings…</p>;
  if (error)
    return <p className="text-sm text-red-500">Failed to load rankings.</p>;

  return (
    <div className="p-6 space-y-4">
      <div className="flex items-center space-x-2">
        <h3 className="text-2xl">
          Top 10 students across all modules (averages)
        </h3>
        <Tooltip>
          <TooltipTrigger asChild>
            <button className="p-1 rounded hover:bg-gray-100 focus:outline-none">
              <Info className="w-5 h-5 text-gray-500" />
            </button>
          </TooltipTrigger>
          <TooltipContent side="top" className="max-w-xs">
            <p className="text-sm">
              We take each student's raw scores from all "evaluated" statements,
              compute the arithmetic mean (sum of raw scores divided by number
              of statements), and then rank students by that average. Only the
              top 10 are shown here.
            </p>
          </TooltipContent>
        </Tooltip>
      </div>

      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>#</TableHead>
            <TableHead>Student</TableHead>
            <TableHead className="text-right">Average Score</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {sorted.slice(0, 10).map((row, id) => {
            const actor = findActor(row.actorId);
            return (
              <TableRow
                key={row.actorId}
                className={id <= 2 ? "bg-green-100" : ""}
              >
                <TableCell>{id + 1}</TableCell>
                <TableCell>{actor?.name ?? "Unknown"}</TableCell>
                <TableCell className="text-right">
                  {row.avgRaw.toFixed(1)}
                </TableCell>
              </TableRow>
            );
          })}
        </TableBody>
      </Table>
    </div>
  );
}

export default StudentRank;
