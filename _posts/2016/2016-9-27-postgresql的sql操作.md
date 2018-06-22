---
layout: post
title: "postgresql的sql语句"
date: 2016-9-27
---
    //修改表名,默认值,添加列,删除列,修改列名,修改列的数据类型,设置非空和空

    //修改表名
    alter table city rename to city1;  
    //设置默认值,之前的默认值不会修改
    alter table city alter population set default 1;  
    //添加列
    alter table city add column population int not null default 0;
    //删除列
    alter table city1 drop  population;    
    //修改列的数据类型
    alter table city1 alter id type varchar(10); 
    //设置非空
    //如果记录中存在空值，则该sql语句会报错ERROR:  column "name" contains null values
    alter table city1 alter name set NOT NULL;   
    //删除非空约束
    alter table city alter name drop NOT NULL; 