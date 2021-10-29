import CreateUserService from "@modules/users/services/CreateUserService";
import { Router } from "express";

const usersRouter = Router();

usersRouter.post("/", async (request, response) => {
	const { name, email, password } = request.body;

	const createUser = new CreateUserService();

	const user = await createUser.execute({
		name,
		email,
		password,
	});

	delete user.password;

	return response.json(user);
});

export default usersRouter;
