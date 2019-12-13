#!/bin/sh

if [ ! -f /conf/aria2.conf ]; then
    cp /conf-copy/aria2.conf /conf/aria2.conf
    if [ "${SECRET}" ]; then
        echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
    fi
fi

if [ ! -f /conf/dht.dat ]; then
    touch /conf/dht.dat
fi

touch /conf/aria2.session

if [ "${AUTH_USERNAME}" ] && [ "${AUTH_PASSWD}" ]; then
    darkhttpd /data --port 80 --auth "${AUTH_USERNAME}":"${AUTH_PASSWD}" &
else
    darkhttpd /data --port 80 &
fi

aria2c --conf-path=/conf/aria2.conf
