import { DTO } from "../../common/types";
import { AggregatedMetricObject, MetricObject } from "./metrics.types";

export interface ModuleMetricsDTO extends DTO {
  params: {
    actorId: string;
    moduleId: string;
  };
  response: MetricObject;
}

export interface CourseScoreDTO extends DTO {
  params: {
    courseId: string;
    actorId: string;
  };
  response: AggregatedMetricObject;
}
