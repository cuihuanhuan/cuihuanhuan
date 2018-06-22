---
title: windows下phpredis扩展安装使用
categories: redis
tags: redis
---

<h4>windows下phpredis扩展安装使用</h4>

redis扩展下载安装：
下载地址:https://pecl.php.net/package/redis/2.2.7/windows

![img](/img/demo/redis-demo-4.png)

修改php.ini,加上:extension=php_redis.dll

phpinfo查看php信息

```
<?php
//phpinfo();
```
![img](/img/demo/redis-demo-5.png)



redis下载安装：
https://github.com/MicrosoftArchive/redis/releases

![img](/img/demo/redis-demo-6.png)

启动redis-server.exe,并用redis-cli.exe测试

![img](/img/demo/redis-demo-7.png)

php代码测试

```
<?php

$redis = new Redis();

$redis->connect('127.0.0.1', 6379);

$redis->set('userName','cuihuanhuan');

echo $redis->get('userName');
```

![img](/img/demo/redis-demo-8.png)

```
<?php

//连接到 redis 服务
$redis = new Redis();
$redis->connect('127.0.0.1', 6379);


echo "Server is running: " . $redis->ping();

echo '<br/>#Redis PHP String(字符串) 实例#<br/><br/>';


//Redis PHP String(字符串) 实例


$redis->set("tutorial-name", "Redis tutorial");

echo "Stored string in redis:: " . $redis->get("tutorial-name");

echo '<br/>#Redis PHP List(列表) 实例#<br/><br/>';


//Redis PHP List(列表) 实例
$redis->lpush("tutorial-list", "Redis");
$redis->lpush("tutorial-list", "Mongodb");
$redis->lpush("tutorial-list", "Mysql");

$arList = $redis->lrange("tutorial-list", 0, 5);
echo "Stored string in redis";
print_r($arList);

echo '<br/>#Redis PHP Keys 实例#<br/><br/>';


//Redis PHP Keys 实例
$arList = $redis->keys("*");
echo "Stored keys in redis:: ";
print_r($arList);
```

![img](/img/demo/redis-demo-9.png)
