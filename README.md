# 自动登录 ECUT 校园网

## 使用方法

### Windows

打开`ConnectToCampusNetwork.ps1`，把你的账号密码ISP填进去。

`NIC`填你的网卡名称，中文系统的话插网线一般是「以太网」，WLAN 就是「WLAN」。

把`ConnectToCampusNetwork.ps1`放到`用户目录/Tasks`下（可以在`Connect to Campus Network.xml`中修改）。

`Win-R`运行`taskschd.msc`，点击`导入任务`，将`Connect to Campus Network.xml`导入。

由于 XPath 1.0 的限制，如果校园网在你的设备上显示其他名称（比如`ECUT_STUD 2`)，请自行在 xml 文件中修改。

### Linux

You know what to do.
