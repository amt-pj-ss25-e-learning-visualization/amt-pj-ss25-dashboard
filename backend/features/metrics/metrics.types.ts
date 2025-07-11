export type Metric = {
  data: {
    actor: string;
    value: number;
  }[];
  mean: number;
  min: number;
  max: number;
};

export type AggregatedMetric = {
  data: {
    actor: string;
    values: number[];
    mean: number;
    min: number;
    max: number;
    sum: number;
  }[];
  mean: number;
  min: number;
  max: number;
  meanOfSums: number;
};

export const MetricNames = [
  "attempts",
  "performance",
  "masteryRaw",
  "masteryEbbinghaus",
  "completion",
  "timeSpent",
  "realVsExpectedTime",
  "lastVisit",
  "totalVisits",
  "rating",
] as const;
export type MetricName = (typeof MetricNames)[number];
export type MetricObject = {
  [metric in MetricName]: Metric;
};

export type AggregatedMetricObject = {
  [metric in MetricName]: AggregatedMetric;
};
