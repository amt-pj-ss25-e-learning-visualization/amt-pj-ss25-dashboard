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
  "/moduleScore",
  middleware.allowPath("/modules/:moduleId{/actors/:actorId}"),
  controller.moduleScore
);

export default router;
