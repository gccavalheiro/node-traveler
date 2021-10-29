import User from "../interfaces/user.interface";
import prismaClient from "@shared/infra/database/prisma";
import { hash } from "bcryptjs";
import AppError from "@shared/errors/AppError";

interface IRequestProps {
	name: string;
	email: string;
	password: string;
}

class CreateUserService {
	public async execute({
		name,
		email,
		password,
	}: IRequestProps): Promise<User> {
		const checkUserExists = await prismaClient.user.findFirst({
			where: {
				email,
			},
		});

		if (checkUserExists) {
			throw new AppError("E-mail inserido já está em uso.");
		}

		const hashedPassword = await hash(password, 8);

		const user = await prismaClient.user.create({
			data: {
				name,
				email,
				password: hashedPassword,
			},
		});

		return user;
	}
}

export default CreateUserService;
