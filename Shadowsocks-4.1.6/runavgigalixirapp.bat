rem @echo off
echo %1  %2 %3 %4
SET /A "index = 1"
SET /A "count = 50000"
rem start /min /B C:\tools\Shadowsocks-4.1.6\kcptun-windows-amd64-20171113\client_windows_amd64.exe -r "10.241.228.86:9999" -l ":12000" -mode fast2

C:\tools\Shadowsocks-4.1.6\kcptun-windows-amd64-20171113\client_windows_amd64.exe -r "10.241.228.86:9999" -l ":%2" -mode fast2

rem start /min /B C:\tools\Shadowsocks-4.1.6\shadowsocks-local.exe -c avconfig.json
rem C:\tools\Shadowsocks-4.1.6\shadowsocks-local.exe -c avconfig.json
