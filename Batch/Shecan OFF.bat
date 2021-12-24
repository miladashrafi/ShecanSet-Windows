@echo off
cd /D %~dp0
cls
Powershell.exe -f "..\Powershell\Shecan OFF.ps1"
pause