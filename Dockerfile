FROM node:14.18.0 as builder
WORKDIR /app
COPY package.json ./
COPY src/index.ts src/index.ts
RUN npm install
RUN npx tsc src/index.ts

FROM builder as exec
WORKDIR /app
COPY --from=builder app/node_modules ./node_modules
COPY --from=builder app/src/index.js ./src
RUN useradd -r newuser
USER newuser
EXPOSE 3001
CMD PING_LISTEN_PORT=3001 npm start 2>&1 &  /bin/sh 