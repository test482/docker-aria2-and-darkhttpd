# docker aria2 and darkhttpd

small image size, about 26 MB.

quick deploy aria2 and darkhttpd on complex environments linux server.

[README in Chinese 中文简介](https://github.com/test482/docker-aria2-and-darkhttpd/blob/master/README.zh_CN.md)

## Install

I. replace **/DOWNLOAD_DIR** for save data;

replace **/CONFIG_DIR** for aria2 configuration file;

replace **YOUR_SECRET_CODE** for aria2 security code;

if you need, replace **YOUR_AUTH_USERNAME** and **YOUR_AUTH_PASSWD** for confirm identity when browsing data pages.

run command below:

```bash
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
```

II. choose an online version webui 『 [AriaNg](http://ariang.mayswind.net/latest) or [webui-aria2](https://ziahamza.github.io/webui-aria2) 』 to manage aria2, or any other way you want.

open `http://serverip:6888/` to browse data folder.

## Build

`sudo docker build -f Dockerfile -t test482/docker-aria2-and-darkhttpd .`    

## Thanks

Thanks to the repository write below for given help of this repository.

[Docker — 从入门到实践](https://docker_practice.gitee.io/zh-cn/) learn about docker.

[XUJINKAI/aria2-with-webui](https://github.com/XUJINKAI/aria2-with-webui) most help in code.

[ryanmjacobs/darkhttpd](https://github.com/ryanmjacobs/darkhttpd) provided darkhttpd-with-auth.

[P3TERX/aria2_perfect_config](https://github.com/P3TERX/aria2_perfect_config) aria2_perfect_config.
