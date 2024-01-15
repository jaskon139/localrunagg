rem @echo off
SET /A "index = 1"
SET /A "count = 50000"
rem curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://nowdocker-rxkhggahii.now.sh/   
start /min kcptun-windows-amd64-20171113\client_windows_amd64.exe -r "10.241.34.1:9999" -l ":12290" -mode fast2 
start /min shadowsocks-local-win64-1.1.5/shadowsocks-local.exe -c shadowsocks-local-win64-1.1.5/kubesailclient.json
rem :while
rem if %index% leq %count% (
rem    echo The value of index is %index%
rem   SET /A "index = index - 1"
rem    curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://nowdocker-rxkhggahii.now.sh/   
rem   TIMEOUT /T 120
rem   goto :while
rem )