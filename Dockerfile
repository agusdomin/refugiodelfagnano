FROM node:16.17.1-alpine3.15 as dependencias

# Indica el directorio de trabajo, por defecto es el raiz
WORKDIR /app

# Copia todos los archivos en el directorio actual al directorio de trabajo del container
# COPY package.json package-lock.json ./
COPY . .

RUN npm install 
# && npm install nodemon -g

### 
FROM dependencias AS dev

COPY . .

EXPOSE 3000

CMD [ "npm","run","serve" ]

#####
#FROM dependencias AS builder
#COPY . .
#CMD [ "npm","run","build" ]