FROM alpine:3.21.3
WORKDIR /app
RUN apk add wol tzdata --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY entrypoint.sh /app/
COPY wol-script /app/
ENTRYPOINT "/app/entrypoint.sh"
