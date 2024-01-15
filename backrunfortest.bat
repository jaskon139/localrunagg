echo %1 %2 %3 %4

TASKKILL /F /IM openvpn.exe
TASKKILL /F /IM openvpn-gui.exe
TASKKILL /F /IM openvpnserv.exe
TASKKILL /F /IM Netch.exe
TASKKILL /F /IM gost-windows-amd64.exe
TASKKILL /F /IM v2ray.exe
TASKKILL /F /IM clash.exe
TASKKILL /F /IM dnscrypt-proxy.exe

rem aggtunnel
start /MIN /B c:\opensource\aggligator-util-v0.11.0\target\debug\agg-tunnel.exe client -g --port 22:4301 --port 1194:4194 --tcp 192.168.43.1:7002 --tcp 192.168.44.1:7003 --tcp 192.168.45.1:15959 --tcp 192.168.46.1:7005 -n

rem gost 
rem start /MIN /B C:\opensource\gost\gost-windows-amd64.exe -L=:23232 -L=tcp://:7001/jaskon139-junjieh7.koyeb.app:443 -L=tcp://:7002/172.66.44.208:443 -L=tcp://:7003/vm2jaskon139.dynv6.net:4949 -F=http://127.0.0.1:7890  >nul 2>nul

rem aggtunnel
rem wsl.exe ~ -d Ubuntu-20.04  -u root "/home/jaskon139/runalltest.sh"
rem start /MIN /B wsl.exe ~ -d Ubuntu-20.04 -u jaskon139 "/home/jaskon139/runagg.sh"


cd C:\tools\wifibat

rem xray
rem start /MIN /B  C:\tools\v2ray\4.21.3\v2ray.exe run -c .\xray\jaskon139-junjieh7koyebapp.json
start /MIN /B  C:\tools\v2ray\4.21.3\v2ray.exe run -c .\xray\vleascloudflare.json
start /MIN /B  C:\tools\v2ray\4.21.3\v2ray.exe run -c .\xray\vm2jaskon139.json
start /MIN /B  C:\tools\v2ray\4.21.3\v2ray.exe run -c .\xray\jaskon139-junjieh7koyebapp.json
rem start /MIN /B  C:\tools\Netch\Netch.exe
start /MIN /B  C:\opensource\clash\clash.exe -d .\clashconfig

timeout /T 3
rem curl  http://127.0.0.1:4194 -L -v

rem openvpn
cd C:\tools\portapps\openvpn-portable\app\
start /MIN /B .\win10\bin\openvpn-gui.exe --connect thinkpcthis.ovpn

rem dns 
cd c:\tools\dnscrypt-proxy-win64-2.0.45\win64
.\dnscrypt-proxy.exe -config example-dnscrypt-proxy4.toml


rem start .\openvpn-gui.exe --command disconnect_all
rem start .\openvpn-gui.exe --connect japanese.ovpn 
 
rem cd C:\cygwin64\home\hyt

rem cd '/home/hyt/temp/chinaunicom-AutoSignMachine'
rem ./rungetoo.sh > /dev/null 2>&1 &

rem cd /cygdrive/c/tools/v2ray/v2rayN-Core
rem ./v2ray.exe -c ../testhttp.json > /dev/null 2>&1 &

rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F=http://123.125.142.40:443
rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F=http://157.255.78.51:443
rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F=http://112.80.255.21:443
rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F=http://163.177.151.162:443
rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F=http://157.0.148.53:443
rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F=http://153.3.236.22:443

rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F=http://180.97.104.168:443


rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F="http://localhost:443?ip=180.97.93.202:443,36.152.45.98:443,36.152.45.97:443,153.3.236.22:443,180.97.104.168:443,157.255.78.51:443,183.232.233.5:443,157.0.148.53:443,220.181.111.189:443&strategy=round&max_fails=1&fail_timeout=30s"

rem c:\temp\gost2\gost\cmd\gost\gost -D -L=tcp://127.0.0.1:%2/%3:%4 -L=:8980 -F="http://localhost:443?ip=153.3.236.22:443,157.255.78.51:443,157.0.148.53:443&strategy=round&max_fails=1&fail_timeout=30s"

rem 180.97.93.202

rem 中国 江苏 南京 移动36.152.45.98

rem 中国 江苏 南京 移动36.152.45.97

rem 中国 北京 北京 电信220.181.111.189

rem 中国 江苏 南京 联通153.3.236.22

rem 中国 江苏 南京 电信180.97.104.168

rem 中国 广东 广州 联通157.255.78.51

rem 183.232.233.5

rem 157.0.148.53

rem          220.181.33.174
rem          110.242.70.68
rem          163.177.17.6
rem          183.240.98.84
rem          110.242.70.69
rem          14.215.182.75
rem          36.155.169.188
rem          157.0.148.53
rem          163.177.17.189
rem          153.3.237.117
rem          180.101.50.249
rem          180.101.50.208
rem          220.181.7.1
rem          220.181.111.189