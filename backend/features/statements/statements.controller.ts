import { Request, Response } from "express";
import { BaseController } from "../../common/baseController";
import { Statement } from "./statements.model";
import { Actor } from "../actors/actors.model";
import { Module } from "../modules/modules.model";

class StatementsController extends BaseController<Statement> {
  constructor() {
    super(Statement);
  }

  /**
   * Overloaded function from BaseController to resolve the actor_id and module_id
   * and omit the respective id-fields from the response.
   */
  getById = async (req: Request, res: Response) => {
    try {
      const id = req.params.id;
      const statement = await this.model.findByPk(id, {
        include: [
          { model: Actor, as: "actor" },
          { model: Module, as: "module" },
        ],
      });
      if (!statement) {
        res
          .status(404)
          .json({ error: `404: Entry with id '${id}' not found!` });
        return;
      }
      res.json(this.omitFields(statement, ["actor_id", "module_id"]));
    } catch (error) {
      console.error("Error fetching statement by ID:", error);
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };
}

const statementController = new StatementsController();
export default statementController;
