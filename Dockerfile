FROM node:alpine as build
WORKDIR /app

COPY SnapShot/package.json ./

RUN npm update
RUN npm install
RUN npm run build


FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html/SnapShot
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
