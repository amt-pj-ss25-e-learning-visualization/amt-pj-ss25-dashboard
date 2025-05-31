import { Model, DataTypes } from "sequelize";
import { sequelize } from "../../common/database";

interface ActorAttributes {
  id: string;
  mail: string;
  name: string;
  role: string;
}

export class Actor extends Model<ActorAttributes> implements ActorAttributes {
  public id!: string;
  public mail!: string;
  public name!: string;
  public role!: string;
}

Actor.init(
  {
    id: {
      type: DataTypes.UUID,
      primaryKey: true,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
    },
    mail: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    name: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    role: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "actors",
    timestamps: false,
  }
);
