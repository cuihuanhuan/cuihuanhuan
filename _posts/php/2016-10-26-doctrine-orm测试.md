---
title: Doctrine2  ORM 测试
categories: Doctrine2 ORM
tags: Doctrine2 ORM
---



注意PHP版本,5.3不支持,执行vendor/bin/doctrine orm:schema-tool:create会报错

因为5.3不支持 [ ] 数组声明形式

下载 https://github.com/doctrine/doctrine2-orm-tutorial

里面有composer.json,在windows command里面执行composer install

注意路径名是否还有空格,偶尔会报解压失败,就换个正常的目录composer install即可

默认是sqlite,下载sqliteadmin查看db.sqlite的数据

配置支持PostgreSQL

配置支持PostgresSQL,在php.ini加上extension=php_pdo_pgsql.dll,否则会报找不到driver

```php
$conn = array(
    'driver' => 'pdo_pgsql',
    'path' => 'C:\Program Files (x86)\info2soft-ctrlcenter\PostgreSQL\8.3\bin\pgAdmin3.exe',
    'dbname'=>'orm',
    'user'=> 'i2soft',
    'password'=>'xxx'

);
```

我用的git bash做测试的,windows command报找不到路径,可能是我的路径有空格。

![img](img/php/orm-demo-1.png)



