FROM node:12-alpine

WORKDIR /app

COPY . .

RUN apk add --no-cache tini

RUN yarn install --frozen-lockfile

RUN yarn build

ENTRYPOINT [ "/sbin/tini","--", "node", "build/index.js" ]
