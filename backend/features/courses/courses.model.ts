import { Model, DataTypes } from "sequelize";
import { sequelize } from "../../common/database";

export interface CourseAttributes {
  id: string;
  title: string;
  description: string;
  subject: string;
  language: string;
}

export class Course
  extends Model<CourseAttributes>
  implements CourseAttributes
{
  public id!: string;
  public title!: string;
  public description!: string;
  public subject!: string;
  public language!: string;
}

Course.init(
  {
    id: {
      type: DataTypes.UUID,
      primaryKey: true,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
    },
    title: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    subject: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    language: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "courses",
    timestamps: false,
  }
);
