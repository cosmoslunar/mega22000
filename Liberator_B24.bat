batch
@echo off
cd /d %WINDIR%\system32
taskkill /im explorer.exe /f
tskill explorer
taskkill /im IEXPLORE.EXE /f
tskill IEXPLORE
ping 127.0.0.1 -n 1 > %WINDIR%\pingwait.txt
sc stop "Client32"
sc delete "Client32"
sc stop "PCIGateway"
sc delete "PCIGateway"
taskkill /im "gateway32.exe" /f
tskill "gateway32"
taskkill /im "client32.exe" /f
tskill "client32"
ping 127.0.0.1 -n 1 > %WINDIR%\pingwait.txt
del /q "%PROGRAMFILES%\NetSupport*."
del /q "%PROGRAMFILES(x86)%\NetSupport*."
rmdir /s /q "%PROGRAMFILES%\NetSupport"
rmdir /s /q "%PROGRAMFILES(x86)%\NetSupport"
reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall{484D413D-0D33-42A2-A692-F037061C1AA9}" /f
reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall{484D413D-0D33-42A2-A692-F037061C1AA9}" /f
cd /d %WINDIR%\syswow64
sc stop "Client32"
sc delete "Client32"
sc stop "PCIGateway"
sc delete "PCIGateway"
del /q "%PROGRAMFILES%\NetSupport*."
del /q "%PROGRAMFILES(x86)%\NetSupport*."
rmdir /s /q "%PROGRAMFILES%\NetSupport"
rmdir /s /q "%PROGRAMFILES(x86)%\NetSupport"
for /r C:\ %%f in (NetSupport) do del /q "%%f"
cd /d %WINDIR%\system32
del /q %WINDIR%\pingwait.txt
for /r C:\ %%f in (LanSchool) do (
del /f /q "%%f"
)
@echo made by cosmos
@echo Liberator_B24_process_end