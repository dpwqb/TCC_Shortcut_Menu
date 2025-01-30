@echo off
setlocal enabledelayedexpansion
cd /d %~dp0
rem 直接运行C源文件。
tcc.exe -run "%~1" 2>"%temp%\TCC_Error.log" && (goto over)
rem 保存返回值
set returnnumber=%ERRORLEVEL%
rem 将报错日志的双引号替换为单引号。
(for /f "tokens=1,* delims=]" %%A in ('"type "%temp%\TCC_Error.log"|find /n /v """') do (
	set "line=%%B"
	if defined line (
		call set "line=echo.%%line:"='%%"
		for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X
	) else echo
))>"%temp%\TCC_Error_str.log"
move /Y "%temp%\TCC_Error_str.log" "%temp%\TCC_Error.log"
cls
rem 逐行读取报错日志文件
for /f "tokens=*" %%a in (%temp%\TCC_Error.log) do (
	set msg=!msg!\n%%a
)
rem 如果运行完成后返回非0时，不进行报错弹窗。
if "%msg%" equ "" goto overnot0
set "lujing=%~1"
rem 把源文件路径的\替换为/，用于替换报错信息中多余的文件路径信息。
set "lujing=%lujing:\=/%"
rem 替换变量中的指定子串为指定字符串，格式：“call,set "msg=%%变量名:被替换的字串=目标字符串%%"”，msg变量用于保存报错信息，为什么要加call我忘了。
call,set "msg=%%msg:%lujing%:= 在第%%"
call,set "msg=%%msg:: warning: =行附近有警告→%%"
call,set "msg=%%msg:: error: =行附近有错误→%%"
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
echo  详细的报错日志在%temp%\TCC_Error.log
echo %msg:\n 在第=	错误信息：%
rem 将报错日志的通过弹窗提示用户。
mshta vbscript:msgbox(Replace("%msg%\n\n→错的一塌糊涂~","\n",vbCrLf),16,"Error!")(window.close)
exit
rem 将保存的返回值输出。
:overnot0
echo.
echo 	程序的返回值为：%returnnumber%
rem 源文件运行的返回值为0时
:over
echo.
echo 	运行成功！
pause>nul
exit
