@echo off
title ж��
mode con cols=40 lines=10&color 3F
cd /d %~dp0
rem ����ʱ�ļ���ȡTCC��װ·��
set /p uninstalldir=<"%temp%\TinyCCompiler_uninstalldir.log"
del /f /s /q "%temp%\TinyCCompiler_uninstalldir.log"
rem ɾ��ʹ�ó���ʱ�����ı��뱨����־
del /f /q "%temp%\TCC_Error.log"
rd /s /q "%uninstalldir%"
cls
echo.
echo 	ж����ɣ�
echo.
pause
del /f /q %0
exit
