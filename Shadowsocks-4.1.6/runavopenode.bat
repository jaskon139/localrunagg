rem @echo off
SET /A "index = 1"
SET /A "count = 50000"
start /min kcptun-windows-amd64-20180316.tar\client_windows_amd64.exe -r "10.241.192.50:9999" -l ":12000" -mode fast3 
start /min C:\tools\Shadowsocks-4.1.6\shadowsocks-local-win64-1.1.5\shadowsocks-local.exe -c avopenodeconfig.json
