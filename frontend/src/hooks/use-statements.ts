import { StatementDto } from "@/types/dto";
import { useApi } from "./use-api";

// Retrieves all statements from the API endpoint /statements
export function useStatements() {
  const { data, loading, error } = useApi<StatementDto[]>(["/statements"]);
  return {
    data: data || [],
    loading,
    error,
  };
}

// Fetches a single statement by its ID from the API endpoint /statements/{id}
export function useStatementById(id: string) {
  const { data, loading, error } = useApi<StatementDto>(["statements", id]);
  return {
    data,
    loading,
    error,
  };
}

// Fetches statements associated with a specific actor from the API endpoint /statements/actor/{actorId}
export function useStatementsByActor(actorId?: string) {
  const { data, loading, error } = useApi<StatementDto[]>([
    `/statements/actor/`,
    actorId,
  ]);
  return {
    data,
    loading,
    error,
  };
}

// Fetches statements related to a specific module from the API endpoint /statements/module/{moduleId}
export function useStatementsByModule(moduleId?: string) {
  const { data, loading, error } = useApi<StatementDto[]>([
    `/statements/module/`,
    moduleId,
  ]);
  return {
    data,
    loading,
    error,
  };
}

// Retrieves statements filtered by both module and actor via /statements/module/{moduleId}/actor/{actorId}
export function useStatementsByActorAndModule(
  moduleId?: string,
  actorId?: string
) {
  return useApi<StatementDto[]>([
    "statements/module",
    moduleId,
    "actor",
    actorId,
  ]);
}

// Fetches statements filtered by verb from the API endpoint /statements/verb/{verb}
export function useStatementsByVerb(verb?: string) {
  const { data, loading, error } = useApi<StatementDto[]>([
    `/statements/verb/`,
    verb,
  ]);
  return {
    data,
    loading,
    error,
  };
}
