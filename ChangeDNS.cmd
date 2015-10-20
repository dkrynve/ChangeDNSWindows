:: Set primary and alternate DNS for IPv4 on Windows Server 2000/2003/2008 & 
:: Windows XP/Vista/7
@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET adapterName=

FOR /F "tokens=* delims=:" %%a IN ('IPCONFIG ^| FIND /I "ETHERNET ADAPTER"') DO (
SET adapterName=%%a

REM Removes "Ethernet adapter" from the front of the adapter name
SET adapterName=!adapterName:~17!

REM Removes the colon from the end of the adapter name
SET adapterName=!adapterName:~0,-1!

netsh interface ipv4 set dns name="!adapterName!" static 10.161.247.250 primary
netsh interface ipv4 add dns name="!adapterName!" 10.151.63.250 index=2
)

ipconfig /flushdns

:EOF