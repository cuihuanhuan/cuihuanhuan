---
title: php memcache测试
categories: memcache
tags: memcache
---

参考：http://www.cnblogs.com/lingshao/p/4913601.html

https://pecl.php.net/

windows memcache扩展：https://pecl.php.net/package/memcache/3.0.8/windows


选择windows memcache扩展

![img](/img/php/memcache-demo-1.png)

选择对应PHP版本的扩展,我是5.6
![img](img/php/memcache-demo-2.png)

下载解压将memcache.dll放在C:\Program Files (x86)\info2soft-ctrlcenter\PHP\ext

修改php.ini：添加一句 extension=php_memcache.dll

查看phpinfo,memcache是否加载
![img](/img/php/memcache-demo-3.png)


做memcache还需要安装memcached服务器端软件

![img](/img/php/memcache-server-1.png)
![img](/img/php/memcache-server-2.png)

memcache测试：
```
<?php

$memcache = memcache_connect('localhost', 58080);

if ($memcache) {
	$memcache->set("str_key", "String to store in memcached");
	$memcache->set("num_key", 123);

	$object = new StdClass;
	$object->attribute = 'test';
	$memcache->set("obj_key", $object);

	$array = Array('assoc'=>123, 345, 567);
	$memcache->set("arr_key", $array);

	var_dump($memcache->get('str_key'));
	var_dump($memcache->get('num_key'));
	var_dump($memcache->get('obj_key'));
}
else {
	echo "Connection to memcached failed";
}
?>
```

![img](/img/php/memcache-demo-4.png)
