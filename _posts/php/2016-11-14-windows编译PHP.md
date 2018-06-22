---
title: windows编译PHP
categories: PHP
tags: PHP
---

<h4>windows编译PHP</h4>

参考：https://blog.ianli.site/2013/09/build-php-and-extension-for-windows/

编译php5.6

需要的文件:

a.下载vs2012

b.PHP源代码。推荐从官网下载。

c.PHP SDK。需要从这里下载两个压缩包：deps-5.6-vc11-x86.7z（下载对应版本的依赖包）和 php-sdk-binary-tools-20110915.zip（sdk，有更新的文件可以下新的）。

http://windows.php.net/downloads/php-sdk/




![img](/img/demo/windows-php-demo-3.png)

![img](/img/demo/windows-php-demo-1.png)



打开vs2012 x64 Native Tools Command Prompt

```
cd C:\php-sdk
bin\phpsdk_setvars.bat
bin\phpsdk_buildtree.bat phpdev
cd C:\php-sdk\phpdev\vc11\x86\php-5.6.32-src
buildconf
configure --help
configure --enable-cli-win32 --with-bz2 --with-curl --with-dba --enable-fileinfo --with-gettext --with-gmp --with-ldap --enable-mbstring --enable-mbregex --with-mcrypt --with-openssl --with-pgsql --enable-sockets --with-sqlite3 --with-config-file-scan-dir --with-tidy --enable-exif --with-mysql --with-mysqli --enable-pdo --with-pdo-mysql --with-pdo-pgsql --with-pdo-sqlite --enable-soap --with-xmlrpc --with-xsl

nmake #走到这步,报错了

```

![img](/img/demo/windows-php-demo-2.png)
![img](/img/demo/windows-php-demo-3.png)
![img](/img/demo/windows-php-demo-4.png)
![img](/img/demo/windows-php-demo-5.png)

可能得换个32位的windows编译一下





1.把压缩包php-sdk-binary-tools-20110915.zip的内容解压到一个文件夹，例如 D:\php-sdk\。

打开“VS2012 x86 Native Tools Command Prompt”，cd到刚刚建立的文件夹，执行以下命令：

```
bin\phpsdk_setvars.bat
bin\phpsdk_buildtree.bat phpdev
```

把D:\php-sdk\phpenv\下的vc9文件夹复制一份，重命名为vc11。（不复制直接改名也可以，或者直接在vc9里面编译应该也没问题。）现在你应该有了一个类似这样的文件夹结构：

```
D:\php-sdk\
 |--bin\
 |--phpdev\
 |   |--vc6\
 |   |--vc8\
 |   |--vc9\
 |   |   |--x64\
 |   |   |--x86\
 |   |       |--deps\
 |   |--vc11\
 |       |--x64\ 
 |       |--x86\
 |           |--deps\
 |               |--bin\
 |               |--include\
 |               |--lib\
 |--script\
 |--share\
```

把依赖包deps-5.5-vc11-x86.7z解压到D:\php-sdk\phpenv\vc11\x86\，将其中的deps文件夹与现有的deps文件夹合并。这个文件夹用来放置编译PHP和扩展需要的依赖文件，包括库文件、头文件甚至是依赖的二进制文件。
把php的源代码压缩包的内容解压到D:\php-sdk\phpenv\vc11\x86\，得到一个类似D:\php-sdk\phpdev\vc11\x86\php-5.5.3-src\的文件夹。

2.生成configure脚本

cd到D:\php-sdk\phpdev\vc11\x86\php-5.5.3-src\，执行以下命令：

```
buildconf
```

3.配置编译选项

使用–help查看可用的选项。下面是一个我用的开启了大多数PHP自带扩展的命令。

```
configure --help
configure --enable-cli-win32 --with-bz2 --with-curl --with-dba --enable-fileinfo --with-gettext --with-gmp --with-ldap --enable-mbstring --enable-mbregex --with-mcrypt --with-openssl --with-pgsql --enable-sockets --with-sqlite3 --with-config-file-scan-dir --with-tidy --enable-exif --with-mysql --with-mysqli --enable-pdo --with-pdo-mysql --with-pdo-pgsql --with-pdo-sqlite --enable-soap --with-xmlrpc --with-xsl
```

4.编译PHP

运行下面两条命令，编译PHP、生成zip压缩包。

```
nmake
nmake snap
```

最后在D:\php-sdk\phpdev\vc11\x86\php-5.5.3-src\Release_TS\下得到一个压缩包php-5.5.3-Win32-VC11-x86.zip，即是我们编译并打包好的PHP。把这个压缩包解压到别处即可开始使用；如果运行时提示需要某dll，一般在D:\php-sdk\phpdev\vc11\x86\deps\bin\下面可以找到它。




![img](/img/demo/windows-php-demo-6.png)
![img](/img/demo/windows-php-demo-7.png)


遇到一个问题:
apache模块
依赖库

nmake snap报错
Release_TS\php.exe -d date.timezone=UTC -n -dphar.readonly=0 win32/build/mkdist.php "Release_TS" "C:\php-sdk\phpdev\vc11\x86\deps" "php5ts.dll" "php-cgi.exe php.exe php-win.exe" "php_curl.dll php_fileinfo.dll php_gd2.dll php_opcache.dll " " " "C:\php-sdk\phpdev\vc11\x86\deps\template"

执行上面的命令报错

我把C:\php-sdk\phpdev\vc11\x86\deps\bin下面全部文件拷贝到了C:\php-sdk\phpdev\vc11\x86\php-5.6.32-src\Release_TS


重新nmake snap就不报错了

最后编译成功过后，php.exe运行还会报错,提示缺ddl,我就从C:\php-sdk\phpdev\vc11\x86\deps\bin下面把缺少的ddl拷贝过来了
最后apache模块是没有的,我从官网下载对应版本编译好的包,将里面的php5apache2_4.dll拷贝过来,最后配置httpd.conf文件
重启apache 
php_info()信息打出来,我只是走个大致过程,具体细节还需要看一下.毕竟我的编译比较粗略.

![img](/img/demo/windows-php-demo-8.png)


时间问题,等以后有时间再细走一下过程
关于apache模块和php.exe依赖库


WARNING: distro depends on msvcr110.dll, but could not find it on your system
WARNING: distro depends on normaliz.dll, but could not find it on your system
上面这两ddl是vs的,安装vs的时候会装上,在C:\Windows\System32下面