# docker aria2 and darkhttpd

极小的镜像体积，只有 26 MB。

可以在复杂环境的 Linux 服务器上快速部署 aria2 和 darkhttpd。

## 安装

I. 替换 **/DOWNLOAD_DIR** 为文件的保存路径；

替换 **/CONFIG_DIR** 为 aria2 配置文件目录的路径；

替换 **YOUR_SECRET_CODE** 为 aria2 的安全口令；

如果你需要的话，可以替换 **YOUR_AUTH_USERNAME** 和 **YOUR_AUTH_PASSWD** 以便在取回文件的页面验证身份。

运行下面的命令：

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

II. 选择一个在线网页控制端 『 [AriaNg](http://ariang.mayswind.net/latest) 或者 [webui-aria2](https://ziahamza.github.io/webui-aria2) 』 来访问 aria2，或者其他你喜欢的方式。

访问 `http://serverip:6888/` 就可以取回文件了。

## 编译

大多数情况你并不需要自己编译 docker 镜像，只要用上面的指令从 Docker Hub 获取就好。

`sudo docker build -f Dockerfile -t test482/docker-aria2-and-darkhttpd .`    

## 感谢

谢谢下面的 repository 给我的灵感，(≧∇≦)ﾉ

[Docker — 从入门到实践](https://docker_practice.gitee.io/zh-cn/) learn about docker.

[XUJINKAI/aria2-with-webui](https://github.com/XUJINKAI/aria2-with-webui) most help in code.

[ryanmjacobs/darkhttpd](https://github.com/ryanmjacobs/darkhttpd) provided darkhttpd-with-auth.

[P3TERX/aria2_perfect_config](https://github.com/P3TERX/aria2_perfect_config) aria2_perfect_config.
