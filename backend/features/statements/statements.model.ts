import { DataTypes, Model } from "sequelize";
import { sequelize } from "../../common/database";
import { ISO8601Duration } from "../../common/types";

export interface StatementAttributes {
  id: string;
  actor_id: string;
  module_id: string;
  verb: string;
  result?: object | null;
  timestamp: Date;
}

export class Statement
  extends Model<StatementAttributes>
  implements StatementAttributes
{
  public id!: string;
  public actor_id!: string;
  public module_id!: string;
  public verb!: string;
  public result?: {
    score?: {
      scaled?: number;
      raw?: number;
      min?: number;
      max?: number;
    };
    success?: boolean;
    completion?: boolean;
    response?: string;
    duration?: ISO8601Duration;
    extensions?: Record<string, any>;
  } | null;
  public timestamp!: Date;
}

Statement.init(
  {
    id: {
      type: DataTypes.UUID,
      primaryKey: true,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
    },
    actor_id: {
      type: DataTypes.UUID,
      allowNull: false,
      references: { model: "actors", key: "id" },
    },
    module_id: {
      type: DataTypes.UUID,
      allowNull: false,
      //references: { model: "modules", key: "id" },
    },
    verb: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    result: {
      type: DataTypes.JSONB,
      allowNull: true,
    },
    timestamp: {
      type: DataTypes.DATE,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "statements",
    timestamps: false,
  }
);
