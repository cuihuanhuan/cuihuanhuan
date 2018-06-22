---
layout: post
---

<h4>php-sprintf-sql语句的拼接</h4>

在php中，拼接mysql语句时，通常情况下，会使用点操作符，如下：

$user_id = 1;

$subject = '哲学';

$sql = "select * from scores where `user_id`=".$user_id." and `subject`='".$subject."'";

以这种方式来拼接sql，会比较繁琐，尤其是当参数比较多的时候，下面，利用php的sprintf函数，来优化上面的写法：

$user_id = 1;

$subject = '哲学';

$sql = sprintf("select * from scores where `user_id`=%d and `subject`='%s'",$user_id,$subject);

这样的代码，看起来是不是比较简洁，没有之前那么乱了。

其中，%d和%s相当于占位符，后面的$user_id和$subject会依次替换它们。

从形式上来看，sprintf的方式，有点类似于预处理功能中的参数绑定。

注意：不管是sprintf方式，还是点操作符方式，都无法阻挡sql的注入攻击。



以下是拼接postgresql语句：

$sql = sprintf("select * from user2 where name='%s' and password='%s'",$username,$password);

echo $sql;

$user=$db->query($sql);

运行结果:select * from user2 where name='admin' and password='admin'