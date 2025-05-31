import { Model, DataTypes } from "sequelize";
import { sequelize } from "../../common/database";

interface ModuleAttributes {
  id: string;
  course_id: string;
  parent_id?: string | null;
  title: string;
  instructor_id?: string | null;
}

export class Module
  extends Model<ModuleAttributes>
  implements ModuleAttributes
{
  public id!: string;
  public course_id!: string;
  public parent_id!: string | null;
  public title!: string;
  public instructor_id!: string | null;
}

Module.init(
  {
    id: {
      type: DataTypes.UUID,
      primaryKey: true,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
    },
    course_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    parent_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
    title: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    instructor_id: {
      type: DataTypes.UUID,
      allowNull: true,
    },
  },
  {
    sequelize,
    tableName: "modules",
    timestamps: false,
  }
);
