import { FastifyReply, FastifyRequest } from "fastify";

export const healthHandler = async (
  request: FastifyRequest,
  reply: FastifyReply
) => {
  return { hello: "world" };
};
