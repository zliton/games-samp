FROM --platform=$TARGETOS/$TARGETARCH alpine:latest

RUN apk add --update --no-cache tar curl ca-certificates git sqlite openssl \
 && adduser -D -h /home/container container \
 && rm -rf /var/cache/apk/*

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD  [ "/bin/ash", "/entrypoint.sh" ]
