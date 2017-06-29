# This script creates file to activate NoPetya/Petrwrap/ExPetr/GoldenEye kill switch.
# More info:
# 	https://twitter.com/PTsecurity_UK/status/879779707075665922
# 	https://twitter.com/PTsecurity_UK/status/879779707075665922
# 	https://securelist.com/schroedingers-petya/78870/

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Remove-Item -Path C:\Windows\perfc.* -Force

$tmp = New-Item C:\Windows\perfc.dat -type file
$tmp = New-Item C:\Windows\perfc.dll -type file

Set-ItemProperty -Path C:\Windows\perfc.dat -Name IsReadOnly -Value $true
Set-ItemProperty -Path C:\Windows\perfc.dll -Name IsReadOnly -Value $true
