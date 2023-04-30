FROM node:18 as base

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

COPY tsconfig.json ./

COPY src ./src

FROM base as test

COPY jest.config.ts ./

COPY setupTest.ts ./

RUN npm install

CMD [ "npm", "run", "test", "./src" ]

FROM base as prod

RUN npm install \
&& npm run build \
&& rm -rf node_modules \
&& npm install --production

# docker container port
EXPOSE 3333

CMD [ "npm", "run", "prod:start" ]
