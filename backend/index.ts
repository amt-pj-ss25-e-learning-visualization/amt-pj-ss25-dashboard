import './models/associations';
import express from "express";
import config from "./config/config";
import actorsRouter from "./routes/actors-routes";
import statementsRouter from "./routes/statements-routes";
import modulesRouter from "./routes/modules-routes";
import coursesRouter from "./routes/courses-routes";

const app = express();
const PORT = config.port;

app.get("/", (req, res) => {
  res.send("API server is running");
});

app.use("/statements", statementsRouter);
app.use("/actors", actorsRouter);
app.use("/modules", modulesRouter);
app.use("/courses", coursesRouter);

app.listen(PORT, () => {
  console.log(`API-Server is running at http://localhost:${PORT}`);
});