
## debian10常用软件包
   root用户下安装

#apt-get update && apt-get install unzip zip wget curl nano sudo ufw socat ntp ntpdate gcc git cron


# 收集各类一键脚本，所有权利归原作者所有。
除了官网一键代码，逗比SSR233等各路大神的大多数原版一键脚本已删贴走人隐居甚至失效。

## 独立版官方克隆脚本
bash <(curl -Ls https://raw.githubusercontent.com/mikewubox/tvonekey/master/go.sh)

## 独立版233克隆脚本
bash <(curl -Ls https://raw.githubusercontent.com/mikewubox/tvonekey/master/v2ray.sh)
自建bash <（curl -Ls https://git.io/JeBU7)

# 手动本地安装

先上传go.sh+安装包到VPS

安装bash go.sh --local ./v2ray-linux-64.zip

删除bash go.sh --remove

时间校正、配置、启动与其他方式一样

# V2ray SPROV面板克隆独立一键脚本

安装CURL
apt-get update -y && apt-get install curl -y

安装sudo 
apt-get install sudo

安装yum 
apt-get install yum

请务必使用 root 用户运行！

wget -O /usr/bin/sprov-ui -N --no-check-certificate https://github.com/mikewubox/sprov-ui/raw/master/sprov-ui.sh && chmod +x /usr/bin/sprov-ui && sprov-ui

# 全新面板防删备份版V4.3
bash <(curl -Ls https://raw.githubusercontent.com/mikewubox/v2-ui/master/install.sh)

#  基于Nginx 的 vmess+ws+tls 一键安装脚本
bash <(curl -L -s https://raw.githubusercontent.com/mikewubox/V2Ray_ws-tls_bash_onekey/master/install.sh) | tee v2ray_ins.log
