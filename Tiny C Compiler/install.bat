@echo off
cd /d %~dp0
net.exe session 1>NUL 2>NUL && (goto as_admin) || (goto not_admin)
:as_admin
rem �������ļ������Ҽǵ����ڵ���ע���ʱ��Ҫ�����ԣ����ˡ�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /d 1 /t REG_DWORD /f
rem ע���ļ�����
ASSOC .c=c_file
rem ���ð�װ·��
set installdir=%~dp0
rem �滻ע����ļ���·��
(for /f "tokens=1,* delims=]" %%A in ('"type tcc_shortcut_menuInstallation.reg|find /n /v """') do (
	set "line=%%B"
	if defined line (
		call set "line=echo.%%line:TCCDir\=%installdir:\=\\%%%"
		for /f "delims=" %%X in ('"echo."%%line%%""') do %%~X
	) else echo
))>tcc_shortcut_menuInstallation_str.reg
rem �滻��ɵ�ע����ļ������滻ǰ���ļ�
move /Y tcc_shortcut_menuInstallation_str.reg tcc_shortcut_menuInstallation.reg
rem ����ע���
regedit /s tcc_shortcut_menuInstallation.reg
rem ����Ƿ��л���������û�о���ӵ�PATH��
echo %PATH% | find /I "%%TCC_HOME%%" >NUL
if errorlevel 1 (
	rem ʹ��setx�������TCC_HOME��ϵͳPATH
	setx /m PATH "%PATH%%%TCC_HOME%%"
)
del /f /q "%temp%\getadmin.vbs"
rem ɾ����װע���
del /f /q "tcc_shortcut_menuInstallation.reg"
rem ɾ������
del /f /q %0
exit
:not_admin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
