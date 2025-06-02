import { CourseDto, CourseDetailsDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useCourses() {
  // const { data, loading, error } = useApi<CourseDto[]>("/courses"); //uncomment this when BE works
  const { data, loading, error } = useApi<CourseDto[]>("/courses/courses"); // delete this when BE works
  return {
    data: data || [],
    loading,
    error,
  };
}

export function useCourseById(id?: string) {
  // const { data, loading, error } = useApi<CourseDetailsDto>(`/courses/${id}`); //uncomment this when BE works
  const { data, loading, error } = useApi<CourseDetailsDto>("/courses/courseById"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}
