import { CourseDto, CourseDetailsDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useCourses() {
  const { data, loading, error } = useApi<CourseDto[]>(["/courses"]);
  return {
    data: data || [],
    loading,
    error,
  };
}

export function useCourseById(id?: string) {
  const { data, loading, error } = useApi<CourseDetailsDto>([`/courses/`, id]);
  return {
    data,
    loading,
    error,
  };
}
