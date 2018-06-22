---
title: Windows安装Curl
categories: Windows Curl
tags: Windows Curl
---

https://github.com/bshaffer/oauth2-demo-php

基于做oauth2-server-php测试遇到的问题总结

Windows安装curl,如果是在windows环境下开发PHP,偶尔会用到composer等等

```shell
git clone https://github.com/bshaffer/oauth2-demo-php.git ./
cd oauth2-demo-php
#下载composer.phar
curl -s http://getcomposer.org/installer | php 
php composer.phar install
```

Windows安装git

下载git,将bin目录添加到环境变量Path中

![xxx](/images/Figures-in-Book/windows-path.png)

因为在下载依赖的时候用到git了,所以我配置了环境变量,重新走php composer.phar install的

```shell
C:\Users\yingfang\Desktop\oauth-demo>php composer.phar install
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 13 installs, 0 updates, 0 removals
  - Installing bshaffer/oauth2-server-php (v1.8.0): Loading from cache
  - Installing symfony/http-foundation (2.6.x-dev e8fd1b7): Cloning e8fd1b73ac from cache
    Failed to download symfony/http-foundation from source: Failed to clone https://github.com/symfony/http-foundation.git vi
a https, ssh protocols, aborting.

- https://github.com/symfony/http-foundation.git
  Cloning into 'C:\Users\yingfang\Desktop\oauth-demo\vendor\symfony\http-foundation\Symfony\Component\HttpFoundation'...
  fatal: unable to access 'https://github.com/symfony/http-foundation.git/': Failed to connect to github.com port 443: Timed
out

- git@github.com:symfony/http-foundation.git
  Cloning into 'C:\Users\yingfang\Desktop\oauth-demo\vendor\symfony\http-foundation\Symfony\Component\HttpFoundation'...
  Warning: Permanently added the RSA host key for IP address '192.30.253.113' to the list of known hosts.
  Permission denied (publickey).
  fatal: Could not read from remote repository.

  Please make sure you have the correct access rights
  and the repository exists.

    Now trying to download from dist
  - Installing symfony/http-foundation (2.6.x-dev e8fd1b7): Loading from cache
  - Installing bshaffer/oauth2-server-httpfoundation-bridge (v1.1): Loading from cache
  - Installing symfony/routing (2.6.x-dev 0a1764d): Cloning 0a1764d41b from cache
  - Installing symfony/event-dispatcher (2.6.x-dev 672593b): Cloning 672593bc4b from cache
  - Installing psr/log (dev-master 4ebe3a8): Cloning 4ebe3a8bf7 from cache
  - Installing symfony/debug (2.8.x-dev 08bf2c5): Cloning 08bf2c53db from cache
  - Installing symfony/http-kernel (2.6.x-dev cdd991d): Cloning cdd991d304 from cache
  - Installing pimple/pimple (1.1.x-dev cae373f): Cloning cae373ff3d from cache
  - Installing silex/silex (1.2.x-dev ce75b98): Cloning ce75b98d82 from cache
  - Installing twig/twig (1.x-dev e7944a1): Cloning e7944a1f67 from cache
  - Installing symfony/twig-bridge (2.1.x-dev e3a48a9): Cloning e3a48a9997 from cache
  - Installing guzzle/guzzle (dev-master f7778ed): Cloning f7778ed85e from cache
bshaffer/oauth2-server-php suggests installing predis/predis (Required to use the Redis storage engine)
bshaffer/oauth2-server-php suggests installing thobbs/phpcassa (Required to use the Cassandra storage engine)
bshaffer/oauth2-server-php suggests installing aws/aws-sdk-php (~2.8 is required to use the DynamoDB storage engine)
bshaffer/oauth2-server-php suggests installing firebase/php-jwt (~2.2 is required to use JWT features)
symfony/routing suggests installing doctrine/annotations (For using the annotation loader)
symfony/routing suggests installing symfony/config (For using the all-in-one router or any loader)
symfony/routing suggests installing symfony/expression-language (For using expression matching)
symfony/routing suggests installing symfony/yaml (For using the YAML loader)
symfony/event-dispatcher suggests installing symfony/dependency-injection ()
symfony/http-kernel suggests installing symfony/browser-kit ()
symfony/http-kernel suggests installing symfony/class-loader ()
symfony/http-kernel suggests installing symfony/config ()
symfony/http-kernel suggests installing symfony/console ()
symfony/http-kernel suggests installing symfony/dependency-injection ()
symfony/http-kernel suggests installing symfony/finder ()
symfony/http-kernel suggests installing symfony/var-dumper ()
silex/silex suggests installing symfony/browser-kit (~2.3)
silex/silex suggests installing symfony/css-selector (~2.3)
silex/silex suggests installing symfony/dom-crawler (~2.3)
silex/silex suggests installing symfony/form (~2.3)
symfony/twig-bridge suggests installing symfony/form (2.1.*)
symfony/twig-bridge suggests installing symfony/security (2.1.*)
symfony/twig-bridge suggests installing symfony/templating (2.1.*)
symfony/twig-bridge suggests installing symfony/translation (2.1.*)
symfony/twig-bridge suggests installing symfony/yaml (2.1.*)
guzzle/guzzle suggests installing guzzlehttp/guzzle (Guzzle 5 has moved to a new package name. The package you have installed
, Guzzle 3, is deprecated.)
Package guzzle/guzzle is abandoned, you should avoid using it. Use guzzlehttp/guzzle instead.
Writing lock file
Generating autoload files

```

