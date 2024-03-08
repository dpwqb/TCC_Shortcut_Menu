@echo off
title Ð¶ÔØTCC
mode con cols=40 lines=10&color 3F
cd /d %~dp0
net.exe session 1>NUL 2>NUL && (goto as_admin) || (goto not_admin)
:as_admin
set which=0
echo.
echo 	Tiny C Compiler Ð¶ÔØ³ÌÐò
echo.
echo 	£¨y£©Ð¶ÔØTCC±àÒë¹¤¾ß
echo.
echo 	£¨Q£©ÍË³öÐ¶ÔØ³ÌÐò
echo.
set /p which=¡úÍË³öorÐ¶ÔØ£º
if "%which%" equ "y" goto unload
if /i "%which%" equ "q" exit
else (
cls
goto as_admin
)
:unload
regedit /s tcc_shortcut_menuUnload.reg
md "%temp%\TinyCCompiler" 1>NUL 2>NUL
copy /y "tempUninstall.bat" "%temp%\TinyCCompiler\" 1>NUL 2>NUL
echo %~dp0>"%temp%\TinyCCompiler\uninstalldir.log"
start cmd /c call "%temp%\TinyCCompiler\tempUninstall.bat"
exit
:not_admin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
