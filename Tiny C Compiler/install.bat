@echo off
cd /d %~dp0
net.exe session 1>NUL 2>NUL && (goto as_admin) || (goto not_admin)
:as_admin
rem �������ļ�������Ҳ���˸����õ��ˣ���ɾ��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /d 1 /t REG_DWORD /f
rem ע���ļ�����
ASSOC .c=c_file 1>NUL 2>NUL
rem ���ð�װ·��
set installdir=%~dp0
rem �滻ע����ļ���·��
str "tcc_shortcut_menuInstallation.reg" 0 0 /R /asc:"TCCDir" /asc:"%installdir:\=\\%" /A 1>NUL 2>NUL
rem ���ע���
regedit /s tcc_shortcut_menuInstallation.reg
rem ����Ƿ��л���������û�о���ӵ�PATH��
echo %PATH% | findstr /C:"%TCC_HOME%" 1>NUL 2>NUL
if errorlevel 1 (
rem ʹ��setx�������TCC_HOME��ϵͳPATH
setx /m PATH "%PATH%;%TCC_HOME%"
)
del /f /q "%temp%\getadmin.vbs" 1>NUL 2>NUL
rem ɾ����װע���
del /f /q "tcc_shortcut_menuInstallation.reg" 1>NUL 2>NUL
rem ɾ������
del /f /q %0 1>NUL 2>NUL
exit
:not_admin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
