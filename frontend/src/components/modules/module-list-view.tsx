import { useModules } from "@/hooks/use-modules";
import { useCourses } from "@/hooks/use-courses";
import { useActorsByRole } from "@/hooks/use-actors";
import { useState } from "react";
import { Link } from "react-router-dom";
import {
  Card,
  CardHeader,
  CardTitle,
  CardContent,
  CardFooter,
} from "@/components/ui/card";
import { Folder, User, ArrowRight, GraduationCap } from "lucide-react";
import {
  Select,
  SelectTrigger,
  SelectValue,
  SelectContent,
  SelectItem,
} from "@/components/ui/select";
import { Button } from "@/components/ui/button";

export default function ModuleListView() {
  const { data: courses } = useCourses();
  const { data: instructors } = useActorsByRole("instructor");
  const { data: modules } = useModules();

  const [selectedCourseId, setSelectedCourseId] = useState("");
  const [selectedInstructorId, setSelectedInstructorId] = useState("");

  const filteredModules = modules.filter((mod) => {
    return (
      (!selectedCourseId || mod.course_id === selectedCourseId) &&
      (!selectedInstructorId || mod.instructor_id === selectedInstructorId)
    );
  });

  return (
    <div className="p-6">
      <h3 className="text-2xl mb-4">All Modules</h3>
      <div className="flex gap-4 flex-wrap my-5">
        <Select onValueChange={setSelectedCourseId}>
          <SelectTrigger className="w-64 cursor-pointer">
            <SelectValue placeholder="Filter by Course" />
          </SelectTrigger>
          <SelectContent>
            {courses.map((c) => (
              <SelectItem className="cursor-pointer" key={c.id} value={c.id}>
                {c.title}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <Select onValueChange={setSelectedInstructorId}>
          <SelectTrigger className="w-64 cursor-pointer">
            <SelectValue placeholder="Filter by Instructor" />
          </SelectTrigger>
          <SelectContent>
            {instructors?.map((i) => (
              <SelectItem className="cursor-pointer" key={i.id} value={i.id}>
                {i.name}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <Button
          className="cursor-pointer"
          variant="outline"
          onClick={() => {
            setSelectedCourseId("");
            setSelectedInstructorId("");
          }}
        >
          Reset Filters
        </Button>
      </div>

      {filteredModules.length === 0 ? (
        <p className="text-sm">No modules match your filters.</p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {filteredModules.map((mod) => (
            <Card key={mod.id} className="hover:shadow-md transition">
              <CardHeader>
                <CardTitle className="flex items-center gap-2 text-blue-800">
                  <Folder className="w-4 h-4" />
                  {mod.title}
                </CardTitle>
              </CardHeader>
              <CardContent className="text-sm text-gray-600 space-y-1">
                <div className="flex items-center gap-2">
                  <GraduationCap className="w-4 h-4" />
                  Course ID: {mod.course_id}
                </div>
                <div className="flex items-center gap-2">
                  <User className="w-4 h-4" />
                  Instructor: {mod.instructor_id || "Not assigned"}
                </div>
              </CardContent>
              <CardFooter className="justify-end">
                <Link
                  to={`/modules/${mod.id}`}
                  className="text-blue-600 hover:underline flex items-center gap-1"
                >
                  View Details
                  <ArrowRight className="w-4 h-4" />
                </Link>
              </CardFooter>
            </Card>
          ))}
        </div>
      )}
    </div>
  );
}
