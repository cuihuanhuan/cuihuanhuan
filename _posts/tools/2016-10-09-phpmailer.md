---
title: PHPMailer
category: PHPMailer
tags: PHPMailer
---



关于在Codeigniter中使用PHPMailer,虽然github上有一些demo,将PHPMailer的一些文件放到libraries下,还有针对PHPMailer的config文件.

但是,从github上下载把PHPMailer放到third_party下面,然后写个wrapper class放到libraries,那在controller中用发送email的时候调用wrapper class即可.

现在PHPMailer也支持composer下载了.当然其他分支中有旧的PHPMailer,旧的挺清晰的,先看旧的,再理解新的的支持composer安装的.

```shell
PHPMailer is available on Packagist (using semantic versioning), and installation via composer is the recommended way to install PHPMailer. Just add this line to your composer.json file:

"phpmailer/phpmailer": "~6.0"

#1下载phpmailer
php composer install

#2.下载phpmailer
composer require phpmailer/phpmailer
```

