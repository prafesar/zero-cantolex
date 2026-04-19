FROM node:20-alpine
WORKDIR /app

# Устанавливаем Zero конкретной версии
RUN npm install -g @rocicorp/zero@1.3.0

EXPOSE 4848

# HEALTHCHECK нужен Railway для понимания, что сервер жив
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD wget -qO- http://localhost:${PORT:-4848}/health || exit 1

CMD ["npx", "@rocicorp/zero@1.3.0", "start", \
     "--db-url", "${DATABASE_URL}", \
     "--port", "${PORT:-4848}", \
     "--allowed-origins", "${ZERO_ALLOWED_ORIGINS:-*}"]
