@echo off
title 卸载TCC
mode con cols=40 lines=10&color 3F
cd /d %~dp0
net.exe session 1>NUL 2>NUL && (goto as_admin) || (goto not_admin)
:as_admin
set which=0
echo.
echo 	Tiny C Compiler 卸载程序
echo.
echo 	（y）卸载TCC编译工具
echo.
echo 	（Q）退出卸载程序
echo.
set /p which=→退出or卸载：
if "%which%" equ "y" goto unload
if /i "%which%" equ "q" exit
else (
cls
goto as_admin
)
:unload
regedit /s tcc_shortcut_menuUnload.reg
rem 删除注册表
copy /y "tempUninstall.bat" "%temp%\TinyCCompiler_tempUninstall.bat" 1>NUL 2>NUL
rem 复制安装路径到临时文件
echo %~dp0>"%temp%\TinyCCompiler_uninstalldir.log"
rem 运行临时删除文件
start cmd /c call "%temp%\TinyCCompiler_tempUninstall.bat"
del /f /q "%temp%\getadmin.vbs" 1>NUL 2>NUL
exit
:not_admin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
