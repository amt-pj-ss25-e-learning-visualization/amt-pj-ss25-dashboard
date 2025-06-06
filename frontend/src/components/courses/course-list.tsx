import { languageLabel } from "@/utils/language";
import { Languages, Info, BookOpen, ArrowRight } from "lucide-react";
import {
  Card,
  CardHeader,
  CardTitle,
  CardContent,
  CardFooter,
} from "@/components/ui/card";
import { useCourses } from "@/hooks/use-courses";
import { Link } from "react-router-dom";

export default function CourseList() {
  const { data: courses, loading, error } = useCourses();

  if (loading) return <p className="text-sm">Loading courses...</p>;
  if (error)
    return <p className="text-sm text-red-500">Failed to load courses.</p>;
  if (!courses || courses.length === 0)
    return <p className="text-sm">No courses found.</p>;

  return (
    <div className="p-6">
      <h3 className="text-2xl">All Courses</h3>
      <div className="flex flex-col gap-6 my-6">
        {courses.map((course) => (
          <Link key={course.id} to={`/courses/${course.id}`}>
            <Card className="hover:border-blue-600 hover:shadow-lg transition-all cursor-pointer h-full">
              <CardHeader>
                <CardTitle className="flex items-center gap-2 text-lg">
                  <BookOpen className="w-5 h-5 text-blue-600" />
                  <span>{course.title}</span>
                </CardTitle>
              </CardHeader>
              <CardContent className="text-muted-foreground text-sm space-y-2">
                <div className="flex items-start gap-2">
                  <Info className="w-4 h-4 mt-0.5 text-gray-500" />
                  <p>{course.description}</p>
                </div>
              </CardContent>
              <CardFooter className="flex justify-between items-center text-sm">
                <div className="flex items-center gap-2 text-gray-600">
                  <Languages className="w-4 h-4" />
                  <span className="capitalize">
                    {languageLabel(course.language)}
                  </span>
                </div>
                <div className="flex items-center gap-1 text-blue-600 font-medium">
                  View Course
                  <ArrowRight className="w-4 h-4" />
                </div>
              </CardFooter>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  );
}
