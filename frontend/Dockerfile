FROM node:22-alpine

ARG PORT

ENV PORT=${PORT}

WORKDIR /app

COPY . .

RUN corepack enable

WORKDIR /app/frontend

RUN yarn workspaces focus --production

RUN yarn build

CMD ["yarn", "start"]
