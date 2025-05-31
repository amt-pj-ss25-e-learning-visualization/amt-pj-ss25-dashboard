import "./common/associations";
import express from "express";
import config from "./config/config";
import actorsRouter from "./features/actors/actors.routes";
import statementsRouter from "./features/statements/statements.routes";
import modulesRouter from "./features/modules/modules.routes";
import coursesRouter from "./features/courses/courses.routes";

const app = express();
const PORT = config.port;
app.use(express.json());

app.get("/", (_, res) => {
  res.send("API server is running");
});

app.use("/statements", statementsRouter);
app.use("/actors", actorsRouter);
app.use("/modules", modulesRouter);
app.use("/courses", coursesRouter);

app.listen(PORT, () => {
  console.log(`API-Server is running at http://localhost:${PORT}`);
});
