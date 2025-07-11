import { createContext, useContext, useState, useEffect } from "react";
import { useActors } from "@/hooks/use-actors";
import { ActorDto } from "@/types/dto";

type ActorContextType = {
  actors: ActorDto[];
  currentActor: ActorDto | null;
  setCurrentActor: (actor: ActorDto) => void;
};

const ActorContext = createContext<ActorContextType | undefined>(undefined);

/**Provides React context for switching between different user actors (students or instructors). Fetches available actors via the useActors hook and initializes the current actor.*/

export function ActorProvider({ children }: { children: React.ReactNode }) {
  const { data: actors } = useActors();
  const [currentActor, setCurrentActor] = useState<ActorDto | null>(null);

  useEffect(() => {
    if (!currentActor && actors.length > 0) {
      setCurrentActor(actors[0]);
    }
  }, [actors]);

  return (
    <ActorContext.Provider value={{ actors, currentActor, setCurrentActor }}>
      {children}
    </ActorContext.Provider>
  );
}

/**Custom hook to access the current actor context, including the list of actors and the active actor, and to switch the current actor.*/
export function useActor() {
  const context = useContext(ActorContext);
  if (!context) throw new Error("useActor must be used within ActorProvider");
  return context;
}
