@echo off
title 卸载
mode con cols=40 lines=10&color 3F
cd /d %~dp0
rem 从临时文件读取TCC安装路径
set /p uninstalldir=<"%temp%\TinyCCompiler_uninstalldir.log"
del /f /s /q "%temp%\TinyCCompiler_uninstalldir.log"
rem 删除使用程序时产生的编译报错日志
del /f /q "%temp%\TCC_Error.log"
rd /s /q "%uninstalldir%"
cls
echo.
echo 	卸载完成！
echo.
pause
del /f /q %0
exit
