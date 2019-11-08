FROM alpine:edge

MAINTAINER Eliot <eliotjoking@gmail.com>

COPY files/start.sh /conf-copy/start.sh
COPY files/aria2.conf /conf-copy/aria2.conf
COPY files/on-complete.sh /conf-copy/on-complete.sh
COPY files/darkhttpd /usr/local/bin/darkhttpd
ADD files/webui-aria2.tar.gz /

WORKDIR /

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update bash && \
    apk add --no-cache --update aria2 && \
    chmod +x /conf-copy/start.sh && \
    chmod +x /usr/local/bin/darkhttpd && \
    rm /aria2-webui/.git* -rf

VOLUME ["/data","/conf"]

EXPOSE 6800 80 8080

CMD ["/conf-copy/start.sh"]
