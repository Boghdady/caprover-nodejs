FROM node:10

# Creo la carpeta para copiar mi info
RUN mkdir -p /usr/src/caprover

# Me muevo a esa carpeta
WORKDIR /usr/src/caprover

RUN apt-get update && apt-get install -yq libgconf-2-4

# Copiamos los json
COPY package*.json ./

# Instalamos los paquetes
RUN npm install

# COPY src ./
COPY . .

# Configuramos el puerto
EXPOSE 3000

CMD ["npm", "run", "start"]