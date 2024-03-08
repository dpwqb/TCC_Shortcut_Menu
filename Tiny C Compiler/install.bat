@echo off
cd /d %~dp0
net.exe session 1>NUL 2>NUL && (goto as_admin) || (goto not_admin)
:as_admin
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /d 1 /t REG_DWORD /f
ASSOC .c=c_file 1>NUL 2>NUL
set installdir=%~dp0
str "tcc_shortcut_menuInstallation.reg" 0 0 /R /asc:"TCCDir" /asc:"%installdir:\=\\%" /A 1>NUL 2>NUL
regedit /s tcc_shortcut_menuInstallation.reg
exit
:not_admin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
