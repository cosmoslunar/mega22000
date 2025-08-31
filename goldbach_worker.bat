@echo off
setlocal enabledelayedexpansion
set /a START=%1
set /a END=%2

:isp
set /a n=%1
if %n% lss 2 exit /b 0
set /a limit=%n%/2
for /L %%i in (2,1,!limit!) do (
    set /a mod=%n%%%i
    if !mod!==0 exit /b 0
)
exit /b 1

for /L %%n in (%START%,2,%END%) do (
    for /L %%i in (2,1,%%n) do (
        call :isp %%i
        if !errorlevel! equ 1 (
            set /a j=%%n-%%i
            call :isp !j!
            if !errorlevel! equ 1 (
                echo %%n = %%i + !j!
                goto nextNumber
            )
        )
    )
    :nextNumber
)
exit /b 0