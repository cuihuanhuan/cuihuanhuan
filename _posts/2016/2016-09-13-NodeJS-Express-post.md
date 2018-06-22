---
title: Express post function
categories: NodeJs
tags: NodeJs
---

安装ejs会装很多,是依赖,层层依赖

```javascript
var express = require('express');
var app = express();
app.use(express.static(__dirname));
var bodyParser = require('body-parser');
//传输的数据有很多类型
//urlencoded 查询字符串
//extended 参数转为对象的方式
//extended为true时,用querystring，如果是false,用bodyParser自己的转换方法
/*
 Content-Type:application/x-www-form-urlencoded
 Form Data
 view source
 view URL encoded
 username:ff
 password:gg
*/
/*
如果请求头里的Content-Type是application/x-www-form-urlencoded时,会用中间件转为对象放到req
的body中,否则什么也不做
 如果请求头里的Content-Type是application/json时,...
* */
//app.use(bodyParser.urlencoded({extended:true}));//此中间件会把请求体提取出来放到req.body
app.use(bodyParser.json({extended:true}));
app.post('/reg',function (req,res) {
    console.log(req.body);
    res.send('reg');
});

app.listen(8080);
```

