@echo off
setlocal
set "PS_SCRIPT=%~dp0secure.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File `\"%PS_SCRIPT%`\"' -Verb RunAs; exit} else {Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; & '%PS_SCRIPT%'}"
endlocal