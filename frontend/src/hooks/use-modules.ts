import { ModuleDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useModules() {
  // const { data, loading, error } = useApi<ModuleDto[]>("/modules"); //uncomment this when BE works
  const { data, loading, error } = useApi<ModuleDto[]>("/modules/modules"); // delete this when BE works
  return {
    data: data || [],
    loading,
    error,
  };
}

export function useModuleById(id?: string) {
  // const { data, loading, error } = useApi<ModuleDto>(`/modules/${id}`); //uncomment this when BE works
  const { data, loading, error } = useApi<ModuleDto>("/modules/moduleById"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}

export function useModulesByCourse(courseId?: string) {
  // const { data, loading, error } = useApi<ModuleDto[]>(`/modules/course/${courseId}`); //uncomment this when BE works
  const { data, loading, error } = useApi<ModuleDto[]>("/modules/modulesByCourse"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}

export function useModulesByInstructor(instructorId?: string) {
  // const { data, loading, error } = useApi<ModuleDto[]>(`/modules/instructor/${instructorId}`); //uncomment this when BE works
  const { data, loading, error } = useApi<ModuleDto[]>("/modules/modulesByInstructor"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}
