import { StatementDto } from "@/types/dto";
import { useApi } from "./use-api";

export function useStatements() {
  const { data, loading, error } = useApi<StatementDto[]>(["/statements"]);
  return {
    data: data || [],
    loading,
    error,
  };
}

export function useStatementById(id: string) {
  const { data, loading, error } = useApi<StatementDto>(["statements", id]);
  return {
    data,
    loading,
    error,
  };
}

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
