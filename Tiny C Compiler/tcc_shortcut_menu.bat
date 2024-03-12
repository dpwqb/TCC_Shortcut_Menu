@echo off
cd /d %~dp0
tcc.exe "%~1" -o "%~dpn1_tcc.exe" 2>"%temp%\TCC_Error.log" && (goto over)
str.exe "%temp%\TCC_Error.log" 0 0 /R /asc:""" /asc:"''" /A
cls
set /p msg=<"%temp%\TCC_Error.log"
if "%msg%" equ "" goto over
set "lujing=%~1"
set "lujing=%lujing:\=/%"
call,set "msg=%%msg:%lujing%=出错啦！%%"
echo.
echo.
echo.
echo 	C文件路径：
echo.
echo 	%~1
echo.
echo.
echo.
echo 	错误：
echo.
echo 	%msg:出错啦！=%
mshta vbscript:msgbox(Replace("%msg%\n→也许不止一个问题~","\n",vbCrLf),16,"Error!")(window.close)
)
exit
:over
"%~dpn1_tcc.exe"
echo.
echo 	运行成功！
pause>nul
exit
