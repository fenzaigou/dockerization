FROM node:18-alpine as BUILD_IMAGE

WORKDIR /app/react-app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Here is the multi-stage build.
# It greatly reduces the size and won't expose our code in our container 
# as we will only copy the build output from the first stage.

FROM node:18-alpine as PRODUCTION_IMAGE

WORKDIR /app/react-app 

COPY --from=BUILD_IMAGE /app/react-app/dist/ /app/react-app/dist/
EXPOSE 8080

COPY package.json .
COPY vite.config.ts .

RUN npm install typescript
EXPOSE 8080
CMD npm run preview
