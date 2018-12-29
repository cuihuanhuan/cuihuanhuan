---
title: Oracle SQL总结
categories: Oracle
tags: Oracle
---

Oracle SQL总结



1.启动Oracle监听

```
lsnrctl start
```

2.启动数据库

```
sqlplus / as sysdba

SQL> startup

SQL> conn HUAN
```

3.查看Oracle的版本

```
SQL> select * from v$version;

BANNER

Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
PL/SQL Release 11.2.0.1.0 - Production
CORE	11.2.0.1.0	Production
TNS for Linux: Version 11.2.0.1.0 - Production
NLSRTL Version 11.2.0.1.0 - Production
```


4.数据库字符集
```
SQL> select userenv('language') from dual;

USERENV('LANGUAGE')
----------------------------------------------------
AMERICAN_AMERICA.WE8MSWIN1252
```


5.新建用户
```
create user "用户" identified by 12345;
```
6.查询所有用户
```
select * from all_users;
```

7.查询当前用户的表

```
SQL> select * from tab;
```

8.清空已删除的表
![img](img/oracle/demo-1.png)
这些删除表操作,是把表名 改为以BIN$ 开头的表
purge recyclebin; 清除这些。  删除表的时候 后面加上purge 就不会有了。
加上参数 purge 或者是 CASCADE CONSTRAINTS

```
SQL> purge recyclebin;
```

9.创建物化视图

```
create table mv_t_test1 (no int primary key,name varchar2(10));
insert into mv_t_test1 values ('1','info2soft');

CREATE MATERIALIZED VIEW LOG ON  mv_t_test1
WITH PRIMARY KEY
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW mv_v_test1 
BUILD IMMEDIATE  
REFRESH FAST WITH PRIMARY KEY  
ON DEMAND  
ENABLE QUERY REWRITE  
AS  
SELECT * FROM  mv_t_test1;
```


10.创建/使用db link


修改`/opt/oracle/product/11.2/db_1/network/admin/tnsnames.ora`

将备机的配置复制到tnsnames.ora
```
ORCL =
  (DESCRIPTION =

  (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.17.11)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = orcl)
  )

  )
ORCLbk =
  (DESCRIPTION =

  (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.17.12)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = orcl)
  )

 )
```

创建db link

```
create database link dblink2
   connect to HUAN identified by "12345"
   using 'ORCLbk'   
```

测试连通db link

```
SELECT * FROM DUAL@dblink2;
```


在服务器B上的数据库建表：

```
create table test (no int,name varchar2(10));
insert into test values ('1','info2soft');
```

在本机A上的数据库建表：

```
create table test (no int,name varchar2(10));
insert into test select * from test@dblink2;
```

检验是否成功插入数据:在服务器A,B分别执行查询

```
select * from test;
```