import Fastify from "fastify";
import { healthHandler } from "./handlers/health";

const fastify = Fastify({ logger: false });
const { PORT = "", APIPREFIX = "" } = process.env;
const port = PORT === "" ? 3000 : parseInt(PORT);
const apiPrefix = APIPREFIX === "" ? "/huoguo-pick" : APIPREFIX;

async function main() {
  fastify.register(
    async function (router) {
      router.get("/", healthHandler);
      router.get("/health", healthHandler);
    },
    { prefix: apiPrefix }
  );

  await fastify.listen({
    port,
    host: "0.0.0.0",
  });

  console.log(`Server is running on port ${port} http://localhost:${port}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
