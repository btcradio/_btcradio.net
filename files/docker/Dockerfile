# Usage
# docker build -t icecast:1.0.0 .

FROM alpine:latest
LABEL maintainer "admin@btcRadio.net"

RUN addgroup -S icecast && \
    adduser  -S icecast

RUN apk add --update \
        git \
        vim \
        icecast \
        mailcap && \
    rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["/entrypoint.sh"]

CMD icecast -c /etc/icecast.xml
