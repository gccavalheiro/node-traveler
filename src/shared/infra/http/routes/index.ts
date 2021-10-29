import { Router } from "express";

const routes = Router();

import usersRouter from "@modules/users/infra/http/routes/users.routes";
import sessionsRouter from "@modules/users/infra/http/routes/sessions.routes";

routes.use("/users", usersRouter);
routes.use("/sessions", sessionsRouter);

export default routes;
