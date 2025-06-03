import { ActorDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useActors() {
  const { data, loading, error } = useApi<ActorDto[]>([`/actors`]);
  return {
    data: data || [],
    loading,
    error,
  };
}

export function useActorById(id: string) {
  const { data, loading, error } = useApi<ActorDto>([`/actors/`, id]);
  return {
    data,
    loading,
    error,
  };
}

export function useActorsByRole(role: string) {
  const { data, loading, error } = useApi<ActorDto[]>([`/actors/role/`, role]);
  return {
    data,
    loading,
    error,
  };
}
