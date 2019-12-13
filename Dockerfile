FROM alpine:edge

MAINTAINER Eliot <eliotjoking@gmail.com>

COPY files/conf-copy /conf-copy
COPY files/darkhttpd /usr/local/bin/darkhttpd

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update bash aria2 \
    && chmod +x /conf-copy/start.sh \
    && chmod +x /usr/local/bin/darkhttpd

VOLUME ["/data","/conf"]

EXPOSE 6800 6881 6881/udp 80

CMD ["/conf-copy/start.sh"]
