import { useActor } from "@/context/actor-context";
import { useCourses } from "@/hooks/use-courses";
import { useModules } from "@/hooks/use-modules";
import { useStatements } from "@/hooks/use-statements";
import { Card } from "@/components/ui/card";
import {
  Table,
  TableHeader,
  TableBody,
  TableRow,
  TableHead,
  TableCell,
} from "@/components/ui/table";
import { Button } from "@/components/ui/button";
import { useNavigate } from "react-router-dom";
import { BookOpenText } from "lucide-react";

export default function StudentRecommendations() {
  const { currentActor } = useActor();
  const { data: courses = [] } = useCourses();
  const { data: modules = [] } = useModules();
  const { data: statements = [] } = useStatements();

  const navigate = useNavigate();

  if (!currentActor || !currentActor.id) return null;

  //Modules visited by student
  const visitedModuleIds = new Set(
    statements
      .filter((s) => s.actor_id === currentActor?.id)
      .map((s) => s.module_id)
  );

  // Courses visited based on module
  const visitedCourseIds = new Set(
    modules.filter((m) => visitedModuleIds.has(m.id)).map((m) => m.course_id)
  );

  // Courses student has not seen
  const newCourses = courses.filter((c) => !visitedCourseIds.has(c.id));

  return (
    <div className="py-4">
      <Card className="p-4">
        <h3 className="text-xl font-semibold mb-2">Explore new courses</h3>
        <p className="mb-4 text-sm text-muted-foreground">
          We've looked at every module you've already visited and are showing
          any courses you haven't touched yet. These are new opportunities to
          keep learning.
        </p>
        {newCourses.length === 0 ? (
          <p className="text-sm text-muted-foreground">
            You've tried all our courses!
          </p>
        ) : (
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>#</TableHead>
                <TableHead>Course</TableHead>
                <TableHead>Description</TableHead>
                <TableHead></TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {newCourses.map((course, i) => (
                <TableRow key={course.id}>
                  <TableCell>{i + 1}</TableCell>
                  <TableCell>{course.title}</TableCell>
                  <TableCell className="max-w-xs truncate">
                    {course.description}
                  </TableCell>
                  <TableCell className="text-right">
                    <Button
                      size="sm"
                      variant="outline"
                      className="cursor-pointer"
                      onClick={() => navigate(`/courses/${course.id}`)}
                    >
                      <span>View</span>
                      <span>
                        <BookOpenText />
                      </span>
                    </Button>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        )}
      </Card>
    </div>
  );
}
