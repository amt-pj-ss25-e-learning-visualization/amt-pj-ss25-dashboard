import { ScoreDTO } from "./metrics.dto";
import { Request, Response } from "../../common/types";
import { Metrics } from "./metrics.service";
import { Statement } from "../statements/statements.model";

class MetricsController {
  async moduleScore(req: Request<ScoreDTO>, res: Response<ScoreDTO>) {
    try {
      const { moduleId, actorId } = req.params;
      if (!moduleId) {
        res.status(400).json({ message: "Module id missing in path" });
        return;
      }
      const statements = await Statement.findAll({
        where: {
          module_id: moduleId,
          verb: ["completed", "scored", "failed"],
        },
      });
      const metrics = new Metrics(statements).compute(
        "moduleScore",
        "moduleAvgAttempts",
        "moduleCompletionRatio"
      );
      const { moduleScore, moduleAvgAttempts, moduleCompletionRatio } =
        metrics.computed;
      res.json({
        actor: moduleScore[actorId],
        module: {
          moduleAvgAttempts,
          moduleCompletionRatio,
          overallAchievedScores: Object.keys(moduleScore).map(
            (key) => moduleScore[key].highestScore
          ),
        },
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Failed to fetch metric", error });
    }
  }
}

export default MetricsController;
