import { Request, Response } from "../../common/types";
import { BaseController } from "../../common/baseController";
import { Course } from "./courses.model";
import { Courses } from "./courses.service";

class CoursesController extends BaseController<Course> {
  private courseService = new Courses();
  constructor() {
    super(Course);
  }

  /**
   * Overloaded function from BaseController to resolve the course hierarchy
   */
  getById = async (req: Request, res: Response) => {
    try {
      const id = req.params.id;
      const course = await this.courseService.getCourseTree(id);
      if (!course) {
        console.error("Course not found!");
        res.status(404).json({ message: "Course not found!" });
        return;
      }
      res.json(course);
    } catch (error) {
      console.error("Error fetching course by ID:", error);
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };
}

const coursesController = new CoursesController();
export default coursesController;
