import { NextFunction } from "express";
import { Request, Response } from "../../common/types";
import { match } from "path-to-regexp";

class MetricsMiddleware {
  allowPath(pattern: string) {
    const matcher = match(pattern);

    return (req: Request, res: Response, next: NextFunction) => {
      try {
        const { baseUrl } = req;
        const parts = baseUrl.split("/");
        const withoutEnd = parts.slice(0, -1).join("/");
        const matchResult = matcher(withoutEnd);
        if (!matchResult) {
          res
            .status(400)
            .json({ message: "Incorrect path for requested metric" });
          return;
        }
        req.params = { ...matchResult.params };
        next();
      } catch (error) {
        console.error(error);
        res.status(500).json({
          message: "Something went wrong while checking params",
          error,
        });
      }
    };
  }
}

export default MetricsMiddleware;
