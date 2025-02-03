FROM node:16.20.2 AS base
WORKDIR /app
COPY package* .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine3.20-perl
COPY --from=base /app/build /usr/share/nginx/html
EXPOSE 80
