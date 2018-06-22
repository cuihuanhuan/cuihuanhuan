---
title: JS Function call,apply,bind
description: Differences in JS Function call,apply,bind
categories: JS
tags: JS
---


```javascript
var person = {
    name:'zfpx',
    say:function (word1,word2) {
        console.log(this.name+' say '+word1,word2);
    }
}
person.say('hello','world');
var p = {
    name:'node.js'
}
```

`输出结果`

`zfpx say hello world`
`zfpx say hello world`
`zfpx say hello hello`

```javascript
function fn(a,b,c,d){
    console.log(a,b,c,d);
}

fn.call(null,1,2,3);

fn.apply(null,[1,2,3]);

var f = fn.bind(null,1,2,3);
f(4);
```

