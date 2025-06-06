import { Sequelize } from "sequelize";
import config from "../config/config";

console.log("Attempting to connect to DB with config:", config.db);

export const sequelize = new Sequelize(
  config.db.name,
  config.db.user,
  config.db.password,
  {
    host: config.db.host,
    port: config.db.port,
    dialect: "postgres",
    logging: false,
  }
);
