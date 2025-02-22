# TCC_Shortcut_Menu
#### *这是附带快捷菜单的TCC安装包。*
![图标](./tcc.png)

此项目引用了*Tiny C Compiler*。

为编译器添加了全局环境变量，方便其他程序调用。

添加了右键快捷菜单，让C语言源文件的创建和运行更加便捷！

在控制面板可卸载软件，去不留痕~

My [Github Page](https://dpoqb.top/)

[TCC官网](http://www.tinycc.org/)

## 打包说明：

实现快捷菜单功能的主体主要是由batch脚本完成。

~~因此直接运行`.\Tiny C Compiler\install.bat`即可在当前目录安装~~。

但为了方便发布，不应当直接运行`install.bat`来安装。

这里更推荐将`.\Tiny C Compiler`文件夹使用压缩软件打包成自解压的压缩包。

并且一定要设置：在解压完成后运行`Tiny C Compiler`目录中的`install.bat`文件。

可以使用WinRAR通过以下命令创建自解压安装包：

```
"C:\Program Files\WinRAR\rar.exe" a -sfx"Default.SFX" -zWinRAR自解压注释.txt -m5 -s -md4m -oi1 -ol -r TinyC_Installer.exe ".\Tiny C Compiler\"
```

如果你不想自己打包，这里也有已经打包完成的[安装包](https://github.com/dpwqb/TCC_Shortcut_Menu/releases/download/release/TccForShell_x86_release.exe)可供下载。
