---
title: mod_php&mod_fastcgi&php-fpm总结
categories: PHP
tags: PHP
---

<h4>mod_php&mod_fastcgi&php-fpm总结</h4>

mod_php&mod_fastcgi&php-fpm对比性能数据
参考：http://www.cnblogs.com/zl0372/articles/php_4.html

一.mod_php

mod_php工作流程图

![img](img/php/apache-mod-php.jpg)

1.为什么Mod_php的性能不及php-fpm?

配置加载mod_php模块后，其便是apahce进程本身一部分，每个新的apache子进程都会加载次模块，所以会导致一些不必要的内存资源浪费。 php-fpm是单独的一个进程，不存在多次加载到内存的情况，但需要解析php时才会消耗内存。


如果处理图片等操作比较耗时，还是要用mod_php这种方式，开启一个进程处理。否则，有限的php-fpm进程会被耗时的操作阻塞。

二.mod_fastcgi

mod_fastcgi工作流程图

![img](img/php/apache-mod_fastcgi-php.jpg)

我在windows做过测试

参考:https://cuihuanhuan.github.io/Apache-FastCGI-NTS-PHP

三.FastCGI Process Manager (FPM)

参考apache文档做的测试：https://wiki.apache.org/httpd/PHP-FPM

```

0.首先我把mod_php的配置去掉

a.去掉了mod_php的配置
#注释mod_php模块

#LoadModule php5_module        modules/libphp5.so 

b.#注释AddType application/x-httpd-php .php 

<IfModule mime_module>
    #AddType application/x-httpd-php .php 
</IfModule>

c.#去掉index.php

<IfModule dir_module>
    DirectoryIndex index.html 
</IfModule>

d.重启apache

cd /usr/local/apache2/bin
./apache-ctl restart

```
访问页面

![img](img/php/php-fpm-0.png)


接下来添加php-fpm相关的配置

```
1.修改/usr/local/apache2/conf/httpd.conf

去掉这两个模块前面的#
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so



2.修改/usr/local/apache2/conf/extra/httpd-vhosts.conf
添加ProxyPassMatch  DirectoryIndex


<VirtualHost *:80>

ServerName localhost
DocumentRoot /usr/local/apache2/htdocs
<Directory  "/usr/local/apache2/htdocs">
    Options +Indexes +FollowSymLinks +MultiViews
    AllowOverride All
    Require local
    Require all granted
</Directory>
  ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/usr/local/apache2/htdocs/$1
  DirectoryIndex /index.php index.php

</VirtualHost>

3.启动php-fpm

cd /usr/local/php/sbin
./php-fpm -y /usr/local/php/etc/php-fpm.conf -c /usr/local/php/etc/php.ini

4.重启apache

cd /usr/local/apache2/bin
./apache-ctl restart

```


访问页面
![img](img/php/php-fpm-1.png)

![img](img/php/php-fpm-2.png)


执行killall php-fpm ,访问页面

![img](img/php/php-fpm-3.png)


