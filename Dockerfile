FROM node:16 AS build
WORKDIR /app
COPY package*.json  ./
RUN npm install

FROM node:16-alpine AS main
COPY --from=build /app /
EXPOSE 8080
CMD [ "node", "app.js" ]