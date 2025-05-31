import { DTO } from "../../common/types";
import { Score } from "./metrics.types";

export interface TimeOnTaskDTO extends DTO {
  body: {
    objectId: string;
    courseId: string;
  };
}

export interface ScoreDTO extends DTO {
  params: {
    actorId: string;
    moduleId: string;
  };
  response: {
    /**
     * Is present when actor_id was passed as param and an actor was found
     */
    actor?: Score;
    module: {
      /**
       * Mean average of the actors' attempts
       */
      moduleAvgAttempts: number;
      /**
       * A value in `[0;1]` representing the ratio of actors that have completed the given task.
       */
      moduleCompletionRatio: number;
      /**
       * Highest scores achieved by the actors
       */
      overallAchievedScores: number[];
    };
  };
}
