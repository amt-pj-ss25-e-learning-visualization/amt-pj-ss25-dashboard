import { ModuleDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useModules() {
  const { data, loading, error } = useApi<ModuleDto[]>(["/modules"]);
  return {
    data: data || [],
    loading,
    error,
  };
}

export function useModuleById(id?: string) {
  const { data, loading, error } = useApi<ModuleDto>([`/modules/`, id]);
  return {
    data,
    loading,
    error,
  };
}

export function useModulesByCourse(courseId?: string) {
  const { data, loading, error } = useApi<ModuleDto[]>([
    `/modules/course/`,
    courseId,
  ]);
  return {
    data,
    loading,
    error,
  };
}

export function useModulesByInstructor(instructorId?: string) {
  const { data, loading, error } = useApi<ModuleDto[]>([
    `/modules/instructor/`,
    instructorId,
  ]);
  return {
    data,
    loading,
    error,
  };
}
