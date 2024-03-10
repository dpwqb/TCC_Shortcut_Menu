@echo off
title п╤ть
mode con cols=40 lines=10&color 3F
cd /d %~dp0
set /p uninstalldir=<"%temp%\TinyCCompiler\uninstalldir.log"
del /f /s /q "%temp%\TinyCCompiler\uninstalldir.log" 1>NUL 2>NUL
rd /s /q "%uninstalldir%" 1>NUL 2>NUL
echo.
echo 	п╤тьмЙЁиё║
echo.
pause
del /f %0
exit
