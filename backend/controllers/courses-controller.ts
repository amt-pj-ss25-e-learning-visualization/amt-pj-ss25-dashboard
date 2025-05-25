import { Request, Response } from "express";
import { BaseController } from "./base-controller";
import { Course } from "../models/courses-model";
import { Module } from "../models/modules-model";
import { Actor } from "../models/actors-model";
import { LearningResource } from "../models/learning_resources-model";

class CoursesController extends BaseController<Course> {
    constructor() {
        super(Course);
    }

    /**
     * Fetches submodules recursively for a given module ID.
     * @param {string} moduleId - The ID of the module to fetch submodules for.
     * @returns {Promise<any[]>} - An array of submodules.
     */
    private async fetchSubmodules(moduleId: string): Promise<any[]> {
        const submodules = await Module.findAll({
            where: { parent_id: moduleId },
            include: [
                { model: Actor, as: "instructor" },
                { model: LearningResource, as: "resources" }
            ]
        });
        return Promise.all(submodules.map(async (submodule: any) => {
            const plainSubmodule = submodule.get({ plain: true });
            plainSubmodule.submodules = await this.fetchSubmodules(plainSubmodule.id);
            return plainSubmodule;
        }));
    }

    /**
     * Overloaded function from BaseController to resolve the course hierarchy
     */
    getById = async (req: Request, res: Response) => {
        try {
            const id = req.params.id;
            const course = await this.model.findByPk(id);
            if (!course) {
                res.status(404).json({ error: `404: Course with id '${id}' not found!` });
                return;
            }
            // Fetch top-level modules for this course
            const modules = await Module.findAll({
                where: { course_id: id, parent_id: null },
                include: [
                    { model: Actor, as: "instructor" },
                    { model: LearningResource, as: "resources" }
                ]
            });
            // Recursively fetch submodules for each top-level module
            const modulesWithHierarchy = await Promise.all(modules.map(async (mod: any) => {
                const plainMod = mod.get({ plain: true });
                plainMod.submodules = await this.fetchSubmodules(plainMod.id);
                return plainMod;
            }));

            const courseObj = course.get({ plain: true }) as any;
            courseObj.modules = modulesWithHierarchy;

            res.json(this.omitFields(courseObj, ["course_id", "instructor_id", "module_resources"]));
        } catch (error) {
            console.error("Error fetching course by ID:", error);
            res.status(500).json({ error: "500: Unexpected error occured!" });
        }
    };
}

const coursesController = new CoursesController();
export default coursesController;