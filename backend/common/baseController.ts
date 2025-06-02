import { Request, Response } from "express";
import { Model, ModelStatic, WhereOptions } from "sequelize";

/**
 * BaseController represents a base class for shared CRUD operations across all tables.
 */
export class BaseController<T extends Model> {
  protected model: ModelStatic<T>;

  constructor(model: ModelStatic<T>) {
    this.model = model;
  }

  /**
   * Retrieves all items from a model.
   */
  getAll = async (req: Request, res: Response) => {
    try {
      const items = await this.model.findAll();
      res.json(items);
    } catch (error) {
      console.error("Error in getAll:", (error as Error).message);
      console.error((error as Error).stack);
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };

  /**
   * Retrieves a single item by its ID.
   */
  getById = async (req: Request, res: Response) => {
    try {
      const id = req.params.id;
      const item = await this.model.findByPk(id);
      if (!item) {
        res.status(404).json({ error: `404: Entry with id '${id}' not found!` });
        return;
      }
      res.json(item);
    } catch (error) {
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };

  /**
   * Retrieves items filtered by a specific field.
   * @param field - The field to filter by.
   * @param paramName - The name of the request parameter to use for filtering.
   */
  getByField = (field: string, paramName?: string) => async (req: Request, res: Response) => {
    try {
      const value = req.params[paramName || field];
      const where: WhereOptions = { [field]: value };
      const items = await this.model.findAll({ where });
      res.json(items);
    } catch (error) {
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };

  /**
   * Recursively removes specified fields from an object properties (nested object or array).
   * This function is being used to remove fields that are not needed in an API response,
   * @param obj - The object to process.
   * @param fields - The fields to remove.
   * @returns A object with the specified fields removed.
   */
  protected omitFields(obj: any, fields: string[]): any {
    const object = obj && typeof obj.get === "function" ? obj.get({ object: true }) : obj;

    if (Array.isArray(object)) {
      return object.map(item => this.omitFields(item, fields));

    } else if (object instanceof Date) {
      return object;
    }
    else if (object && typeof object === 'object') {

      const result: any = {};
      for (const key in object) {
        if (!fields.includes(key)) {
          result[key] = this.omitFields(object[key], fields);
        }
      }
      return result;
    }

    return object;
  }
}