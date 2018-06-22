---
layout: post
title: "css中的!import"
date: 2016-8-12
---
css中的!import提升属性优先级

```
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
p {
    color: red !important;
}
#thing {
    color: green;
}
</style>
</head>
<body>

<p id="thing">Will be RED.</p>
</body>
</html>
```
段落是红色的

![img](/img/demo/css-demo-1.png)