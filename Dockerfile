FROM node:16.17.1-alpine3.15 as dependencias
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install 

######################
FROM dependencias AS dev
COPY . .
EXPOSE 3000
CMD [ "npm","run","serve" ]

######################
FROM dependencias AS builder
COPY . .
RUN npm run build

### Prod
FROM nginx:1.23.1 AS prod
WORKDIR /usr/share/nginx/html
# Remove default nginx static resources
RUN rm -rf ./*
# Copies static resources from builder stage
COPY --from=builder /app/dist .
CMD ["nginx", "-g", "daemon off;"]