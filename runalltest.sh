#!/bin/bash

source /root/.bashrc

echo "hello world"

retvalue=$(/usr/bin/nmcli device show wlan0 | /usr/bin/grep "IP4.GATEWAY" | /usr/bin/awk '{print $2}' )
echo $retvalue

/usr/sbin/route add -net 0.0.0.0/0 gw $retvalue metric 50

/usr/sbin/htpdate -s -t 157.148.69.74

#/usr/sbin/iptables -t nat -A POSTROUTING -j MASQUERADE 
# Masquerade outgoing traffic

#/usr/sbin/iptables -t nat -A POSTROUTING -o usb0 -j MASQUERADE
#/usr/sbin/iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

# Allow return traffic
#/usr/sbin/iptables -A INPUT -i usb0 -m state --state RELATED,ESTABLISHED -j ACCEPT
#/usr/sbin/iptables -A INPUT -i tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Forward everything
#/usr/sbin/iptables -A FORWARD -j ACCEPT

#/usr/sbin/route add -host 157.0.148.53 gw $retvalue metric 5
#/usr/sbin/route add -host 157.255.78.51 gw $retvalue metric 5
#/usr/sbin/route add -host 153.3.236.22 gw $retvalue metric 5
#/usr/sbin/route add -host 114.114.114.114 gw $retvalue metric 5
/usr/sbin/route add -host 157.255.72.18 gw $retvalue metric 5
/usr/sbin/route add -host 157.255.78.51 gw $retvalue metric 5
/usr/sbin/route add -host 157.0.148.53 gw $retvalue metric 5
/usr/sbin/route add -host 153.3.237.117 gw $retvalue metric 5

/usr/sbin/ip tuntap add dev tun2 mode tun
/usr/sbin/ifconfig tun2 192.168.168.0/24 netmask 255.255.255.0
/usr/sbin/route add default gw 192.168.168.2 metric 6

/usr/sbin/ip tuntap add dev tun3 mode tun
/usr/sbin/ifconfig tun3 192.168.178.0/24 netmask 255.255.255.0

/usr/sbin/ip tuntap add dev tun4 mode tun
/usr/sbin/ifconfig tun4 192.168.198.0/24 netmask 255.255.255.0

/usr/sbin/ip tuntap add dev tun5 mode tun
/usr/sbin/ifconfig tun5 192.168.188.0/24 netmask 255.255.255.0

/usr/sbin/ip tuntap add dev tun6 mode tun
/usr/sbin/ifconfig tun6 192.168.178.0/24 netmask 255.255.255.0

/root/badvpn/ok/badvpn-tun2socks --netif-ipaddr 192.168.168.2 --netif-netmask 255.255.255.0 --socks-server-addr "127.0.0.1:9991" --tundev "tun2" > /dev/null  &

/usr/bin/pkill gost-linux-armv7
/usr/bin/pkill v2ray
#/usr/bin/pkill badvpn-tun2socks
/usr/bin/pkill dnscrypt-proxy
/usr/bin/pkill arm64-linux-clash

cd /root/clash/arm-linux
/root/clash/arm-linux/arm64-linux-clash -d ./config &
/root/clash/arm-linux/arm64-linux-clash -d ./config2 & 
/root/clash/arm-linux/arm64-linux-clash -d ./config3 &

cd /root/gost
./gost-linux-armv7 -L=:9991 -F='http://localhost:3457?ip=127.0.0.1:7890,127.0.0.1:17890&strategy=round&max_fails=1&fail_timeout=30s' > /dev/null & 
./gost-linux-armv7 -L=:9992 -F='http://localhost:13457?ip=127.0.0.1:5181,127.0.0.1:10809,127.0.0.1:17809&strategy=round&max_fails=1&fail_timeout=30s' > /dev/null &
./gost-linux-armv7 -L=:7878 -F='socks://localhost:3456?ip=vm1jaskon139.dynv6.net:65123,10.241.207.160:65123&strategy=round&max_fails=1&fail_timeout=30s' > /dev/null  &
./gost-linux-armv7 -L=:17878 -F='socks://localhost:13456?ip=vm1jaskon139.dynv6.net:65080,10.241.207.160:65080&strategy=round&max_fails=1&fail_timeout=30s' > /dev/null &
./gost-linux-armv7 -L=:10241 > /dev/null &
./gost-linux-armv7 -L=:9333 -F=socks5://$retvalue:9222 > /dev/null &

sleep 10

/root/graftcp/agg-tunnel client -g --port 65123:2345 --port 22:4201 --port 1194:3194  --tcp 192.168.147.10:14949 --tcp 192.168.68.1:4949 -n > /tmp/logtunnel 2>&1 &
/root/graftcp/agg-tunnel client -g --port 65123:4345 --port 22:4301 --port 1194:4194  --tcp 192.168.147.10:15959 --tcp 192.168.68.1:5959  --tcp 192.168.168.0:6060  --tcp 192.168.178.0:6062 --tcp 192.168.198.0:6063 --tcp 192.168.188.0:6064 --tcp 127.0.0.1:6061 --tcp 192.168.178.0:6065 -n > /tmp/logtunnel2 2>&1 &

cd /root/dnsproxy/linux-arm64
#/root/graftcp/mgraftcp --socks5 127.0.0.1:9991 
#/root/graftcp/mgraftcp --socks5 127.0.0.1:17891 
/root/graftcp/mgraftcp --socks5 127.0.0.1:27891 ./dnscrypt-proxy -config example-dnscrypt-proxy.toml > /dev/null &

cd /root/xray
/root/graftcp/mgraftcp --socks5 127.0.0.1:27891  ./xray -c ./zzzzflare.json  &
/root/graftcp/mgraftcp --socks5 127.0.0.1:27891  ./xray -c ./vm2config.json &
/root/graftcp/mgraftcp --socks5 127.0.0.1:27891  ./xray -c ./vm2config2.json &
/root/graftcp/mgraftcp --socks5 127.0.0.1:27891  ./xray -c ./jaskon139-junjieh7_koyeb_app.json & 
#./xray -c ./zzzzflare.json  &
#./xray -c ./vm2config.json &
#/root/getipv6.sh 
./xray -c ./vlesstest.json &
#./xray -c vm2config127001.json &

cd /root
#./rungetdns.sh &

sleep 30

/usr/sbin/htpdate -s -t -P 127.0.0.1:9991 ntp.neu.edu.cn 

#cd /root/dnsproxy/cloudflare
#/root/dnsproxy/cloudflare/runchange.sh &

cd /root/openvpn
/bin/bash ./openrun.sh &
/bin/bash ./openrun2.sh &
#/usr/sbin/openvpn --config ./idroot3.ovpn &
#/usr/sbin/openvpn --config ./vpngate.ovpn &

/root/getip.sh &

/usr/bin/systemctl start AdGuardHome &
