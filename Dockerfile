FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
#EXPOSE 3000
RUN npm run build
#CMD npm run start



FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

