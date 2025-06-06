import { createContext, useContext, useState, useEffect } from "react";
import { useActors } from "@/hooks/use-actors";
import { ActorDto } from "@/types/dto";

type ActorContextType = {
  actors: ActorDto[];
  currentActor: ActorDto | null;
  setCurrentActor: (actor: ActorDto) => void;
};

const ActorContext = createContext<ActorContextType | undefined>(undefined);

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

export function useActor() {
  const context = useContext(ActorContext);
  if (!context) throw new Error("useActor must be used within ActorProvider");
  return context;
}
