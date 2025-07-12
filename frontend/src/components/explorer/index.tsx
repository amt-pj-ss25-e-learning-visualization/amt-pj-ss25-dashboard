import { useState } from "react";
import { useStatements } from "@/hooks/use-statements";
import { useActors } from "@/hooks/use-actors";
import { useModules } from "@/hooks/use-modules";
import { useCourses } from "@/hooks/use-courses";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { formatDateTime } from "@/utils/date";
import { Button } from "@/components/ui/button";

export default function Explorer() {
  const [selectedVerb, setSelectedVerb] = useState<string | undefined>();
  const [page, setPage] = useState(1);
  const pageSize = 10;

  const { data: courses } = useCourses();
  const { data: actors } = useActors();
  const { data: modules } = useModules();
  const { data: statements, loading, error } = useStatements();

  if (loading) return <p className="text-sm">Loading statements...</p>;
  if (error)
    return <p className="text-sm text-red-500">Failed to load data.</p>;

  const filtered = selectedVerb
    ? statements.filter((s) => s.verb === selectedVerb)
    : statements;

  const totalPages = Math.ceil(filtered.length / pageSize);
  const paginated = filtered.slice((page - 1) * pageSize, page * pageSize);

  const allVerbs = Array.from(new Set(statements.map((s) => s.verb)));

  const getActor = (id?: string) => actors.find((a) => a.id === id);
  const getModule = (id?: string) => modules.find((m) => m.id === id);
  const getCourse = (id?: string) => {
    const module = getModule(id);
    return courses.find((c) => c.id === module?.course_id);
  };

  return (
    <div className="p-6">
      <div className="flex justify-between items-center">
        <h3 className="text-2xl">Statement Explorer</h3>
        <Select
          onValueChange={(v) => {
            setSelectedVerb(v);
            setPage(1);
          }}
        >
          <SelectTrigger className="w-40 cursor-pointer">
            <SelectValue placeholder="Filter by verb" />
          </SelectTrigger>
          <SelectContent>
            {allVerbs.map((verb) => (
              <SelectItem className="cursor-pointer" key={verb} value={verb}>
                {verb}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>

      <div className="w-full my-5">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Timestamp</TableHead>
              <TableHead>Verb</TableHead>
              <TableHead>Actor</TableHead>
              <TableHead>Role</TableHead>
              <TableHead>Module</TableHead>
              <TableHead>Course</TableHead>
              <TableHead>Score</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {paginated.map((s) => {
              const actor = getActor(s.actor_id);
              const module = getModule(s.module_id);
              const course = getCourse(s.module_id);
              const score = s.result?.score;

              return (
                <TableRow key={s.id}>
                  <TableCell>{formatDateTime(s.timestamp)}</TableCell>
                  <TableCell className="font-medium">{s.verb}</TableCell>
                  <TableCell>{actor?.name ?? "Unknown"}</TableCell>
                  <TableCell>{actor?.role ?? "-"}</TableCell>
                  <TableCell>{module?.title ?? "-"}</TableCell>
                  <TableCell>{course?.title ?? "-"}</TableCell>
                  <TableCell>
                    {score ? `${score.raw}/${score.max}` : "—"}
                  </TableCell>
                </TableRow>
              );
            })}
          </TableBody>
        </Table>
      </div>

      <div className="flex justify-between items-center mt-4">
        <p className="text-sm text-muted-foreground">
          Showing {(page - 1) * pageSize + 1}–
          {Math.min(page * pageSize, filtered.length)} of {filtered.length}
        </p>
        <div className="space-x-2">
          <Button
            className="cursor-pointer"
            variant="outline"
            size="sm"
            disabled={page === 1}
            onClick={() => setPage((p) => p - 1)}
          >
            Previous
          </Button>
          <Button
            className="cursor-pointer"
            variant="outline"
            size="sm"
            disabled={page === totalPages}
            onClick={() => setPage((p) => p + 1)}
          >
            Next
          </Button>
        </div>
      </div>
    </div>
  );
}
