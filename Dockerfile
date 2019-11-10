FROM alpine:edge

MAINTAINER Eliot <eliotjoking@gmail.com>

COPY files/conf-copy /conf-copy
COPY files/darkhttpd /usr/local/bin/darkhttpd
ADD files/webui-aria2.tar.gz /

WORKDIR /

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add --no-cache --update bash && \
    apk add --no-cache --update aria2 && \
    chmod +x /conf-copy/start.sh && \
    chmod +x /usr/local/bin/darkhttpd && \
    rm /aria2-webui/.git* -rf

VOLUME ["/data","/conf"]

EXPOSE 6800 80 8080

CMD ["/conf-copy/start.sh"]
