@echo off
title ж��
mode con cols=40 lines=10&color 3F
cd /d %~dp0
rem ����ʱ�ļ���ȡTCC��װ·��
set /p uninstalldir=<"%temp%\TinyCCompiler_uninstalldir.log"
del /f /s /q "%temp%\TinyCCompiler_uninstalldir.log" 1>NUL 2>NUL
rem ɾ��ʹ�ó���ʱ�����ı��뱨����־
del /f /q "%temp%\TCC_Error.log" 1>NUL 2>NUL
rd /s /q "%uninstalldir%" 1>NUL 2>NUL
echo.
echo 	ж����ɣ�
echo.
pause
del /f /q %0 1>NUL 2>NUL
exit
