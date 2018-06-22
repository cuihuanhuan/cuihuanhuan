---
title: Express Template engine ejs
categories: NodeJS
tags: NodeJS
---

在cmd下安装express ejs

Express是一个简洁,灵活的node.js Web应用开发框架,它提供一系列强大的功能

1. 模板解析
2. 静态文件服务
3. 中间件
4. 路由控制

npm install express

npm本地缓存

##### 路由

根据请求路径来处理客户端发出的请求

```javascript
//安装express
//npm install Express
//加载express
var express = require('express');
//获取配置对象
var app = express();
//配置路由
//当用户访问/的时候,会执行后面的回调函数
app.get('/',function (req,res) {//get()是express的函数,是原来的req增强版
    res.send('send hello');//自动判断参数类型,自动转换响应信息，自动设置Content-Type
});
app.post('/hello',function(req,res){
    res.send('post hello');//send包含end(结束),匹配到下面的就不执行了
});
app.all('/hello',function(req,res){
    res.send('hello');
});
//启动服务器
app.listen(3000);
```

##### 中间件

处理HTTP请求的函数,用来完成各种特定的任务,比如检查用户是否登录,添加公共方法.

注意：app.use( )使用后,程序无效了,出问题了,不知道怎么回事,先留着,后面看。

```javascript
var express = require('express');
//获取配置对象
var app = express();
//使用中间件
app.use('/money',function (req,res,next) {
    //res.mny = 100;
});

app.get('/money',function (req,res) {
    res.send('100');//send是express的func 相当于write and end
});
/*app里面维护一个列队
use get放进队列,然后依次执行
*/
app.listen(3000);
```

##### 模板

模板的原理

```javascript
var express = require('express');
var app = new express();
/*
静态内容
动态内容
静态+动态内容
模板需要渲染,把数据和html组合起来返回
*/
app.get('/',function (req,res) {

});
function render(tmpl,data) {//
    /*替换成函数
    input:匹配的字符串 {{title}}
    group1:第一个匹配的字符串
    */
    return tmpl.replace(/\{\{(\w+)\}\}/,function (input,group1) {//w+是分组
        //用真实的值替换占位的
        console.log(arguments);//当前function里面的参数
        /*{ '0': '{{title}}',//传给input
         '1': 'title',//传给group1
         '2': 4,
         '3': '<hl>{{title}}</hl>' }*/
        return data[group1];

    })
}//把模板里的变量替换成对象里的属性,变量和属性名一定要相同
//把占位符替换成真实的值
//模板最简单的就是字符串的替换
//把'{{title}}'替换成'欢迎'
var result = render('<hl>{{title}}</hl>',{title:'欢迎'});//把{{title}}换成后面的值
console.log(result);
```

index.ejs

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>zfpx</title>
</head>
<body>
<%=title%>
</body>
</html>
```

tmpl.js 注意:我开始app.set('views'),views少写了个s,太马虎啦.

npm install ejs

```javascript
var express = require('express');
var app = new express();
//配置属性值
//配置模板引擎
app.set('view engine','ejs');
//制定模板存放的目录
//path.resolve 先获取当前文件所在的绝对目录,再拼上后面的路径
//process.cwd()可以通过chdir被改变,所以不要用这个,不好.
app.set('views',process.cwd()+'/views');//模板路径
app.get('/',function (req,res) {
  //指定ejs引擎了,就可以不用加后缀了.ejs,加上也没错.
    res.render('index.ejs',{title:'首页'});//render是Express提供的,先读文件，然后替换
});
app.get('/reg',function(req,res){
    res.render('index',{title:'注册'});
});
app.listen(8080);
/*语法简单*/
```

模板里可以写for循环



