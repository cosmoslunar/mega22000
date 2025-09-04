@echo off
set COUNT=2000000

for /l %%i in (1,1,10000) do (
    echo ==== Loop %%i start ====
    ping 127.0.0.1 -n %COUNT% >nul
    echo ==== Loop %%i end ====
)
echo finish
pause