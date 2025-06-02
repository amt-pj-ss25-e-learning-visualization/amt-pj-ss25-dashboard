import { ActorDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useActors() {
  // const { data, loading, error } = useApi<ActorDto[]>(`/actors`); //uncomment this when BE works
  const { data, loading, error } = useApi<ActorDto[]>("/actors/actors"); // delete this when BE works

  return {
    data: data || [],
    loading,
    error,
  };
}


export function useActorById(id?: string) {
  // const { data, loading, error } = useApi<ActorDto>(`/actors/${id}`); //uncomment this when BE works
  const { data, loading, error } = useApi<ActorDto>("/actors/actorById"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}

export function useActorsByRole(role?: string) {
  // const { data, loading, error } = useApi<ActorDto[]>(`/actors/role/${role}`); //uncomment this when BE works
  const { data, loading, error } = useApi<ActorDto[]>("/actors/actorsByRole"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}
