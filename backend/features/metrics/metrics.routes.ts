import { Router } from "express";
import MetricsMiddleware from "./metrics.middleware";
import MetricsController from "./metrics.controller";

const router = Router();
const controller = new MetricsController();
const middleware = new MetricsMiddleware();

/**
 * Works for following paths
 * ```
 * \modules\:moduleId\metrics\moduleScore
 * \modules\:moduleId\actors\:actorId\metrics\moduleScore
 * ```
 */
router.get(
  "",
  middleware.allowPath("/modules/:moduleId{/actors/:actorId}"),
  controller.getModuleMetrics
);

/**
 * Like module score but also aggregates the score metric along the whole course structures
 * ```
 * \modules\:moduleId\metrics\moduleScore
 * \modules\:moduleId\actors\:actorId\metrics\moduleScore
 * ```
 */
router.get(
  "/aggregated",
  middleware.allowPath("/courses/:courseId{/actors/:actorId}"),
  controller.getCourseMetrics
);
export default router;
