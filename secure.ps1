If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell "-File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$scriptPath = $MyInvocation.MyCommand.Path
attrib +R $scriptPath

$words = Get-Content "wordlist.txt"

while ($true) {
    $processes = Get-Process
    foreach ($p in $processes) {
        foreach ($word in $words) {
            if ($p.Name -like "*$word*") {
                try { Stop-Process -Id $p.Id -Force } catch {}
            }
        }
    }
    Start-Sleep -Seconds 1
}