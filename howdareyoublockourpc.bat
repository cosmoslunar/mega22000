@echo off
set "FOLDER=C:\Collatz"
if not exist "%FOLDER%" mkdir "%FOLDER%"

for /L %%i in (1,1,10000000000000000000000000000000000000000000000000000000000000000) do (
    start cmd /c call :Collatz %%i
)
exit /b

:Collatz
setlocal enabledelayedexpansion
set n=%1
set output=%FOLDER%\%n%.txt

echo Trying Collatz conjecture for %n%
echo %n% > "%output%"

:loop
if !n!==1 (
    exit /b
)
set /a rem=!n! %% 2
if !rem!==0 (
    set /a n=!n!/2
) else (
    set /a n=!n!*3+1
)
echo !n!>> "%output%"
goto loop