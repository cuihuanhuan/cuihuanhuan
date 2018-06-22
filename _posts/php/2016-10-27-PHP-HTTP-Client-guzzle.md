---
title: guzzle测试
categories: guzzle
tags: guzzle
---

Guzzle文档
http://guzzle3.readthedocs.io/

windows下安装了curl,环境变量里面加了php的路径

下载composer.phar放到项目根目录下

下载完guzzle,写php的时候前面导入vendor/autoload.php

## Installing Guzzle

The recommended way to install Guzzle is through [Composer](http://getcomposer.org/).

```
# Install Composer
curl -sS https://getcomposer.org/installer | php
```

Next, run the Composer command to install the latest stable version of Guzzle:

```
php composer.phar require guzzlehttp/guzzle
```

After installing, you need to require Composer's autoloader:

```
require 'vendor/autoload.php';
```

示例代码

```php
<?php
require_once 'vendor/autoload.php';
use Guzzle\Http\Client;

// Create a client and provide a base URL
$client = new Client('https://api.github.com');
// Create a request with basic Auth
$request = $client->get('/user')->setAuth('user', 'pass');
// Send the request and get the response
$response = $request->send();
echo $response->getBody();
// >>> {"type":"User", ...
echo $response->getHeader('Content-Length');
// >>> 792
```

