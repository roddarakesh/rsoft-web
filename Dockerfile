### STAGE 1: Build ###
FROM node:alpine as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

### STAGE 2: Run ###
FROM nginx:alpine
COPY --from=build /app/dist/rsoft-web /usr/share/nginx/html
EXPOSE 80
