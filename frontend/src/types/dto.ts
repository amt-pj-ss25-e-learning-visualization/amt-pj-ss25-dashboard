export interface ActorDto {
  id: string;
  mail: string;
  name: string;
  role: string;
}

export interface CourseDto {
  id: string;
  title: string;
  description: string;
  language: string;
}

export interface CourseDetailsDto {
  id: string;
  title: string;
  description: string;
  language: string;
  modules: {
    id: string;
    parent_id: string | null;
    title: string;
    instructor: {
      id: string;
      mail: string;
      name: string;
      role: string;
    } | null;
    resources: any[];
    submodules: {
      id: string;
      parent_id: string;
      title: string;
      instructor: null;
      resources: {
        id: string;
        title: string;
        description: string;
        language: string;
        interactivity_type: string;
        interactivity_level: string;
        learning_resource_type: string;
        semantic_density: string;
        difficulty: string;
        typical_learning_time: string;
      }[];
      submodules: [];
    }[];
  }[];
}

export interface ModuleDto {
  id: string;
  course_id: string;
  title: string;
  instructor_id: string | null;
  parent_id?: string | null;
  submodules?: any;
  instructor?: any;
  course?: any;
}

export type Score = {
  max?: number;
  min?: number;
  raw?: number;
  scaled?: number;
};

export type Result = {
  score?: Score;
  success?: boolean;
  completion?: boolean;
  response?: string;
  duration?: string;
  extensions?: Record<string, any>;
};

export type StatementDto = {
  id: string;
  actor?: ActorDto;
  actor_id?: string;
  module_id: string;
  module?: ModuleDto;
  verb: string;
  result?: Result | null;
  timestamp: string | Date;
};

export type SubModuleType = CourseDetailsDto["modules"][number]["submodules"][number];

export type ResourceType = CourseDetailsDto["modules"][number]["submodules"][number]["resources"][number];

export type ModuleType = CourseDetailsDto["modules"][number];

export const PROGRESS_KEYS = ["performance", "masteryRaw", "completion"] as const;
export type ProgressType = typeof PROGRESS_KEYS[number];

export type MetricKey =
  | "attempts"
  | "performance"
  | "masteryRaw"
  | "masteryEbbinghaus"
  | "completion"
  | "timeSpent"
  | "realVsExpectedTime"
  | "lastVisit"
  | "totalVisits"
  | "rating";

export type RecommenderDto = {
  id: string;
  course_id: string;
  parent_id: string | null;
  title: string;
  instructor_id: string;
}