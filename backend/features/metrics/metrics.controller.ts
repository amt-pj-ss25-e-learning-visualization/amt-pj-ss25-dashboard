import { CourseScoreDTO, ModuleMetricsDTO } from "./metrics.dto";
import { Request, Response } from "../../common/types";
import { Metrics } from "./metrics.service";
import { Module } from "../modules/modules.model";
import { LearningResource } from "../learningResources/learningResources.model";

class MetricsController {
  async getModuleMetrics(
    req: Request<ModuleMetricsDTO>,
    res: Response<ModuleMetricsDTO>
  ) {
    try {
      const { moduleId, actorId } = req.params;
      if (!moduleId) {
        res.status(400).json({ message: "Module id missing in path" });
        return;
      }
      const metrics = await Metrics.compute(moduleId);
      if (!actorId) {
        res.json(metrics);
        return;
      }
      const filteredByActor: any = {};
      for (const metric in metrics) {
        const filteredData = metrics[
          metric as keyof typeof metrics
        ].data.filter((d) => d.actor === actorId);
        filteredByActor[metric] = {
          ...metrics[metric as keyof typeof metrics],
          data: filteredData,
        };
      }
      res.json(filteredByActor);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Failed to fetch metric", error });
    }
  }

  async getCourseMetrics(
    req: Request<CourseScoreDTO>,
    res: Response<CourseScoreDTO>
  ) {
    try {
      const { courseId, actorId } = req.params;
      const modules = (
        (await Module.findAll({
          where: { course_id: courseId },
          include: [
            {
              model: LearningResource,
              as: "resources",
            },
          ],
        })) as (Module & { resources: LearningResource[] })[]
      ).filter((mod) => mod.resources.length);

      if (!modules.length) {
        res
          .status(404)
          .json({ message: "Course doesn't exist or has no modules!" });
        return;
      }
      const metricList = [];
      for (const module of modules) {
        metricList.push(await Metrics.compute(module.id));
      }
      const metrics = Metrics.aggregate(metricList);
      if (!actorId) {
        res.json(metrics);
        return;
      }
      const filteredByActor: any = {};
      for (const metric in metrics) {
        const filteredData = metrics[
          metric as keyof typeof metrics
        ].data.filter((d) => d.actor === actorId);
        filteredByActor[metric] = {
          ...metrics[metric as keyof typeof metrics],
          data: filteredData,
        };
      }
      res.json(filteredByActor);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Failed to load course score", error });
    }
  }
}

export default MetricsController;
