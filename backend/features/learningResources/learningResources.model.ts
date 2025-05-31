import { Model, DataTypes } from "sequelize";
import { sequelize } from "../../common/database";

interface LearningResourceAttributes {
  id: string;
  title: string;
  description: string;
  language: string;
  interactivity_type: string;
  interactivity_level: string;
  learning_resource_type: string;
  semantic_density: string;
  difficulty: string;
  typical_learning_time: string;
}

export class LearningResource
  extends Model<LearningResourceAttributes>
  implements LearningResourceAttributes
{
  public id!: string;
  public title!: string;
  public description!: string;
  public language!: string;
  public interactivity_type!: string;
  public interactivity_level!: string;
  public learning_resource_type!: string;
  public semantic_density!: string;
  public difficulty!: string;
  public typical_learning_time!: string;
}

LearningResource.init(
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
    language: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    interactivity_type: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    interactivity_level: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    learning_resource_type: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    semantic_density: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    difficulty: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    typical_learning_time: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "learning_resources",
    timestamps: false,
  }
);
