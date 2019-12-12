FROM alpine:edge

MAINTAINER Eliot <eliotjoking@gmail.com>

COPY files/conf-copy /conf-copy
COPY files/darkhttpd /usr/local/bin/darkhttpd

RUN buildDeps='git' \
    && apk update \
    && apk upgrade \
    && apk add --no-cache --update $buildDeps \
    && apk add --no-cache --update bash aria2 \
    && chmod +x /conf-copy/start.sh \
    && chmod +x /usr/local/bin/darkhttpd \
    && git clone https://github.com/ziahamza/webui-aria2.git /webui-aria2 \
    && rm /webui-aria2/.git* -rf \
    && apk del $buildDeps

VOLUME ["/data","/conf"]

EXPOSE 6800 6881 6881/udp 80 8080

CMD ["/conf-copy/start.sh"]
