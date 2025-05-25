import { Module } from './modules-model';
import { Course } from './courses-model';
import { LearningResource } from './learning_resources-model';
import { Actor } from './actors-model';
import { Statement } from './statements-model';

/**
 * Relationships between models in the database.
 */

/* Statement-Model */
Statement.belongsTo(Module, { foreignKey: "module_id", as: "module" });
Statement.belongsTo(Actor, { foreignKey: "actor_id", as: "actor" });

/* Module-Model */
Module.belongsTo(Course, { foreignKey: 'course_id', as: 'course' });
Module.belongsTo(Actor, { foreignKey: 'instructor_id', as: 'instructor' });
Module.belongsToMany(LearningResource, {
  through: 'module_resources',
  foreignKey: 'module_id',
  otherKey: 'resource_id',
  as: 'resources',
  timestamps: false
});

/* Learning Resource-Model */
LearningResource.belongsToMany(Module, {
  through: 'module_resources',
  foreignKey: 'resource_id',
  otherKey: 'module_id',
  as: 'modules',
  timestamps: false
});