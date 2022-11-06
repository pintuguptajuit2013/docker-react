FROM node:14-alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install 

COPY . .

CMD ["npm", "run", "build"]

FROM nginx:alpine

COPY --from=builder /app/build /user/share/nginx/html