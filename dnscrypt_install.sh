#!/bin/sh
yum -y update
export SERVER=$(hostname)
export SERVER_IP=`ip route get 1 | awk '{print $NF;exit}'`
echo $SERVER
echo $SERVER_IP
docker run --name=dnscrypt-server -p 443:443/udp -p 443:443/tcp --net=host jedisct1/dnscrypt-server init -N $SERVER -E $SERVER_IP:443
docker update --restart=unless-stopped dnscrypt-server
docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock v2tec/watchtower dnscrypt-server
docker update --restart=unless-stopped watchtower
docker cp dnscrypt-server:/opt/dnscrypt-wrapper/etc/keys /root
yum remove -y firewalld
yum install -y iptables-services
systemctl start iptables
systemctl enable iptables
/usr/libexec/iptables/iptables.init save
sed -i 's/-A INPUT -i lo -j ACCEPT/\n-A INPUT -p udp -m state --state NEW -m udp --dport 443 -j ACCEPT/' /etc/sysconfig/iptables
sed -i 's/-A INPUT -i lo -j ACCEPT/\n-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT/' /etc/sysconfig/iptables
reboot