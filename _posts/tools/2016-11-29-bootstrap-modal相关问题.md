---
title: bootstrap-modal相关问题
categories: Bootstrap
tags: Bootstrap
---



问题1. bootstrap 模态框避免点击背景处关闭

```
$('#myModal').modal({backdrop: 'static', keyboard: false}); 
```


问题2. bootstrap打开模态modal窗口引起页面抖动

在使用bootstrap的modal模态窗口组件时，触发后会发现页面有抖动现象。这是因为它隐藏了浏览器滚动条，页面就相当于变宽了，关闭模态窗口后，页面又出现滚动条，页面又变窄了，这一伸一缩就会使页面产生抖动现象。我的解决方法很简单，就是干掉隐藏滚动条的代码。总共删除bootstrap.js文件中6行代码就可以了。

以bootstrap3.3.6版本中未压缩的bootstrap.js文件为例。

第一处在971行左右，删除这3句

```
this.checkScrollbar()
this.setScrollbar()
this.$body.addClass('modal-open')
```


第二处1081行左右，也删除3句

```
that.$body.removeClass('modal-open')
that.resetAdjustments()
that.resetScrollbar()
```


这样就好了。都是写无关紧要的代码，给body加内边距的，不会影响其他组件的运行。


用法
通过 data 属性或 JavaScript 调用模态框插件，可以根据需要动态展示隐藏的内容。模态框弹出时还会为 <body> 元素添加 .modal-open类，从而覆盖页面默认的滚动行为，并且还会自动生成一个 .modal-backdrop 元素用于提供一个可点击的区域，点击此区域就即可关闭模态框。

通过 data 属性
不需写 JavaScript 代码也可激活模态框。通过在一个起控制器作用的元素（例如：按钮）上添加 data-toggle="modal" 属性，或者 data-target="#foo" 属性，再或者 href="#foo" 属性，用于指向被控制的模态框。

```
<button type="button" data-toggle="modal" data-target="#myModal">Launch modal</button>
```


通过 JavaScript 调用
只需一行 JavaScript 代码，即可通过元素的 id myModal 调用模态框：

```
$('#myModal').modal(options)
```


参数
可以将选项通过 data 属性或 JavaScript 代码传递。对于 data 属性，需要将参数名称放到 data- 之后，例如 data-backdrop=""。

