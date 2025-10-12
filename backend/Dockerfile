FROM node:22-alpine

ARG PORT

ENV PORT=${PORT}

WORKDIR /app

COPY . .

RUN corepack enable

RUN yarn install

WORKDIR /app/backend

CMD ["yarn", "start"]
