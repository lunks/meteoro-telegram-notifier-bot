FROM node:12

WORKDIR /app

COPY yarn.lock package.json ./

RUN yarn

RUN yarn build

COPY . .

CMD ["node", "build/index.js"]
