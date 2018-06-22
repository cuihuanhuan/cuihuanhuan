---
layout: post
---

一.Request生命周期

1.第一件事情
Laravel应用所有请求的入口在public/index.php文件
来自服务器的(apache nginx)所有的请求被定向到这个文件
这个index.php文件不包含很多代码,相反,这仅仅是加载框架其他部分的起点

index.php文件加载composer生成的autoloader定义,从bootstrap/app.php脚本中
获取Laravel应用的实例,Laravel自身第一个要做的事情就是新建application/service contanier的实例

2.HTTP/Console 内核

接下来,进来的请求被发送到HTTP kernel或者console kernel,取决于即进入应用的请求类型.
这两个内核作为中央单元服务所有的请求.
现在,来看位于app/Http/Kernel.php的HTTP kernel.

HTTP kernel继承 Illuminate\Foundation\Http\Kernel 类,
该类定义了bootstrappers数组,在请求执行之前加载
这些bootstrappers配置错误处理,日志配置,在请求被真正处理之前执行其他需要完成的

HTTP kernel也定义一组HTTP中间件,所有请求在被应用处理之前经过这些HTTP中间件.
这些中间件处理HTTP session读写,决定应用是否在维护模式,验证CSRF tokern等.

HTTP kernel的handle函数声明相当简单,接收Request,返回Response.
可以把Kernel认为一个大的黑盒子,代表你整个应用.接受HTTP request,返回HTTP response.

3.Service Providers
最重要的kernel启动操作是为你的应用加载service providers,
应用的所有的service providers配置在config/app.php的providers数组里.
首先,register函数被所有的providers调用,然后,一旦所有的providers被注册,boot函数就被调用.


service providers负责启动框架所有的组件,比如数据库,队列,验证,路由组件.
自从启动和配置框架的所有功能,service providers是整个Laravel启动过程最重要的方面.


4.分发请求
一旦应用启动,service providers被注册,Request就被传递给router分发下去,router将请求分发到router或者controller,
也可能作为路由的中间件运行

5.service providers

service providers是启动Laravel应用真正的关键.应用实例被创建,service providers被注册,
request将被交给启动的应用,是相当简单.

对Laravel应用通过service provideers构建和启动有基本的掌握,当然,你的应用默认的
service providers存储在app/Providers目录


默认,AppServiceProvider是空的,这个provider是用来添加应用的自启动和service container绑定的,
当然,对于大型应用,你可以创建几个service providers,每一个有更细粒度的启动类型.



