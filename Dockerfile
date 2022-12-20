FROM alpine:3.17.0
WORKDIR /app
RUN apk add wol tzdata --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY start-script.sh /app/
COPY wol-script /app/
ENTRYPOINT "/app/start-script.sh"
