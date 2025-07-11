import { CourseDto, CourseDetailsDto } from "@/types/dto";
import { useApi } from "./use-api";

//Fetches a list of all courses from the API endpoint /courses
export function useCourses() {
  const { data, loading, error } = useApi<CourseDto[]>(["/courses"]);
  return {
    data: data || [],
    loading,
    error,
  };
}

// Fetches detailed information for a single course by its ID from the API endpoint /courses/{id}
export function useCourseById(id?: string) {
  const { data, loading, error } = useApi<CourseDetailsDto>([`/courses/`, id]);
  return {
    data,
    loading,
    error,
  };
}
