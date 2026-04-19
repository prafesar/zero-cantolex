# Dockerfile
FROM rocicorp/zero:1.3.0

# zero-cache читает конфиг только из ENV, CMD не нужен
# Но добавим healthcheck для Railway
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD wget -qO- http://localhost:4848/keepalive || exit 1
