@echo off
cd /d %~dp0
rem ֱ������CԴ�ļ���
tcc.exe -run "%~1" 2>"%temp%\TCC_Error.log" && (goto over)
rem ��������־��˫�����滻Ϊ�����š�
str.exe "%temp%\TCC_Error.log" 0 0 /R /asc:""" /asc:"''" /A
cls
rem ��������ж�ȡ������־�ļ��Ĺ��ܣ������ǽ���ȡһ�д���
set /p msg=<"%temp%\TCC_Error.log"
rem ���������ɺ󷵻ط�0ʱ�������б�������
if "%msg%" equ "" goto overnot0
set "lujing=%~1"
rem ��Դ�ļ�·����\�滻Ϊ/�������滻������Ϣ�ж�����ļ�·����Ϣ��
set "lujing=%lujing:\=/%"
rem msg�������ڱ��汨����Ϣ��ΪʲôҪ��call�����ˡ�
call,set "msg=%%msg:%lujing%=��������%%"
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
echo 	%msg:��������=%
rem ��������־�ĵ�һ��ͨ��������ʾ�û���
mshta vbscript:msgbox(Replace("%msg%\n��Ҳ��ֹһ������~","\n",vbCrLf),16,"Error!")(window.close)
exit
rem ���´�����Ż������淵��ֵ�������������
:overnot0
echo.
echo 	����ķ���ֵ��0~
rem Դ�ļ����еķ���ֵΪ0ʱ
:over
echo.
echo 	���гɹ���
pause>nul
exit
