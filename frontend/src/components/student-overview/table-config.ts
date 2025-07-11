import { MetricKey } from "@/types/dto";
import { formatDuration } from "@/utils/date";
import { progresDescriptions } from "@/utils/progress";

export const columnConfig: {
  key: MetricKey;
  color: string;
  label: string;
  formatter: (n: number) => string;
  description: string;
}[] = [
    {
      key: "attempts",
      label: "# of Attempts",
      formatter: (n) => n.toFixed(1),
      description: progresDescriptions.attempts,
      color: "",
    },
    {
      key: "performance",
      label: "Performance",
      formatter: (n) => `${(n * 100).toFixed(1)}%`,
      description: progresDescriptions.performance,
      color: "",
    },
    {
      key: "masteryRaw",
      label: "Mastery (raw)",
      formatter: (n) => `${(n * 100).toFixed(1)}%`,
      description: progresDescriptions.mastery,
      color: "",
    },
    {
      key: "masteryEbbinghaus",
      label: "Mastery (Ebbinghaus)",
      formatter: (n) => `${(n * 100).toFixed(1)}%`,
      description: progresDescriptions.masteryEbbinghaus,
      color: "",
    },
    {
      key: "completion",
      label: "Completion",
      formatter: (n) => `${(n * 100).toFixed(1)}%`,
      description: progresDescriptions.completion,
      color: "",
    },
    {
      key: "timeSpent",
      label: "Time Spent",
      formatter: (n) => formatDuration(n),
      description: progresDescriptions.timeSpent,
      color: "",
    },
    {
      key: "realVsExpectedTime",
      label: "Real vs. Expected Time",
      formatter: (n) => formatDuration(n),
      description: progresDescriptions.realVsExpectedTime,
      color: "",
    },
    {
      key: "lastVisit",
      label: "Last Visit",
      formatter: (n) => formatDuration(n),
      description: progresDescriptions.lastVisit,
      color: "",
    },
    {
      key: "totalVisits",
      label: "# of Total Visits",
      formatter: (n) => n.toFixed(1),
      description: progresDescriptions.totalVisits,
      color: "",
    },
    {
      key: "rating",
      label: "Rating",
      formatter: (n) => n.toFixed(1),
      description: progresDescriptions.rating,
      color: "",
    },
  ];

export const metricColors: Record<MetricKey, { student: string; class: string }> = {
  attempts: {
    student: "#10B981", // emerald-500
    class: "#6EE7B7", // emerald-300
  },

  performance: {
    student: "#3B82F6", // blue-500
    class: "#93C5FD", // blue-300
  },

  masteryRaw: {
    student: "#8B5CF6", // purple-500
    class: "#C4B5FD", // purple-300
  },

  masteryEbbinghaus: {
    student: "#7C3AED", // violet-500
    class: "#D8B4FE", // violet-300
  },

  completion: {
    student: "#14B8A6", // teal-500
    class: "#5EEAD4", // teal-300
  },

  timeSpent: {
    student: "#F59E0B", // amber-500
    class: "#FCD34D", // amber-300
  },

  realVsExpectedTime: {
    student: "#EF4444", // red-500
    class: "#FCA5A5", // red-300
  },

  lastVisit: {
    student: "#6366F1", // indigo-500
    class: "#A5B4FC", // indigo-300
  },

  totalVisits: {
    student: "#EC4899", // pink-500
    class: "#F9A8D4", // pink-300
  },

  rating: {
    student: "#EAB308", // yellow-500
    class: "#FDE047", // yellow-300
  },
};