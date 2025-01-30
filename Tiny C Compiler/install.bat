@echo off
cd /d %~dp0
net.exe session 1>NUL 2>NUL && (goto as_admin) || (goto not_admin)
:as_admin
rem 开启短文件名，我记得是在导入注册表时需要的特性，忘了。
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /d 1 /t REG_DWORD /f
rem 注册文件类型
ASSOC .c=c_file
rem 设置安装路径
set installdir=%~dp0
rem 替换注册表文件的路径
str "tcc_shortcut_menuInstallation.reg" 0 0 /R /asc:"TCCDir" /asc:"%installdir:\=\\%" /A
rem 添加注册表
regedit /s tcc_shortcut_menuInstallation.reg
rem 检查是否有环境变量，没有就添加到PATH。
echo %PATH% | find /I "%%TCC_HOME%%" >NUL
if errorlevel 1 (
rem 使用setx命令添加TCC_HOME到系统PATH
setx /m PATH "%PATH%;%%TCC_HOME%%"
)
del /f /q "%temp%\getadmin.vbs"
rem 删除安装注册表
del /f /q "tcc_shortcut_menuInstallation.reg"
rem 删除自身
del /f /q %0
exit
:not_admin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
