FROM node:18 as base

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

COPY tsconfig.json ./

COPY src ./src

FROM base as test

RUN npm install \
&& npm run build

CMD [ "npm", "run", "test", "./build/src" ]

FROM base as prod

RUN npm install \
&& npm run build \
&& rm -rf node_modules \
&& npm install --production

# docker container port
EXPOSE 3333

CMD [ "npm", "run", "prod:start" ]
