@echo off
cd /d %~dp0
tcc.exe "%~1" -o "%~dpn1_tcc.exe" 2>"%temp%\TCC_Error.log" && (goto over)
str.exe "%temp%\TCC_Error.log" 0 0 /R /asc:""" /asc:"''" /A
cls
set /p msg=<"%temp%\TCC_Error.log"
if "%msg%" equ "" goto over
set "lujing=%~1"
set "lujing=%lujing:\=/%"
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
mshta vbscript:msgbox(Replace("%msg%\n��Ҳ��ֹһ������~","\n",vbCrLf),16,"Error!")(window.close)
)
exit
:over
"%~dpn1_tcc.exe"
echo.
echo 	���гɹ���
pause>nul
exit
