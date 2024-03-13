@echo off
cd /d %~dp0
rem 直接运行C源文件。
tcc.exe -run "%~1" 2>"%temp%\TCC_Error.log" && (goto over)
rem 将报错日志的双引号替换为单引号。
str.exe "%temp%\TCC_Error.log" 0 0 /R /asc:""" /asc:"''" /A
cls
rem 待添加逐行读取报错日志文件的功能，而不是仅读取一行错误。
set /p msg=<"%temp%\TCC_Error.log"
rem 如果运行完成后返回非0时，不进行报错弹窗。
if "%msg%" equ "" goto overnot0
set "lujing=%~1"
rem 把源文件路径的\替换为/，用于替换报错信息中多余的文件路径信息。
set "lujing=%lujing:\=/%"
rem msg变量用于保存报错信息，为什么要加call我忘了。
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
rem 将报错日志的第一行通过弹窗提示用户。
mshta vbscript:msgbox(Replace("%msg%\n→也许不止一个问题~","\n",vbCrLf),16,"Error!")(window.close)
exit
rem 以下代码待优化，保存返回值并在这里输出。
:overnot0
echo.
echo 	程序的返回值非0~
rem 源文件运行的返回值为0时
:over
echo.
echo 	运行成功！
pause>nul
exit
