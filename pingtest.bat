for /l %%i in (1,1,255) do ping -n 1   -w 1 192.168.1.%%i
pause