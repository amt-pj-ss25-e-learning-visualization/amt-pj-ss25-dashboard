import "./common/associations";
import express from "express";
import morgan from "morgan";
import cors from "cors";
import config from "./config/config";
import actorsRouter from "./features/actors/actors.routes";
import statementsRouter from "./features/statements/statements.routes";
import modulesRouter from "./features/modules/modules.routes";
import coursesRouter from "./features/courses/courses.routes";
import metricsRouter from "./features/metrics/metrics.routes";
import recommenderRouter from "./features/recommender/recommender.routes";

const app = express();
const PORT = config.port;
app.use(express.json());
app.use(morgan("dev"));
app.use(cors());

app.get("/", (_, res) => {
  res.send("API server is running");
});

app.use("/actors", actorsRouter);
app.use("/statements", statementsRouter);
app.use("/modules", modulesRouter);
app.use("/courses", coursesRouter);
app.use("/recommendation", recommenderRouter);
app.use(/.*\/metrics/, metricsRouter);

console.log('Backend should be running!')

app.listen(PORT, () => {
  console.log(`API-Server is running at http://localhost:${PORT}`);
});
