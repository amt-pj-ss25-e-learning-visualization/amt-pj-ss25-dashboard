import { ActorDto } from "@/types/dto";
import { useApi } from "./use-api";

// Fetches a list of all actors (students or instructors) from the API endpoint /actors
export function useActors() {
  const { data, loading, error } = useApi<ActorDto[]>([`/actors`]);
  return {
    data: data || [],
    loading,
    error,
  };
}

// Fetches a single actor by its unique ID from the API endpoint /actors/{id}
export function useActorById(id: string) {
  const { data, loading, error } = useApi<ActorDto>([`/actors/`, id]);
  return {
    data,
    loading,
    error,
  };
}

// Fetches actors filtered by a specific role ("student" or "instructor") from the API endpoint /actors/role/{role}
export function useActorsByRole(role: string) {
  const { data, loading, error } = useApi<ActorDto[]>([`/actors/role/`, role]);
  return {
    data,
    loading,
    error,
  };
}
