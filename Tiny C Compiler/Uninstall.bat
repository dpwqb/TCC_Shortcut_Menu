@echo off
title ж��TCC
mode con cols=40 lines=10&color 3F
cd /d %~dp0
net.exe session 1>NUL 2>NUL && (goto as_admin) || (goto not_admin)
:as_admin
set which=0
echo.
echo 	Tiny C Compiler ж�س���
echo.
echo 	��y��ж��TCC���빤��
echo.
echo 	��Q���˳�ж�س���
echo.
set /p which=���˳�orж�أ�
if "%which%" equ "y" goto unload
if /i "%which%" equ "q" exit
else (
cls
goto as_admin
)
:unload
regedit /s tcc_shortcut_menuUnload.reg
rem ɾ��ע���
copy /y "tempUninstall.bat" "%temp%\TinyCCompiler_tempUninstall.bat" 1>NUL 2>NUL
rem ���ư�װ·������ʱ�ļ�
echo %~dp0>"%temp%\TinyCCompiler_uninstalldir.log"
rem ������ʱɾ���ļ�
start cmd /c call "%temp%\TinyCCompiler_tempUninstall.bat"
del /f /q "%temp%\getadmin.vbs" 1>NUL 2>NUL
exit
:not_admin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
