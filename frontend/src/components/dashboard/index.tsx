import { useActor } from "@/context/actor-context";
import StudentActivity from "../student-activity";
import InstructorActivity from "../instructor-activity";

export default function Dashboard() {
  const { currentActor } = useActor();

  return (
    <div className="p-4">
      {!currentActor ? (
        <p className="text-muted-foreground text-sm">
          Please select an actor to view dashboard data.
        </p>
      ) : (
        <div className="flex flex-col my-4">
          <p className="text-lg font-medium">
            Welcome, {currentActor.name} ({currentActor.role})
          </p>
        </div>
      )}
      {currentActor?.role === "student" && (
        <StudentActivity currentActor={currentActor} />
      )}
      {currentActor?.role === "instructor" && (
        <InstructorActivity currentActor={currentActor} />
      )}
    </div>
  );
}
