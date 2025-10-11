import Fastify from "fastify";
import { healthHandler } from "./handlers/health";

const fastify = Fastify({ logger: false });

async function main() {
  fastify.get("/", healthHandler);

  await fastify.listen({ port: 3000 });

  console.log("Server is running on port 3000 http://localhost:3000");
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
