import { createContext, useContext, useState, useEffect, useRef } from "react";
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
  const [currentActor, setCurrentActorState] = useState<ActorDto | null>(null);
  const initialized = useRef(false);

  const setCurrentActor = (actor: ActorDto) => {
    localStorage.setItem("selectedActorId", actor.id);
    setCurrentActorState(actor);
  };

  useEffect(() => {
    if (actors.length === 0) return;

     if (!initialized.current) {
       initialized.current = true;

       const saved = localStorage.getItem("selectedActorId");
       const found = saved ? actors.find((a) => a.id === saved) : null;
       setCurrentActorState(found || actors[0]);
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
