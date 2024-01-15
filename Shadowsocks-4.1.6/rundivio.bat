rem @echo off
SET /A "index = 1"
SET /A "count = 50000"
curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://githone.us.aldryn.io/
start /min kcptun-windows-amd64-20180316.tar\client_windows_amd64.exe -r "10.241.228.86:9999" -l ":12000" -mode fast3 
start /min C:\tools\Shadowsocks-4.1.6\shadowsocks-local-win64-1.1.5\shadowsocks-local.exe -c avconfig.json
:while
if %index% leq %count% (
   echo The value of index is %index%
   SET /A "index = index - 1"
   curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://githone.us.aldryn.io/
   TIMEOUT /T 120
   goto :while
)