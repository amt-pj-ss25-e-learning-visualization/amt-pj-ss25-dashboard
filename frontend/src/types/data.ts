export interface CourseData {
  courseId: string;
  courseName: string;
  progress: number;
  completed: boolean;
  attempts: number;
  averageScore: number;
  timeOnTaskMinutes: number;
  lastActivity: string;
}

export interface StudentData {
  studentId: string;
  name: string;
  courses: CourseData[];
}

export interface ProgressDonutType extends CourseData {
  chart: { status?: string; remaining?: number }[];
}

export interface TimeOnTaskType {
  name: string;
  minutes: number;
}

export interface AverageScoreType {
  name: string;
  score: number;
}

export interface AttemptsVsScoreType {
  name: string;
  attempts: number;
  score: number;
}

export interface LastActivityType {
  name: string;
  daysAgo: number;
}

export interface CompletionSummary {
  label?: string;
  value?: number;
}
