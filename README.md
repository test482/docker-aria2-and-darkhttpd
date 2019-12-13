# Docker aria2 and darkhttpd

Small image size, about 26 MB.\
quick deploy『aria2 and get files』 on server.

## Install

I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security;

replace **YOUR_AUTH_USERNAME** and **YOUR_AUTH_PASSWD** to verify identity of the browse file web page if you need.

Run command below

    sudo docker run -d \
    --name aria2-and-darkhttpd \
    -p 6800:6800 \
    -p 6881:6881 \
    -p 6881:6881/udp \
    -p 6888:80 \
    -v /DOWNLOAD_DIR:/data \
    -v /CONFIG_DIR:/conf \
    -v /etc/localtime:/etc/localtime:ro \
    -e SECRET=YOUR_SECRET_CODE \
    -e AUTH_USERNAME=YOUR_AUTH_USERNAME \
    -e AUTH_PASSWD=YOUR_AUTH_PASSWD \
    test482/docker-aria2-and-darkhttpd

II. Choose an online version webui 『 [AriaNg](http://ariang.mayswind.net/latest) or [webui-aria2](https://ziahamza.github.io/webui-aria2) 』 to manage aria2, or any other way you want.

open `http://serverip:6888/` to browse data folder.

## Build

`sudo docker build -f Dockerfile -t test482/docker-aria2-and-darkhttpd .`  

## Link

<https://github.com/aria2/aria2>\
<https://github.com/ziahamza/webui-aria2>  

<https://github.com/acgotaku/BaiduExporter>  

## Thanks

Thanks to the repository write below for given help of this repository.

[Docker — 从入门到实践](https://docker_practice.gitee.io/zh-cn/) Where I get knowledge.

[XUJINKAI/aria2-with-webui](https://github.com/XUJINKAI/aria2-with-webui) Most help in code.

[ryanmjacobs/darkhttpd](https://github.com/ryanmjacobs/darkhttpd) provided darkhttpd-with-auth.

[P3TERX/aria2_perfect_config](https://github.com/P3TERX/aria2_perfect_config) aria2_perfect_config.

All of you make Open Source more colorful. :) Thanks.
