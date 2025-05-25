import { Request, Response } from "express";
import { BaseController } from "./base-controller";
import { Module } from "../models/modules-model";
import { Course } from "../models/courses-model";
import { Actor } from "../models/actors-model";
import { LearningResource } from "../models/learning_resources-model";

class ModulesController extends BaseController<Module> {
    constructor() {
        super(Module);
    }

    /**
     * Overloaded function from BaseController to resolve instructor_id, course_id &
     * insert the corresponding learning resources into the response.
     */
    getById = async (req: Request, res: Response) => {
        try {
            const id = req.params.id;
            const module = await this.model.findByPk(id, {
                include: [
                    { model: Course, as: "course" },
                    { model: Actor, as: "instructor" },
                    { model: LearningResource, as: "resources" }
                ]
            });
            if (!module) {
                res.status(404).json({ error: `404: Module with id '${id}' not found!` });
                return;
            }

            res.json(this.omitFields(module, ["course_id", "instructor_id", "module_resources"]));
        } catch (error) {
            console.error("Error fetching module by ID:", error);
            res.status(500).json({ error: "500: Unexpected error occured!" });
        }
    };
}

const modulesController = new ModulesController();
export default modulesController;