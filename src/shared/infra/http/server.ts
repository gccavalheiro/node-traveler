import AppError from "@shared/errors/AppError";
import express, { Request, Response, NextFunction } from "express";
import "express-async-errors";
import router from "./routes";

const port = 3333;
const app = express();
app.use(express.json());

app.use(router);

app.use(
	(error: Error, request: Request, response: Response, _: NextFunction) => {
		if (error instanceof AppError) {
			return response.status(error.statusCode).json({
				status: "error",
				message: error.message,
			});
		}

		return response.status(500).json({
			status: "error",
			message: "Internal server error.",
		});
	}
);

app.listen(3333, () => console.log(`Server is running on Port ${port}`));
