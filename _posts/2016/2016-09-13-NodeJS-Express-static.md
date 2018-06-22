---
title: Express static source access
categories: NodeJs
tags: NodeJs
---

静态文件服务中间件

```javascript
var express = require('express');
var app = express();
//path.resolve('public')
//express.static()返回值是一个函数
app.use(express.static(__dirname+'/public'));
app.listen(8080);

//等价于读文件

var express = require('express');
var fs = require('fs');
var app = express();
app.use(function(req,res,next){
    fs.createReadStream(__dirname+'/public'+req.url).pipe(res);
})
app.listen(8080);
```

