FROM node:12-alpine

WORKDIR /app

COPY . .

RUN yarn install --frozen-lockfile

RUN yarn build

ENTRYPOINT ["node", "build/index.js"]
