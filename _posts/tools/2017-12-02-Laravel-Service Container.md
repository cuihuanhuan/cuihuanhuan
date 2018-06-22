---
layout: post
---


二.Service Container

Laravel service container对于管理类依赖和管理依赖注入是一个强大的工具.
依赖注入本质上的意思是,类依赖是通过构造器或者setter函数注入到类.
看一个例子：
```
<?php

namespace App\Http\Controllers;

use App\User;
use App\Repositories\UserRepository;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * The user repository implementation.
     *
     * @var UserRepository
     */
    protected $users;

    /**
     * Create a new controller instance.
     *
     * @param  UserRepository  $users
     * @return void
     */
    public function __construct(UserRepository $users)
    {
        $this->users = $users;
    }

    /**
     * Show the profile for the given user.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        $user = $this->users->find($id);

        return view('user.profile', ['user' => $user]);
    }
}
```
在这例子中,UserController需要从数据源获取用户,因此,我们将注入一个可以获取用户的service.
在上下文中,我们的UserRespository可能用来从数据库获取用户信息.
但是,自从respository被注入后,我们可以很容易的和其他实现交换.
当我们测试app时,我们也能够很容易的mock或者创建UserRespository假的实现

深入理解Laravel service container实质上构建一个强大的的app,也是对Laravel core自身的贡献.

1.绑定基础
几乎所有的service container绑定将注册在service providers,因此所有这些例子用container证明.
绑定一个类到container是没有必要的如果它不依赖任何借口,container没有必要指示如何构建这些对象.
自从它可以通过反射自动解决这些对象.
2.简单绑定
在service provider里面,你永远只能通过$this->app属性访问container,我们可以使用bind函数注册绑定,
传递我们希望注册的class或者interface名字以及closure,返回累的实例.


注意我们把收到的container作为参数给resolver,我们可以使用container解决我们构建的对象子依赖.
3.绑定一个单例
单例函数singleton绑定类或者接口道container应该一次被解析,一旦一个单例绑定被解析,相同的对象实例将作为后续调用返回给container.

```
$this->app->singleton('HelpSpot\API', function ($app) {
    return new HelpSpot\API($app->make('HttpClient'));
});
```
4.绑定实例
你可以使用instance函数绑定一个已经存在的对象实例到container.给定的实例在后续调用中将永远返回给container.
```
$api = new HelpSpot\API(new HttpClient);

$this->app->instance('HelpSpot\API', $api);
```
5.绑定普通类
有时,你需要有一个类接收一些注入类,但是也需要注入基本的值比如整型.
你也许很容易使用上下文绑定去注入值到你所需的类.
```
$this->app->when('App\Http\Controllers\UserController')
          ->needs('$variableName')
          ->give($value);
```
6.绑定接口道实现
service container一个非常强大的功能是他绑定接口到给定实现的能力,比如,
假设我们有一个EventPusher接口和一个RedisEventPusher实现,一旦我们写了
RedisEventPusher接口的实现,我们可以注册到service container
```
$this->app->bind(
    'App\Contracts\EventPusher',
    'App\Services\RedisEventPusher'
);
```

上面代码告诉container注入RedisEventPusher,当一个类需要EventPusher实现时.
现在我们可以在构造器中类型提示EventPusher接口,或者依赖被service container注入的任何其他位置.
```
use App\Contracts\EventPusher;

/**
 * Create a new class instance.
 *
 * @param  EventPusher  $pusher
 * @return void
 */
public function __construct(EventPusher $pusher)
{
    $this->pusher = $pusher;
}
```

7.上下文绑定
有时候你有两个类,实现了相同的接口,但是你希望注入不同的实现到每一个类中.
比如,两个控制器可能依赖Illuminate\Contracts\Filesystem\Filesystem不同的实现.
Laravel提供了一个简单,流畅的接口定义这个行为
```
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\PhotoController;
use App\Http\Controllers\VideoController;
use Illuminate\Contracts\Filesystem\Filesystem;

$this->app->when(PhotoController::class)
          ->needs(Filesystem::class)
          ->give(function () {
              return Storage::disk('local');
          });

$this->app->when(VideoController::class)
          ->needs(Filesystem::class)
          ->give(function () {
              return Storage::disk('s3');
          });
```
8.标签
偶尔,你可能需要解决所有的指定的绑定的category.
比如,可能你正在构建一个报告聚合器用来接收一组不同Report接口实现.
注册Report实现之后,你可以指定他们一个tag使用tag函数.
```
$this->app->bind('SpeedReport', function () {
    //
});

$this->app->bind('MemoryReport', function () {
    //
});

$this->app->tag(['SpeedReport', 'MemoryReport'], 'reports');
```
一旦services被标记后,你可以很容易的通过tagged函数解析他们

$this->app->bind('ReportAggregator', function ($app) {
    return new ReportAggregator($app->tagged('reports'));
});


二.解析
1.make函数
你可以使用make函数解析一个容器外的类实例,make函数接收你想解析的类或者接口名.
```
$api = $this->app->make('HelpSpot\API');

```

如果你的代码所在你的位置不能访问$app变量,你可以使用全局resolve帮助函数
```
$api = resolve('HelpSpot\API');

```

如果你的类依赖不能被container解析,你可以通过把他们作为关联数组传递给makeWith函数注入
```
$api = $this->app->makeWith('HelpSpot\API', ['id' => 1]);
```

2.自动注入
作为一种选择,且最重要的,你可以类型提示被container解析的类构造器中的依赖,包含controllers,
event listeners queue jobs,middleware,或更多,在练习中,这是大多数对象呗容器解析的方式.
比如,你可以类型提示一个被你的app在controller构造器中定义的respository.respository将自动被解析,
注入到类中.
```
<?php

namespace App\Http\Controllers;

use App\Users\Repository as UserRepository;

class UserController extends Controller
{
    /**
     * The user repository instance.
     */
    protected $users;

    /**
     * Create a new controller instance.
     *
     * @param  UserRepository  $users
     * @return void
     */
    public function __construct(UserRepository $users)
    {
        $this->users = $users;
    }

    /**
     * Show the user with the given ID.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
    }
}
```
三.container events
service container每次激活一个event,当他解析一个对象.你可以监听这个event使用resolving函数
```
$this->app->resolving(function ($object, $app) {
    // Called when container resolves object of any type...
});

$this->app->resolving(HelpSpot\API::class, function ($api, $app) {
    // Called when container resolves objects of type "HelpSpot\API"...
});

```

如上所述,对象被解析将被传到回调,允许你设置任何额外的属性在对象被传给用户之前

