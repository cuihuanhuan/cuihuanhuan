---
title: JS Test beyond Closures and Scopes
description: So, you think you know JavaScript?
categories: JS
tags: JS
---

Quick test for real understanding of JavaScript core beyond closures and scopes. Here five small scripts. Try to answer what will be alerted in each case without running them in the console. Then you could create a test file and easily check your answers.



```javascript
if(!("a" in window)){
	var a = 1;
}
alert(a);//"undefined"
```

```javascript
var a = 1,
	b = function a(x){
		x && a(--x);
	};
alert(a);//1
```

```javascript
function a(x){
    return x*2;
}
var a;
alert(a);
/*
弹出
function a(x){
    return x*2;
}
*/
```

```javascript
function b(x,y,a){
    arguments[2] = 10;
  	alert(a);
}
b(1,2,3);//10
```

```javascript
function a(){
    alert(this);
}
a.call(null);//window [object Window]
```

