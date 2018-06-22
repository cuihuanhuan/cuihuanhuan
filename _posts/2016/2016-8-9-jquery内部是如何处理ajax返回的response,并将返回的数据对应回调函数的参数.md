---
layout: post
title: "jquery内部是如何处理ajax返回的response,并将返回的数据对应回调函数的参数"
date: 2016-8-9
---
jquery内部是如何处理ajax返回的response，并将返回的数据对应回调函数的参数?


实际上jQuery的ajax方法也只是封装了XMLHttpRequest，简单地实现就是：

    var tAjax = function(config) {
      var url      = config.url;
      var complete = config.success; 
      var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
      xhr.open('post', url);
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                success(xhr.responseText);
            }
        }
      }
      xhr.send();
    }

上面代码的config就类似与$.ajax({...})里传入的{...}，最后将xhr返回的数据传入配置里的success函数，当然，上面写的并不是jQuery的ajax源码，不过大概意思就这样了，有空看看源码实现吧，另外我发的那篇文章对异步和回调解释得很清楚，建议详细阅读一下。
