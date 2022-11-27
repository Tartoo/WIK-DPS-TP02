FROM node:14.18.0
WORKDIR /src
COPY package.json ./
COPY src/index.ts src/index.ts

RUN npm install

RUN npx tsc src/index.ts
RUN useradd -r newuser
USER newuser
EXPOSE 3000
CMD npm start 2>&1 &  /bin/sh 