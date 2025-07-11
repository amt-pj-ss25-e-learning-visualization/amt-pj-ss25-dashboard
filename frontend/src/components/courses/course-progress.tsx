import { CourseDetailsDto } from "@/types/dto";

import { ProgressChart } from "../progress-chart";
import { useCourseMetrics } from "@/hooks/use-metrics";
import { useActor } from "@/context/actor-context";
import ForgettingCurve from "../forgetting-curve";

export function CourseProgress({ course }: { course: CourseDetailsDto }) {
  const { currentActor } = useActor();
  const { data: metrics } = useCourseMetrics(course.id, currentActor?.id);
  return (
    <div>
      {currentActor?.role === "student" ? (
        <div className="">
          <ProgressChart course={course} />
        </div>
      ) : (
        <div></div>
      )}
    </div>
  );
}
