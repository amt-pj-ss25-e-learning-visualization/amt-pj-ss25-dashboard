import { ModuleDto } from "@/types/dto";
import { useApi } from "./use-api";


// Fetches a list of all modules from the API endpoint /modules
export function useModules() {
  const { data, loading, error } = useApi<ModuleDto[]>(["/modules"]);
  return {
    data: data || [],
    loading,
    error,
  };
}

// Fetches details for a single module by its ID from the API endpoint /modules/{id}
export function useModuleById(id?: string) {
  const { data, loading, error } = useApi<ModuleDto>([`/modules/`, id]);
  return {
    data,
    loading,
    error,
  };
}


// Fetches modules associated with a specific course by calling the API endpoint /modules/course/{courseId}
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

// Fetches modules taught by a specific instructor via the API endpoint /modules/instructor/{instructorId}
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
