---
title: Apache-FastCGI方式加载NTS-PHP
categories: Apache-FastCGI-NTS-PHP
tags: Apache-FastCGI-NTS-PHP
---



```
注意事项：目录不能包含空格,apache启动失败看事件日志错误详情
 <Directory "C:/Program Files (x86)/info2soft-ctrlcenter/Apache Software Foundation/Apache2.2/htdocs">
 Options Indexes ExecCGI
 Order allow,deny
 allow from all
 </Directory>

下载nts php
http://windows.php.net/downloads/releases/archives/
Zend Guard Loader(对应php版本)
https://www.zend.com/en/products/loader/downloads#Windows
下载mod_fcgid.so 2.3.4
http://archive.apache.org/dist/httpd/binaries/win32/




php.ini
	最后添加以下几行
	[Zend.loader]
	zend_loader.enable=1
	zend_loader.disable_licensing=1
	zend_loader.obfuscation_level_support=3
	zend_loader.license_path=
	zend_extension = "C:\info2soft-ctrlcenter\php-5.3.23-nts-Win32-VC9-x86\ext\ZendLoader.dll"
	; Disable license checks (for performance reasons)
	zend_loader.disable_licensing=1
另外(注意写对php目录)
	extension_dir ="C:\info2soft-ctrlcenter\php-5.3.23-nts-Win32-VC9-x86\ext"

httpd.conf
	LoadModule fcgid_module modules/mod_fcgid.so
	AddHandler fcgid-script .fcgi .php
	#php.ini的存放目录
	FcgidInitialEnv PHPRC "C:/info2soft-ctrlcenter/php-5.3.23-nts-Win32-VC9-x86"
	# 设置PHP_FCGI_MAX_REQUESTS大于或等于FcgidMaxRequestsPerProcess，防止php-cgi进程在处理完所有请求前退出
	FcgidInitialEnv PHP_FCGI_MAX_REQUESTS 1000
	#php-cgi每个进程的最大请求数
	FcgidMaxRequestsPerProcess 1000
	#php-cgi最大的进程数
	FcgidMaxProcesses 3
	#最大执行时间
	FcgidIOTimeout 120
	FcgidIdleTimeout 120
	#php-cgi的路径
	FcgidWrapper "C:/info2soft-ctrlcenter/php-5.3.23-nts-Win32-VC9-x86/php-cgi.exe" .php
	AddType application/x-httpd-php .php
	
	
注释旧的配置
	#PHPIniDir "C:/info2soft-ctrlcenter/php-5.3.23-nts-Win32-VC9-x86"
	#LoadModule php5_module "C:/info2soft-ctrlcenter/php-5.3.23-nts-Win32-VC9-x86/php5apache2_2.dll"
	#AddHandler application/x-httpd-php .php




重启服务

若界面报错i2/index.php需要ioncube_loader_win_5.3.dll
下载ioncube_loaders_win_nonts_vc9_x86
http://www.ioncube.com/loaders.php
需对应php版本 nts vc9 x86

```

