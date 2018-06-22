---
title: Advanced JS
categories: JS
tags: JS
---

对象是属性的集合

对象可以任意扩展属性

函数和数组也可以定义属性

函数是对象的一种,函数是一种对象.

##### 对象

```javascript
var obj = new Object();
var arr = new Array();
//就是提供给我们的语法糖,内部还是通过new Obejct/Array实现的
var obj2 = {};
var arr2 = [,,];
//fn也是Function创建的

function  fn(a,b) {
    console.log(a+b);
}
var fn = new Function('a','b','console.log(a+b)');
fn(1,3);
/*
函数组成：
* 函数名
* 函数参数
* 函数体 是最后一个参数
* */
//所有对象都是通过函数创建的

//鸡生蛋,蛋生鸡的情况 相互依赖
//相互依赖是没有问题的
//a.js
console.log('a1');
require('./b');
console.log('a2');
exports.num = 1;
//b.js
console.log('b1');
//在require a的时候返回一个临时的引用,来初始化完成的对象
var a = require('./a');
console.log(a);
console.log('b2');
/*require是同步的
run a.js 输出结果是a1
b1
{}
b2
a2
*/
```

##### 原型

```javascript
//创建函数的时候会自带prototype,指向Function的构造器
var Add = new Function('a','b','return a+b');
//2.档创建add函数的时候,会自动送一个add.prototype对象
//函数名一般大写
/*
* 每个对象都有一个_proto_属性,隐式原型,指向构造函数的prototype
*自定义函数Foo有Foo.prototype属性,Foo的隐士原型指向object的prototype
* Object.prototype是一个特例,它的proto指向的是null
* 1.prototype叫原型,构造函数的属性
*__proto__叫隐士原型,通过构造函数构造出来的对象的属性,指向构造函数的prototype
*
* */
var o1 = new Object();
console.log(o1.__proto__ === Object.prototype);

```

##### 继承

