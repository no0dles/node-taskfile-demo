FROM node:11.7.0-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY tsconfig.json .
COPY src src

RUN npm run build

##########################################

FROM node:11.7.0-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install --production

COPY --from=0 /app/dist /app/dist

CMD node dist/index.js