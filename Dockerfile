FROM node:16.17.1-alpine3.15 as dependencias

# Indica el directorio de trabajo, por defecto es el raiz
WORKDIR /app

# Copia todos los archivos en el directorio actual al directorio de trabajo del container
# COPY package.json package-lock.json ./
COPY . .

# como buena practica se recomienda exponer el puerto al que se va a acceder
EXPOSE 8080
# 
RUN npm install nodemon -gn