import Fastify from "fastify";
import { healthHandler } from "./handlers/health";

const fastify = Fastify({ logger: false });

async function main() {
  fastify.get("/", healthHandler);
  const port =
    process.env.PORT == undefined ? 3000 : parseInt(process.env.PORT);

  await fastify.listen({ port });

  console.log(`Server is running on port ${port} http://localhost:${port}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
