import { CourseDetailsDto } from "@/types/dto";
import { ProgressChart } from "../progress-chart";
import { useActor } from "@/context/actor-context";

export function CourseProgress({ course }: { course: CourseDetailsDto }) {
  const { currentActor } = useActor();
  return (
    <div>
      {currentActor?.role === "student" ? (
        <ProgressChart course={course} />
      ) : (
        <div></div>
      )}
    </div>
  );
}
