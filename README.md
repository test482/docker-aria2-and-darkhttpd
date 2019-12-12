# Aria2 with webui

About 30Mb image size.\
Edit config file out of the image.\
Move file completed to top folder.\
(Tasks that contains more than one files will not be moved.) 

## Install

I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security;

replace **YOUR_AUTH_USERNAME** and **YOUR_AUTH_PASSWD** to verify the identity of the browse file web page if you need.

Run command below

    sudo docker run -d \
    --name aria2-with-webui \
    -p 6881:6881 \
    -p 6881:6881/udp \
    -p 6800:6800 \
    -p 6880:80 \
    -p 6888:8080 \
    -v /DOWNLOAD_DIR:/data \
    -v /CONFIG_DIR:/conf \
    -v /etc/localtime:/etc/localtime:ro \
    -e SECRET=YOUR_SECRET_CODE \
    -e AUTH_USERNAME=YOUR_AUTH_USERNAME \
    -e AUTH_PASSWD=YOUR_AUTH_PASSWD \
    test482/docker-aria2-with-webui

II. Open `http://serverip:6880/` for aria2-webui, open `http://serverip:6888/` to browse data folder.

## Build

`sudo docker build -f Dockerfile -t test482/docker-aria2-with-webui .`  

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
