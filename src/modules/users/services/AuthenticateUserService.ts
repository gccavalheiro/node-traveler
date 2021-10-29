import AppError from "@shared/errors/AppError";
import prismaClient from "@shared/infra/database/prisma";
import { compare } from "bcryptjs";
import authConfig from "@config/auth";
import { sign } from "jsonwebtoken";
import User from "../interfaces/user.interface";

interface IRequestProps {
	email: string;
	password: string;
}

interface IResponseProps {
	user: User;
	token: string;
}

class AuthenticateUserService {
	public async execute({
		email,
		password,
	}: IRequestProps): Promise<IResponseProps> {
		const user = await prismaClient.user.findFirst({
			where: {
				email,
			},
		});

		if (!user) {
			throw new AppError("Combinação de e-mail/senha incorreta.", 401);
		}

		const passwordMatched = await compare(password, user.password);

		if (!passwordMatched) {
			throw new AppError("Combinação de e-mail/senha incorreta.", 401);
		}

		const { secret, expiresIn } = authConfig.jwt;

		const token = sign({}, secret, {
			subject: user.id,
			expiresIn,
		});

		return { user, token };
	}
}

export default AuthenticateUserService;
