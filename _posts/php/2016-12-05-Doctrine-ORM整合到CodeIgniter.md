---
title: Doctrine ORM整合到CodeIgniter
categories: PHP
tags: PHP
---

<h4>Doctrine ORM整合到CodeIgniter</h4>

参考：http://www.cnblogs.com/hurner/p/4901262.html

`application/composer.json`
```
{

"require": {
	"doctrine/orm": "2.4.*"
},
"autoload": {
	"psr-0": {"": "models/entities"}
}

}
```

composer里面的autoload对命令行执行ORM有用,如果不写会提示找不到entity(Product)

`composer install`

`application/bootstrap.php`

```
<?php
// bootstrap.php
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\Common\ClassLoader,
    Doctrine\DBAL\Logging\EchoSQLLogger,
    Doctrine\Common\Cache\ArrayCache;

date_default_timezone_set("Asia/Shanghai");

require_once "vendor/autoload.php";

class bootstrap
{
    public $entityManager;

    public function __construct()
    {
        $this->index();
    }

    public function index()
    {


        $conn = array(
            'driver' => 'pdo_pgsql',
            'user' => 'i2soft',
            'password' => 'i2s@Shanghai',
            'host' => '127.0.0.1',
            'dbname' => 'i2active'
        );


        $isDevMode = true;
        $config = Setup::createAnnotationMetadataConfiguration(array(__DIR__ . "/models/entities"), $isDevMode);

        $cache = new ArrayCache;
        $config->setMetadataCacheImpl($cache);
        $driverImpl = $config->newDefaultAnnotationDriver(array(__DIR__ . '/models/entities'));
        $config->setMetadataDriverImpl($driverImpl);
        $config->setQueryCacheImpl($cache);

        $config->setQueryCacheImpl($cache);

        $config->setProxyDir(__DIR__ . '/models/proxies');
        $config->setProxyNamespace('Proxies');


        $config->setAutoGenerateProxyClasses(TRUE);


        $this->entityManager = EntityManager::create($conn, $config);
    }
}


```

`application/cli-config.php`

```
<?php
require_once "bootstrap.php";
$bootstrap = new bootstrap();

return new \Symfony\Component\Console\Helper\HelperSet(array(
    'em' => new \Doctrine\ORM\Tools\Console\Helper\EntityManagerHelper($bootstrap->entityManager)
));
```

`application/models/entities`

```
<?php
// src/Product.php
/**
 * @Entity @Table(name="products")
 **/
class Product
{
    /** @Id @Column(type="integer") @GeneratedValue **/
    protected $id;

    /** @Column(type="string") **/
    protected $name;


    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }
}
```

`application/createproduct.php`

```
<?php
require_once "bootstrap.php";
$bootstrap = new bootstrap();
$newProductName = $argv[1];

$product = new Product();
$product->setName($newProductName);

$bootstrap->entityManager->persist($product);
$bootstrap->entityManager->flush();

echo "Created Product with ID " . $product->getId() . "\n";
```

`application/products.php`

```
<?php
// products.php
require_once "bootstrap.php";
$boostrap = new bootstrap();

$dql = "SELECT p FROM product p";
$productBugs = $boostrap->entityManager->createQuery($dql)->getScalarResult();

print_r($productBugs);
foreach($productBugs as $productBug) {
    echo $productBug['name']." has " . $productBug['openBugs'] . " open bugs!\n";
}


```


![img](img/orm/demo-1.png)
![img](img/orm/demo-2.png)
![img](img/orm/demo-3.png)

----------------------------------------------------我是分割线------------------------------------------------------------



在Controller中使用ORM

`application/libraries/bootstrap.php`



```
<?php
// bootstrap.php
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\Common\ClassLoader,
    Doctrine\DBAL\Logging\EchoSQLLogger,
    Doctrine\Common\Cache\ArrayCache;

date_default_timezone_set("Asia/Shanghai");

require_once APPPATH."vendor/autoload.php";

class bootstrap{
        public $entityManager;
        public function __construct()
        {
            $this->index();
        }

    public function index(){
            if(defined(APPPATH))
            {
//                echo 'xxx';
//                require_once APPPATH.'config/database.php';
//                $conn = array(
//                    'driver' => 'pdo_pgsql',
//                    'user' =>     $db['default']['username'],
//                    'password' => $db['default']['password'],
//                    'host' =>     $db['default']['hostname'],
//                    'dbname' =>   $db['default']['database']
//                );
            }
            else
            {

                $conn = array(
                    'driver' => 'pdo_pgsql',
                    'user' =>     'i2soft',
                    'password' => 'i2s@Shanghai',
                    'host' =>     '127.0.0.1',
                    'dbname' =>   'i2active'
                );
            }

            $isDevMode = true;
            $config = Setup::createAnnotationMetadataConfiguration(array(__DIR__."/models/entities"), $isDevMode);

            $cache = new ArrayCache;
            $config->setMetadataCacheImpl($cache);
            $driverImpl = $config->newDefaultAnnotationDriver(array(__DIR__.'/models/entities'));
            $config->setMetadataDriverImpl($driverImpl);
            $config->setQueryCacheImpl($cache);

            $config->setQueryCacheImpl($cache);

            $config->setProxyDir(__DIR__.'/models/proxies');
            $config->setProxyNamespace('Proxies');


            $config->setAutoGenerateProxyClasses( TRUE );


            $this->entityManager = EntityManager::create($conn, $config);
        }
}


```

`application/modules/welcome/controllers/products.php`

```
<?php
class products extends MY_Controller {
    protected $entityManager;
    public function __construct()
    {
        $this->load->library('bootstrap');
        $this->entityManager = $this->bootstrap->entityManager;
    }

    public function index(){

        $newProductName = 'xxx';

        $product = new Product();
        $product->setName($newProductName);

        $this->entityManager->persist($product);
        $this->entityManager->flush();

        echo "Created Product with ID " . $product->getId() . "\n";
    }
    public function lists(){

        $dql = "SELECT p FROM product p";
        $productBugs = $this->entityManager->createQuery($dql)->getScalarResult();

        print_r($productBugs);
        foreach($productBugs as $productBug) {
            echo $productBug['name']." has " . $productBug['openBugs'] . " open bugs!\n";
        }

    }
}

```

![img](img/orm/demo-4.png)
![img](img/orm/demo-5.png)

