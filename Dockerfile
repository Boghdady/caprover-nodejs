FROM node:10

# Creo la carpeta para copiar mi info
RUN mkdir -p /usr/src/caprover

# Me muevo a esa carpeta
WORKDIR /usr/src/caprover

RUN apt-get update && apt-get install -yq libgconf-2-4

RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb

# Copiamos los json
COPY package*.json ./

# Instalamos los paquetes
RUN npm install

# COPY src ./
COPY . .

# Configuramos el puerto
EXPOSE 3000

CMD ["npm", "run", "start"]