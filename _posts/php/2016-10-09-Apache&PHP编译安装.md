---
title: Apache&PHP编译安装
category: PHP
tags: PHP
---

![img](/img/demo/php-src-1.png)

1.CentOS6.5 Apache编译安装

```shell


#准备工作
#http://archive.apache.org/dist/apr/


#apr编译安装 apr 1.4.6

tar -xvf apr-1.4.6.tar.gz
./configure --prefix=/usr/local/apr
make
make install

#apr-util编译安装 apr-util 1.5.1

tar -xvf apr-util-1.5.1.tar.gz
./configure --prefix=/usr/local/apr-util；make；make install
如果报错未指定apr则再加
还可以加这个参数--with-apr=/usr/local/apr



#报错：
.configure: error: pcre-config for libpcre not found. PCRE is required and available from http://pcre.org/

#解决:
https://ftp.pcre.org/pub/pcre/
pcre 8.31
tar -xvf pcre8.31.tar.gz
./configure --prefix=/usr/local/pcre
make
make install

#报错：
.libtool: compile: unrecognized option `-DHAVE_CONFIG_H'
libtool: compile: Try `libtool --help' for more information.
make[1]: *** [pcrecpp.lo] Error 1
make[1]: Leaving directory `/root/Desktop/pcre-8.31'
make: *** [all] Error 2

#解决
yum -y install gcc-c++

重新./configure --prefix=/usr/local/pcre
不./configure还是会报同样的错误

#5.checking for APR-util... configure: error: the --with-apr-util parameter is incorrect. It must specify an install prefix, a build directory, or an apu-config file.

这个错误核实了apr-util的安装路径是/usr/local/apr-util依然报错
所以去掉--with-apr-util=/usr/local/apr-util/这个参数重新./configure ...


#6.始终未遇到需要安装openssl的问题,看教程里面还有openssl相关的错误.我没有遇到

./configure --prefix=/usr/local/apache2 --with-mpm=worker --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache --enable-nonportable-atomics --enable-mods-shared=most --enable-so --enable-rewrite --enable-ssl --with-apr=/usr/local/apr/  --with-pcre=/usr/local/pcre

make

make install
#安装完成,未出错.

#启动apache
cd /usr/local/apache2/bin/
./httpd -k start


访问127.0.0.1

It works!
```

2.PHP编译安装

```shell
./configure --prefix=/usr/local/php --enable-fpm  --with-zlib --enable-mbstring --with-openssl --with-mysql --with-mysqli --with-mysql-sock --with-gd --enable-gd-native-ttf  --enable-pdo --with-pdo-mysql --with-gettext --with-curl --with-pdo-mysql --enable-sockets --enable-bcmath --enable-xml --with-bz2 --enable-zip --enable-freetype --with-libxml-dir=/usr/local/libxml2 --with-zlib-dir=/usr/local/zlib --with-curl=/usr/local/curl --with-jpeg-dir=/usr/local/jpeg --with-png-dir=/usr/local/png --with-mcrypt=/usr/local/libmcrypt --with-apxs2=/usr/local/apache2/bin/apxs

#准备
去php官网下载源码 http://www.php.net/downloads.php ，php-5.4.8.tar.gz为例

#报错：configure: error: xml2-config not found. Please check your libxml2 installation.
#参考答案：https://stackoverflow.com/questions/19904083/how-to-fix-error-with-xml2-config-not-found-when-installing-php-from-sources
#解决：
yum install libxml2-devel


2.
configure: error: Cannot find OpenSSL's <evp.h>

yum install openssl
yum install openssl-devel


#报错：configure: error: Please reinstall the BZip2 distribution
#解决：
yum install bzip2-devel


#报错：configure: error: Please reinstall the libcurl distribution - easy.h should be in <curl-dir>/include/curl/
#解决：
yum install libcurl
yum install libcurl-devel

#报错：configure: error: jpeglib.h not found.
#解决：
yum install libjpeg
yum install libjpeg-devel

#报错：configure: error: png.h not found.
#解决：
yum install libpng-devel
 
#报错：configure: error: mcrypt.h not found. Please reinstall libmcrypt.
#解决：
wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz 
tar -xvf libmcrypt-2.5.7.tar.gz 
./configure --prefix=/usr/local
make
make install

#警告：configure: WARNING: unrecognized options: --enable-freetype

Thank you for using PHP.

config.status: creating php5.spec
config.status: creating main/build-defs.h
config.status: creating scripts/phpize
config.status: creating scripts/man1/phpize.1
config.status: creating scripts/php-config
config.status: creating scripts/man1/php-config.1
config.status: creating sapi/cli/php.1
config.status: creating sapi/fpm/php-fpm.conf
config.status: creating sapi/fpm/init.d.php-fpm
config.status: creating sapi/fpm/php-fpm.8
config.status: creating sapi/fpm/status.html
config.status: creating main/php_config.h
config.status: executing default commands
configure: WARNING: unrecognized options: --enable-freetype


支持postgres
./configure --prefix=/usr/local/php --enable-fpm --with-mcrypt=/usr/local/libmcrypt --with-zlib --enable-mbstring --with-openssl --with-mysql --with-mysqli --with-mysql-sock --with-gd --with-jpeg-dir=/usr/lib --enable-gd-native-ttf --enable-pdo --with-pdo-mysql --with-pdo-pgsql --with-pgsql --with-gettext --with-curl --enable-sockets --enable-bcmath --enable-xml --with-bz2 --enable-zip --with-apxs2=/usr/local/apache2/bin/apxs

#报错：configure: error: Cannot find libpq-fe.h. Please specify correct PostgreSQL installation path
#解决：
yum install postgresql-devel

#php在命令行下使用
cp /usr/local/php/bin/php /usr/bin/
```

./configure没有通过,make就会报make: *** No targets specified and no makefile found. Stop.