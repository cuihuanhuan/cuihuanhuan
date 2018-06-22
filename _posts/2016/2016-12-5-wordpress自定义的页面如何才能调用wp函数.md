---
layout: post
title: wordpress自定义的页面如何才能调用wp函数
date: 2016-6-12
---
    <?php
    require '../wp-load.php';
    //require_wp_db();
    global $wpdb;
    $sql= "SELECT * FROM ".$wpdb->prefix.'form';
    $a = $wpdb->get_results($sql);
    print_r($a);
    
    在wordpress中的根目录下新建文件夹,访问的话默认是index.php