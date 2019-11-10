#!/bin/sh
if [ ! -f /conf/aria2.conf ]; then
	cp /conf-copy/aria2.conf /conf/aria2.conf
	if [ ${SECRET} ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi
if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-copy/on-complete.sh /conf/on-complete.sh
fi

chmod +x /conf/on-complete.sh
touch /conf/aria2.session

darkhttpd /webui-aria2/docs --port 80 &
if [ ${AUTH_USERNAME} -a ${AUTH_PASSWD} ]; 
then
	darkhttpd /data --port 8080 --auth ${AUTH_USERNAME}:${AUTH_PASSWD} &
else
	darkhttpd /data --port 8080 &
fi

aria2c --conf-path=/conf/aria2.conf
