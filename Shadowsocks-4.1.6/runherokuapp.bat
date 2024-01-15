rem @echo off
SET /A "index = 1"
SET /A "count = 50000"
curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://calm-sea-90113.herokuapp.com/ 
start /min kcptun-windows-amd64-20180316.tar\client_windows_amd64.exe -r "10.241.69.123:9999" -l ":12100" -mode fast2 
start Shadowsocks.exe
:while
if %index% leq %count% (
   echo The value of index is %index%
   SET /A "index = index - 1"
   curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://calm-sea-90113.herokuapp.com/   
   TIMEOUT /T 120
   goto :while
)