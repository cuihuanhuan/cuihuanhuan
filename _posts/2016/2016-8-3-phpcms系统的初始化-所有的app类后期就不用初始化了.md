---
layout: post
title: "phpcms系统的初始化-所有的app类后期就不用初始化了"
date: 2016-8-3
---
    为增强phpcms二次开放能力，今天开始读phpcms源码，不定期更新点小日志，跟着平哥读源码，成为屌丝我看行。
    phpcms单入口 mvc架构


    index.php 所有请求都必须通过这个文件


    index.php
    加载base.php框架入口文件
    初始化了系统环境变量,定义了pc_base静态类：
    creat_app：初始化了应用程序
    load_sys_class：加载系统类，默认加载目录为libs/classes
    load_app_class:加载应用累,默认加载目录为modules/模块名/classes目录(封装的load_sys_class函数)
    load_model：加载数据库模型，默认加载目录为model/xxx.class.php
    load_sys_func:加载系统函数，默认加载目录为libs/functions/
    等方法
    调用 pc_base静态类 creat_app方法
    public static function creat_app() {
    return self::load_sys_class('application');
    }
    加载了/libs/classes/application.class.php
    pc_base类 里面_load_class方法默认$initialize为1 这样会在加载的同时实例化 类 并会想实例化对象存储到$classes静态数组里面以class的路径加文件名md5后的key
    application类初始化方法
    public function __construct() {
    $param = pc_base::load_sys_class('param');
    define('ROUTE_M', $param->route_m());
    define('ROUTE_C', $param->route_c());
    define('ROUTE_A', $param->route_a());
    $this->init();
    }


    加载了系统类 param 参数处理类
    获取处理一切不受信任的外部变量
    定义了 ROUTE_M 获取的模块名 
    定义了 ROUTE_C 获取的控制器名
    定义了 ROUTE_A 获取的方法名


    application里面init方法
    调用application里面load_controller方法
    $filepath = PC_PATH.'modules'.DIRECTORY_SEPARATOR.$m.DIRECTORY_SEPARATOR.$filename.'.php';组合控制器路径
    并且判断有没有MY_的控制器，灵活扩展控制器
    返回控制器实力
    call_user_func(array($controller, ROUTE_A));执行控制器里面对应方法


    系统初始化完成