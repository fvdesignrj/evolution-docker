# Usa Node.js LTS
FROM node:18

# Define diretório de trabalho
WORKDIR /app

# Copia package.json e package-lock.json
COPY package*.json ./

# Instala dependências
RUN npm install

# Copia o resto do código
COPY . .

# Build (caso tenha scripts de build)
RUN npm run build || echo "No build step"

# Expõe a porta usada no render.yaml
EXPOSE 8080

# Comando para iniciar
CMD ["npm", "start"]
