@echo off
setlocal enabledelayedexpansion
set "TARGET=kkk.bat"
set "COUNT=100"
for /L %%i in (1,1,%COUNT%) do start cmd /c call "%TARGET%"