```javascript
/*
* js继承是通过原型链来体现的
* 访问一个对象的属性时,先在自身属性中查找,如果没有,在沿着proto这条链向上找.这就是原型链
* hasOwnProperty区分一个属性到底是自己的还是从原型中继承
* */
var Person = function () {
    this.name = 'zfpx';
}
Person.prototype.getName = function () {
    console.log(this.name);
}
var p = new Person();
/*
* 找属性的时候沿着__proto__这条线来找的
* 什么时候时候把属性放到原型身上,什么时候适合放到自己身上
* 私有的放在里面,共用的放在外面
* */
p.getName();
console.log(p.hasOwnProperty('name'));//true
console.log(p.hasOwnProperty('getname'));//false
/*
* 执行全局代码时,会产生一个全局执行上下文环境,可以认为是一个对象
* 里面有this:上下文对象
* var 变量(初始化上下文执行环境,把var 变量初始化出来，放到上下文中)
* 函数表达式，函数声明会预解释,会提前到最前面执行
*
* 每次调用函数都会产生函数执行上下文环境
* */
//会提前声明,但不会提前赋值
var a = 10;//执行到这里产生全局上下文执行环境
console.log(a);
//会提前声明,并赋值
function say(){

}

//全局上下文环境也是对象

//函数的上下文环境
/*
* 函数比全局对象多一些东西
* argument形参 length callee 类数组
*
*
*
* ---都有的
* this
* var 函数声明
*
* */
var c= 1;
function fn1(){//执行到这里产生一个函数内部环境上下文
  /*  {
        argument
    }*/ //这也是对象
    var a = 10;
    console.log(a);
    function fn2() {
        //这里面的变量都会放在VO中,VO中方的是var 函数声明 arguments
        var b = 5;/*找变量,先从当前的上下文环境中的VO中找,如果当前VO里没有,会在作用域链中找
        作用域链中放的什么?类似全局和函数上下文环境的的链条


        */
        console.log(b);//b存在哪里,先找自己作用域,再找父作用域,找到全局作用域没找到就没有了
        console.log(a);
    }

}
fn1();
/*当函数调用完成时,这个上下文环境以及其中的数据都会被清除,再重新回答哦哦全局上下文环境,
处于活动状态的执行上下文只有一个
*/
/*
* 其实这是一个压栈出栈的过程,
*执行上下文包含：
* 变量对象
* 作用域链:
* this
*
* */

/*
* arguents(callee length properties-index)函数参数，未传则初始化未undefined
* 自由变量的取值作用域(作用域链),自由变量是指在其他作用域中声明的变量
* 函数在定义的时候(不是调用的时候)就已经确定了函数体内部自由变量的取值作用域
*
*
*
* */

var a = 10;
function fn() {//a的取值是定义时确定的,而非运行时确定的
    console.log(a);
}
function bar() {
    var a = 20;//bar没执行所以a是10
    fn();
}
bar(fn);


/*
* this的值是在调用执行的时候确定的,几种场景
* 1.全局
* 2.函数作为对象的属性
* 3.构造对象
* 4.prototype
* 5.call apply
* */
function say(){
    console.log(this);//Window
}
say();
var person = {say:say};
person.say();

/*当函数没有返回值的时候,new的时候返回this
* 如果函数有返回值,还是this
*
* */
function Person() {
    this.name = 'zfpx';
    console.log(this);
    //当return的是一个非对象类型的话也返回this
    //如果返回的是一个对象类型的话,那返回就是该对象
    //return 3;
    return {age:10};
}
var p = new Person();
console.log(p);

//prototype
Person.prototype.getName = function(){
    console.log(this.name);
}
p.getName();

//call apply

function say(city,word) {
    //this.name是空的,Winodow下没有这个属性
    console.log(this.name,city,word);
}
//基本用法
say('hello','lele');

//apply(Object,options)
var person = {name:'zfpx'};
//apply第一个参数指定了函数运行时的this对象
say.apply(person,['hello','lele']);
//call和apply类似,只是传参方式不一样
say.call(person,'hello','lele');
//迭代输出每一个元素
function each(){
    //var args = arguments;//类数组
    //arguments不能直接调用forEach,它不是真正的数组
    Array.prototype.forEach.call(arguments,function (item) {
        console.log(item);
    })
    //Array.prototype.forEach.call(arguments);
}

//bind 可返回新的函数
/*
*
*
* */
var newSay = say.bind(person);
newSay('city','world');

var newSay = say.bind(person,'city');
newSay('world');


//call apply都是直接调函数,bind是绑定


//作用域
/*
在定义的确定,自由变量从哪个作用域中取值在定义时决定
js除了全局作用域之外,只有函数可以创建作用域
作用域有上下级的关系,上下级关系的确就看函数在哪个作用域下创建的
作用域最大的用处就是隔离变量，不同作用域下同名变量不会冲突
作用域类似一个底牌，其中没有变量，要通过作用域对应的执行上下文环境来换取变量的值
同一个作用域下，不同的调用会产生不同的执行上下文环境，继而产生不同的变量的值
*/
function one() {
    var a = Math.random();
    console.log(a);
    return function () {//闭包，引用父作用域中的a
        return a;//函数执行完a没有被销毁
        //a和one运行时产生的环境变量绑定了,function函数没有销毁，环境没有释放
    }

}
var s = one();//产生新的执行上下文，运行完销毁
var s2 = one();//在同一时间点存在两个执行上下文环境？有可能one入栈出栈
console.log(s(),s2());

/*作用域和执行上下文
除了全局作用域之外,每个函数都会创建自己的额作用域，作用域在函数定义时就已经确定了
 上下文环境是在函数调用时创建的无法直接访问的抽象对象
 只有函数才能创建作用域
 一个作用域下可能包含若干个上下文环境，有可能从来没有过上下文环境(函数从没有被调用过)
 有可能有过，现在函数调用完毕，上下文环境被销毁了，有可能同时存在一个或多个(闭包)
*/
//没有块级作用域
if(true){

    var a = '30';
    console.log(a);
}
for(var i=0;i<10;i++){

}
console.log(a);

if(true){
    'use strict'//es6块级作用域，外部访问不了
    var a = '30';
    console.log(a);
}
//闭包
/*
* 函数作为返回值
* 函数作为参数传递
* 指一个函数与一个引用环境绑定在一起，这个引用环境是一个存储该函数的非全局变量(或者说自由变量的)表(VO)
*
* */
```

