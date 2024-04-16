FROM node:20-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

RUN npm install -g pnpm

# Copier les fichiers du projet dans le conteneur
COPY package.json ./

# Installer les dépendances avec PNPM
RUN pnpm install

COPY . .

# Construire l'application Next.js
RUN npm run build

# Exposer le port 3000 utilisé par Next.js
EXPOSE 3000

# Commande pour démarrer l'application Next.js
CMD ["npm", "start:dev"]
