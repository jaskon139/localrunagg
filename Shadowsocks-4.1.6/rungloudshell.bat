rem @echo off
SET /A "index = 1"
SET /A "count = 50000"
rem curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://nowdocker-rxkhggahii.now.sh/   
start /min kcptun-windows-amd64-20180316.tar\client_windows_amd64.exe -r "10.241.21.212:9999" -l ":12010" -mode fast2 
start shadowsocks.exe
:while
if %index% leq %count% (
  echo The value of index is %index%
  SET /A "index = index - 1"
  curl-7.65.3_1-win64-mingw\curl-7.65.3-win64-mingw\bin\curl https://nowdocker-rxkhggahii.now.sh/   
  TIMEOUT /T 120
   goto :while
)