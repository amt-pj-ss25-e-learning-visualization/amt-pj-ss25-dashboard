import ActorSwitcher from "../actor-switcher";
import { useActor } from "@/context/actor-context";
import ActorActivity from "../actor-activity";

export default function Dashboard() {
  const { currentActor } = useActor();

  return (
    <div className="p-4">
      <ActorSwitcher />
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
      <ActorActivity />
    </div>
  );
}
