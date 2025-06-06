import { useNavigate, useParams } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { ArrowLeft } from "lucide-react";
import { useCourseById } from "@/hooks/use-courses";
import CourseDetails from "./course-details";

export default function CourseDetailsView() {
  const { id } = useParams();
  const { data: course, loading, error } = useCourseById(id);
  const navigate = useNavigate();

  if (loading) return <p className="text-sm">Loading course details...</p>;
  if (error || !course)
    return <p className="text-sm text-red-500">Error loading course</p>;

  return (
    <div className="p-4">
      <Button
        variant="ghost"
        className="mb-4 cursor-pointer"
        onClick={() => navigate("/courses")}
      >
        <ArrowLeft className="w-4 h-4 mr-2" /> Back to All Courses
      </Button>
      <CourseDetails course={course} />
    </div>
  );
}
