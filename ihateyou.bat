@echo off
:recursion
set /a counter+=1
echo %counter%
if %counter% lss 1000 goto recursion
pause