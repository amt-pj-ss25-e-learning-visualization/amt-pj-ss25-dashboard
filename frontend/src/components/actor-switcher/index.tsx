import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { useActor } from "@/context/actor-context";

export default function ActorSwitcher() {
  const { actors, currentActor, setCurrentActor } = useActor();

  if (!actors.length) return <p className="text-sm">No actors found!</p>;
  if (!currentActor) return <p className="text-sm">Loading current actor...</p>;

  return (
    <div className="w-full mb-4">
      <Select
        onValueChange={(value: string) => {
          const selected = actors.find((actor) => actor.id === value);
          if (selected) setCurrentActor(selected);
        }}
        value={currentActor?.id}
      >
        <SelectTrigger className="w-full">
          <SelectValue placeholder="Select actor" />
        </SelectTrigger>
        <SelectContent>
          {actors.map((actor) => (
            <SelectItem key={actor.id} value={actor.id}>
              {actor.name} ({actor.role})
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  );
}
