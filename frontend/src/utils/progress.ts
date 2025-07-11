import { PROGRESS_KEYS } from "@/types/dto";
import { AggregatedMetricObject } from "../../../backend/features/metrics/metrics.types";
import { ProgressMetrics } from "@/types/data";

// Configuration used for the colors on the progress chart
export const progressColors: Record<string, string> = {
  performance: "#60A5FA",
  masteryRaw: "#6366F1",
  completion: "#9CA3AF",
};

// Configuration used for showing the desciption on the progress chart
export const progresDescriptions: Record<string, string> = {
  attempts: "How many test attempts the student has made for this module.",
  performance: "The best test result achieved by the student in this module.",
  masteryRaw: "The student’s last evaluation score on this module’s content.",
  masteryEbbinghaus: "The mastery raw score adjusted for forgetting using the Ebbinghaus retention curve.",
  completion: "Indicates whether the student has passed (completed) this module.",
  timeSpent: "The total time the student has spent interacting with this module.",
  realVsExpectedTime: "The ratio of actual time spent per session to the expected time defined by the learning resource.",
  lastVisit: "The timestamp of the student’s most recent entry or exit of this module.",
  totalVisits: "The total number of times the student has opened or visited this module.",
  rating: "The student’s most recent star rating or feedback score for this module."
};


//Student progress data
export function getStudentMetrics(
  aggregated: AggregatedMetricObject,
  actorId: string
): ProgressMetrics {
  const studentData = {} as ProgressMetrics;
  PROGRESS_KEYS.forEach((key) => {
    const metric = aggregated[key];
    const entry = metric.data.find((d) => d.actor === actorId);
    studentData[key] = (entry?.mean ?? 0) * 100;
  });
  return studentData;
}

// Class Average progress data
export function getClassAverages(
  aggregated: AggregatedMetricObject
): ProgressMetrics {
  const classData = {} as ProgressMetrics;
  PROGRESS_KEYS.forEach((key) => {
    const metric = aggregated[key];
    classData[key] = metric.mean * 100;
  });
  return classData;
}