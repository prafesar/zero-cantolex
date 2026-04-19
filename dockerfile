# Dockerfile
FROM rocicorp/zero:1.3.0

# Zero-сервер читает конфиг только из ENV, CMD не нужен
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD wget -qO- http://localhost:${ZERO_PORT:-4848}/keepalive || exit 1
