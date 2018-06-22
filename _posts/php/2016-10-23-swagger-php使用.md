---
title: swagger-php&swagger-ui的使用
categories: swagger-php swagger-ui
tags: swagger-php swagger-ui
---



windows安装composer

去官网https://getcomposer.org/download/下载,安装

![img](/img/img/windows-composer.png)

安装完成后,打开cmd,输入composer能看到返回,就是安装成功了.

下载swagger,https://github.com/zircote/swagger-php(github)

```shell
#执行 composer require zircote/swagger-php
C:\Users\yingfang\Desktop\swagger>composer require zircote/swagger-php
Using version ^2.0 for zircote/swagger-php
./composer.json has been created
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 4 installs, 0 updates, 0 removals
  - Installing symfony/finder (v2.8.28): Downloading (100%)
  - Installing doctrine/lexer (v1.0.1): Downloading (100%)
  - Installing doctrine/annotations (v1.2.7): Downloading (100%)
  - Installing zircote/swagger-php (2.0.8): Downloading (100%)
Writing lock file
Generating autoload files
```

![img](/images/demo/swagger-php-demo-1.png)

下面是重点,因为我们写的注释生成被解析为json需要调用\Swagger\scan

这个json返回给swagger-ui用,swagger-ui的url写上这个php文件的路径,swagger-ui的页面就正常显示了

index.php

```php
<?php
require("vendor/autoload.php");
$swagger = \Swagger\scan('./index2.php');
header('Content-Type: application/json');
echo $swagger;
```

接下来让swagger-ui页面在本地代码中正常显示

github上,下载swagger-php-master,swagger-ui-master
下载完解压,进入目录,执行composer install,安装依赖

swagger-ui-master/dist/index.html文件,url改成自己的

将swagger-ui-master/dist这个文件夹拷贝到swagger-php-master的目录下

```javascript
<script>
window.onload = function() {
  
  // Build a system
  const ui = SwaggerUIBundle({
    url: "http://127.0.0.1:58080/swagger-php-master/",
    dom_id: '#swagger-ui',
    deepLinking: true,
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIStandalonePreset
    ],
    plugins: [
      SwaggerUIBundle.plugins.DownloadUrl
    ],
    layout: "StandaloneLayout"
  })

  window.ui = ui
}
</script>
```

http://127.0.0.1:58080/swagger-php-master/index.php文件

```php
<?php
require("vendor/autoload.php");
$swagger = \Swagger\scan('./Examples');
header('Content-Type: application/json');
echo $swagger;
```

