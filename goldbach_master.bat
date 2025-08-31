@echo off
setlocal enabledelayedexpansion

set TOTAL_START=4
set TOTAL_END=2147483647
set NUM_CMD=1000
set OUTPUT_FILE=C:\goldbach_results.txt

if exist %OUTPUT_FILE% del %OUTPUT_FILE%

set /a RANGE_SIZE=(TOTAL_END-TOTAL_START+1)/NUM_CMD
set /a REMAINDER=(TOTAL_END-TOTAL_START+1)%%NUM_CMD
set /a CUR_START=%TOTAL_START%

for /L %%i in (1,1,%NUM_CMD%) do (
    set /a CUR_END=CUR_START+RANGE_SIZE-1
    if %%i==%NUM_CMD% set /a CUR_END=CUR_END+REMAINDER
    for /f "delims=" %%L in ('call goldbach_worker.bat !CUR_START! !CUR_END!') do (
        echo %%L>>%OUTPUT_FILE%
    )
    set /a CUR_START=CUR_END+1
)