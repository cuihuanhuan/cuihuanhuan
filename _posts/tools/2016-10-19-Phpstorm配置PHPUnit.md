---
title: PhpStorm配置PHPUnit
categories: PHPUnit Phpstorm
tags: PHPUnit Phpstorm
---



有Money.php,MoneyTest.php两个文件作为测试文件

Money.php

```php
<?php
class Money
{

    private $amount;

    public function __construct($amount)
    {
        $this->amount = $amount;
    }

    public function getAmount()
    {
        return $this->amount;
    }

    public function negate()
    {
        return new Money(-1*$this->amount);
    }
}
```

MoneyTest.php

```php
<?php
require_once 'Money.php';
class MoneyTest extends PHPUnit_Framework_TestCase
{

    public function testCanBeNegated()
    {
        $a = new Money(1);

        $b = $a->negate();

        $this->assertEquals(-1, $b->getAmount());
    }

    public function testBoolean()
    {
        $this->assertTrue(true);
    }

    /**
     * @test
     */
    public function equal()
    {
        $this->assertEquals(1, 1 + 1);
    }
}
```

windows打开cmd,下载phpunit,这个是自动下载对应PHP版本的PHPUnit(应该),在目录下会产生有vendor文件夹

```shell
C:\Program Files (x86)\info2soft-ctrlcenter\Apache Software Foundation\Apache2.2\htdocs>composer require phpunit/phpunit
Using version ^4.8 for phpunit/phpunit
./composer.json has been created
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 16 installs, 0 updates, 0 removals
  - Installing sebastian/global-state (1.1.1): Downloading (100%)
  - Installing sebastian/recursion-context (1.0.5): Loading from cache
  - Installing sebastian/exporter (1.2.2): Downloading (100%)
  - Installing sebastian/environment (1.3.8): Downloading (100%)
  - Installing sebastian/diff (1.4.3): Loading from cache
  - Installing sebastian/comparator (1.2.4): Downloading (100%)
  - Installing doctrine/instantiator (1.0.5): Downloading (100%)
  - Installing phpunit/php-text-template (1.2.1): Loading from cache
  - Installing phpunit/phpunit-mock-objects (2.3.8): Downloading (100%)
  - Installing phpunit/php-timer (1.0.9): Downloading (100%)
  - Installing phpunit/php-file-iterator (1.4.2): Downloading (100%)
  - Installing phpunit/php-token-stream (1.4.11): Downloading (100%)
  - Installing phpunit/php-code-coverage (2.2.4): Downloading (100%)
  - Installing phpdocumentor/reflection-docblock (2.0.5): Downloading (100%)
  - Installing phpspec/prophecy (v1.7.2): Downloading (100%)
  - Installing phpunit/phpunit (4.8.36): Downloading (100%)
sebastian/global-state suggests installing ext-uopz (*)
phpunit/php-code-coverage suggests installing ext-xdebug (>=2.2.1)
phpdocumentor/reflection-docblock suggests installing dflydev/markdown (~1.0)
phpdocumentor/reflection-docblock suggests installing erusev/parsedown (~1.0)
phpunit/phpunit suggests installing phpunit/php-invoker (~1.1)
Writing lock file
Generating autoload files
```

配置Phpstorm的PHPUnit环境

![img](/images/img/Phpstorm_PHPUnit.png)