# Etapa 1: Construcción
FROM node:18-alpine AS builder

WORKDIR /app

# Copia solo archivos esenciales para aprovechar la caché
COPY package.json package-lock.json* ./
RUN npm install --frozen-lockfile

COPY . .

# Construye la aplicación
RUN npm run build

# Etapa 2: Servidor ligero con Nginx
FROM nginx:alpine

# Copia los archivos estáticos desde la etapa de construcción
COPY --from=builder /app/dist /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
