@echo off
setlocal enabledelayedexpansion
cd /d %~dp0
rem ֱ������CԴ�ļ���
tcc.exe -run "%~1" 2>"%temp%\TCC_Error.log" && (goto over)
rem ���淵��ֵ
set returnnumber=%ERRORLEVEL%
rem ��������־��˫�����滻Ϊ�����š�
(for /f "tokens=1,* delims=]" %%A in ('"type "%temp%\TCC_Error.log"|find /n /v """') do (
	set "line=%%B"
	if defined line (
		call set "line=echo.%%line:"='%%"
		for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X
	) else echo
))>"%temp%\TCC_Error_str.log"
move /Y "%temp%\TCC_Error_str.log" "%temp%\TCC_Error.log"
cls
rem ���ж�ȡ������־�ļ�
for /f "tokens=*" %%a in (%temp%\TCC_Error.log) do (
	set msg=!msg!\n%%a
)
rem ���������ɺ󷵻ط�0ʱ�������б�������
if "%msg%" equ "" goto overnot0
set "lujing=%~1"
rem ��Դ�ļ�·����\�滻Ϊ/�������滻������Ϣ�ж�����ļ�·����Ϣ��
set "lujing=%lujing:\=/%"
rem �滻�����е�ָ���Ӵ�Ϊָ���ַ�������ʽ����call,set "msg=%%������:���滻���ִ�=Ŀ���ַ���%%"����msg�������ڱ��汨����Ϣ��ΪʲôҪ��call�����ˡ�
call,set "msg=%%msg:%lujing%:= �ڵ�%%"
call,set "msg=%%msg:: warning: =�и����о����%%"
call,set "msg=%%msg:: error: =�и����д����%%"
echo.
echo.
echo.
echo 	C�ļ�·����
echo.
echo 	%~1
echo.
echo.
echo.
echo 	����
echo.
echo  ��ϸ�ı�����־��%temp%\TCC_Error.log
echo %msg:\n �ڵ�=	������Ϣ��%
rem ��������־��ͨ��������ʾ�û���
mshta vbscript:msgbox(Replace("%msg%\n\n�����һ����Ϳ~","\n",vbCrLf),16,"Error!")(window.close)
exit
rem ������ķ���ֵ�����
:overnot0
echo.
echo 	����ķ���ֵΪ��%returnnumber%
rem Դ�ļ����еķ���ֵΪ0ʱ
:over
echo.
echo 	���гɹ���
pause>nul
exit
