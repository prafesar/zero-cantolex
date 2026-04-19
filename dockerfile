FROM node:20-alpine
WORKDIR /app

# Копируем только package.json для кэширования
COPY package.json ./
RUN npm install --omit=dev

# HEALTHCHECK для Railway
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD wget -qO- http://localhost:${PORT:-4848}/health || exit 1

# Railpack выполнит этот CMD через npm start
CMD ["npm", "start"]
