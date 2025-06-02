import { ModuleDto, StatementDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useStatements() {
  // const { data, loading, error } = useApi<StatementDto[]>("/statements"); //uncomment this when BE works
  const { data, loading, error } = useApi<StatementDto[]>("/statements/statements"); // delete this when BE works
  return {
    data: data || [],
    loading,
    error,
  };
}

export function useStatementById(id?: string) {
  // const { data, loading, error } = useApi<StatementDto>(`/statements/${id}`); //uncomment this when BE works
  const { data, loading, error } = useApi<ModuleDto>("/statements/statementById"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}

export function useStatementsByActor(actorId?: string) {
  // const { data, loading, error } = useApi<StatementDto[]>(`/statements/actor/${actorId}`); //uncomment this when BE works
  const { data, loading, error } = useApi<StatementDto[]>("/statements/statementsByActor"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}

export function useStatementsByModule(moduleId?: string) {
  // const { data, loading, error } = useApi<StatementDto[]>(`/statements/module/${moduleId}`); //uncomment this when BE works
  const { data, loading, error } = useApi<StatementDto[]>("/statements/statementsByModule"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}

export function useStatementsByVerb(verb?: string) {
  // const { data, loading, error } = useApi<StatementDto[]>(`/statements/verb/${verb}`); //uncomment this when BE works
  const { data, loading, error } = useApi<StatementDto[]>("/statements/statementsByVerb"); // delete this when BE works
  return {
    data,
    loading,
    error,
  };
}
