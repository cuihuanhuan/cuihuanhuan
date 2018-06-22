---
title: Phpstorm激活汉化和支持CI自动补全
category: PhpStorm
tags: PhpStorm
---



首先在官网下载phpstorm2017

1.激活
        激活时选择License server 填入http://idea.imsxm.com 点击Active即可。
        原文:http://www.imsxm.com/jetbrains-license-server.html


2.汉化
a.打开下载文件中PhpStorm10汉化包，将里面的“zh_CN文件夹”和“resources_cn.jar”压缩包都打开(注意是打开而不是解压出来)
b.将zh_CN文件夹下的所有文件拖到刚才打开的resources_cn.jar压缩包的messages文件夹中，并保存。
c.将PhpStorm10汉化包中的“resources_cn.jar”文件复制到C:\Program Files\JetBrains\PhpStorm 2017.1.4\lib目录(安装目录)
原文:http://www.cnblogs.com/carbon3/p/6428685.html



3.增加主题
http://www.phpstorm-themes.com/ 下载主题(字体和编辑器背景色) github主题的还可以
放到C:\Users\yingfang\.PhpStorm2017.1\config\colors
后缀名改为icls

可以用phpstorm2016,感觉比phpstorm2017顺手



4.让phpstorm支持codeigniter自动补全
如果用MX(不是基于纯粹ci框架上的项目,而是在ci基础上做处理的Third Lib)
如果没用MX,参考文章:http://blog.csdn.net/wzj0808/article/details/54910024
a.下载https://github.com/topdown/phpStorm-CC-Helpers,用codeigniter下面的文件
原文:http://blog.csdn.net/wzj0808/article/details/54910024
b.将CI_phpStorm文件的注释部分拷贝到MY_Controller的注释部分,也将自己写在my_models.php里面的注释拷贝到MY_Controller的注释部分
原文：http://www.bango29.com/code-hinting-autocompletion-for-codeigniter-in-phpstorm/
摘录如下,以防链接失效. 


```
       Finally, moving back and forth between models, views and controllers is just too distracting and time consuming. I had to find another way to navigate my way between codes. I tweeted asking about alternative IDEs in Mac OS X to achieve this. Turns out there is a way!

       I got a tip from @LuisFAlonso (THANK YOU!) to check out instructions from a blog here. I followed the instructions and restarted PHPStorm afterwards. Sadly, it didn't work :(

       I did a Google search and was happy to read a blog post here. But it didn't work (again). The instructions was to copy paste lines of comments directly to the system/core/Controller.php and system/core/Model.php. The thing is, my system folder is outside the public folder. So I copy pasted the Controller part to application/core/MY_Controller.php. It WORKED!

    Now I'm happy with a new IDE and Code hinting + Autocompletion!
```



以下是3.x的全部类(应该是)

```php
/**
 * @property CI_Benchmark        $benchmark                           This class enables you to mark points and calculate the time difference between them. Memory consumption can also be displayed.
 * @property CI_Calendar         $calendar                            This class enables the creation of calendars
 * @property CI_Cache            $cache                               Caching Class
 * @property CI_Cart             $cart                                Shopping Cart Class
 * @property CI_Config           $config                              This class contains functions that enable config files to be managed
 * @property CI_Controller       $controller                          This class object is the super class that every library in CodeIgniter will be assigned to
 * @property CI_DB_forge         $dbforge                             Database Forge Class
 * @property CI_DB_mysql_driver|CI_DB_query_builder $db                                  This is the platform-independent base Query Builder implementation class
 * @property CI_DB_utility       $dbutil                              Database Utility Class
 * @property CI_Driver_Library   $driver                              Driver Library Class
 * @property CI_Email            $email                               Permits email to be sent using Mail, Sendmail, or SMTP
 * @property CI_Encrypt          $encrypt                             Provides two-way keyed encoding using Mcrypt
 * @property CI_Encryption       $encryption                          Provides two-way keyed encryption via PHP's MCrypt and/or OpenSSL extensions
 * @property CI_Exceptions       $exceptions                          Exceptions Class
 * @property CI_Form_validation  $form_validation                     Form Validation Class
 * @property CI_FTP              $ftp                                 FTP Class
 * @property CI_Hooks            $hooks                               Provides a mechanism to extend the base system without hacking
 * @property CI_Image_lib        $image_lib                           Image Manipulation class
 * @property CI_Input            $input                               Pre-processes global input data for security
 * @property CI_Javascript       $javascript                          Javascript Class
 * @property CI_Jquery           $jquery                              Jquery Class
 * @property CI_Lang             $lang                                Language Class
 * @property CI_Loader           $load                                Loads framework components
 * @property CI_Log              $log                                 Logging Class
 * @property CI_Migration        $migration                           All migrations should implement this, forces up() and down() and gives access to the CI super-global
 * @property CI_Model            $model                               CodeIgniter Model Class
 * @property CI_Output           $output                              Responsible for sending final output to the browser
 * @property CI_Pagination       $pagination                          Pagination Class
 * @property CI_Parser           $parser                              Parser Class
 * @property CI_Profiler         $profiler                            This class enables you to display benchmark, query, and other data in order to help with debugging and optimization.
 * @property CI_Router           $router                              Parses URIs and determines routing
 * @property CI_Security         $security                            Security Class
 * @property CI_Session          $session                             Session Class
 * @property CI_Table            $table                               Lets you create tables manually or from database result objects, or arrays
 * @property CI_Trackback        $trackback                           Trackback Sending/Receiving Class
 * @property CI_Typography       $typography                          Typography Class
 * @property CI_Unit_test        $unit                                Simple testing class
 * @property CI_Upload           $upload                              File Uploading Class
 * @property CI_URI              $uri                                 Parses URIs and determines routing
 * @property CI_User_agent       $agent                               Identifies the platform, browser, robot, or mobile device of the browsing agent
 * @property CI_Xmlrpc           $xmlrpc                              XML-RPC request handler class
 * @property CI_Xmlrpcs          $xmlrpcs                             XML-RPC server class
 * @property CI_Zip              $zip                                 Zip Compression Class
 * @property CI_Utf8             $utf8                                Provides support for UTF-8 environments
 *
 */
```


