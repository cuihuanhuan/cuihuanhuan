---
layout: post
title: "php+jquery+ajax实现用户名验证"
date: 2016-9-13
---
    大多数情况下，jquery代码的编写，都要求我们将jquery的代码放在以下三种中任一个function里。

    有三种写法，同样效果，有点像Window.onload，但也有不同，就是window.onload是页面加载完后才会执行，
    而$(document).ready()方法只是等所有标签加载完后，就进行操作，还有$(document).ready()可以多次调用，
    而window.onload不可以，会被后一个调用所覆盖。

    第一种：$(document).ready(function(){.....});

    第二种：$().ready(function(){......});

    第三种：$(function(){......});

    注：通过jQuery中的$(document).ready()方法注册的事件处理程序，只要在DOM完全就绪时，就可以调用了，
    比如一张图片只要标签完成，不用等这个图片加载完成，就可以设置图片的宽高的属性或样式等。

    再看ajax在jquery中如何操作？

    ajax通过两种方式传值：get/post

    【get方式】

    var url = "CheckUser.php?uName="+name; //跳转到判断页面
     
    $.get(url,function(result){
     
    　　//运行ajax,进入url页面，返回result
     
    　　//通过result返回值，输出描述信息
     
    }

    【post方式】

    var username = $(this).val();
     
    var url = "CheckUser.php";
     
    $.post(url,{name:username},function(result){ ...}　


    跳转到CheckUser.php页面后通过get/post接收并从数据库中判断是否存在，然后返回一个值即可。。。 html代码：

    用户名：

    <form action="" method="post">
     
    　　<input type="text" name="username" value="" />
     
    　　<input type="submit" value="提交"/>
     
    </form>


    jquery代码：

    $("#userName").blur(function(){
     
    　　var username = $(this).val();
    　　var url = "CheckUser.php"; //跳转到判断页面
     
    　　//下面是运行ajax,进入changeUrl页面，传入name，返回result
     
    　　$.post(url ,{name:username},function(result){
     
    　　　　if(result == '1'){
    　　　　　　 $("#Info").html("用户名存在！");
    　　　　}else{
    　　　　　　 $("#Info").html("可以注册！");
    　　　　}
    　　})
    })


    CheckUser.php
    <?php
    if($_POST['name']){
     
    　　//接收post传过来的值
     
    　　$username = trim($_POST['name']);
     
    　　//进行判断，本来是要从数据库中取的，我偷懒了一下，只是测试。。。
     
    　　if($username == "admin"){
    　　　　echo '1';
    　　}else{
    　　　　echo '0';
    　　}
    }

    ?>