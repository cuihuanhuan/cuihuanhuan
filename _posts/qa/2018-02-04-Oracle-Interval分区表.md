---
title: Oracle Interval分区表
categories: Oracle
tags: Oracle
---

Interval Partition是Range分区的一个扩展。


interval分区的特点
1.由range分区派生而来
2.以定长宽度创建分区（比如年、月、具体的数字（比如100、500等））
3.分区字段必须是number或date类型
4.必须至少指定一个range分区（永久分区）
5.当有记录插入时，系统根据需要自动创建新的分区和本地索引
6.已有的范围分区可被转换成间隔分区（通过ALTER TABLE SET INTERVAL选项完成）
7.Interval Partitioning不支持支持索引组织表
8.在Interval Partitioning表上不能创建domain index

```
--新建interval分区表
create table sub 
( a1 number,
year number
)
partition by range (a1) interval (100)
subpartition by range (year)
subpartition template (
subpartition sp_2016 values less than (2017),
subpartition sp_2017 values less than (2018),
subpartition sp_2018 values less than (2019)
)
(
partition b1 values less than (2),
partition b2 values less than (4)
);

insert into sub values (1,2015);
insert into sub values (2,2016);
insert into sub values (3,2017);
insert into sub values (203,2018);
insert into sub values (205,2014);
insert into sub values (305,2014);
commit;
--删除数据
delete from sub where a1=1;
commit;
--更新数据
update sub set year=2015 where a1=205
commit;
--查询子分区
select * from USER_TAB_SUBPARTITIONS where table_name='SUB';
select * from sub partition(sp_2018);
select * from sub SUBPARTITION(B1_SP_2018);
--交换分区
sub是组合表，有range子分区的，然后swap表应该是range分区表，没有子分区。swap表的分区应该与sub的B1分区的子分区对应。




create table sub 
( a1 number,
year number
)
partition by range (a1) 
subpartition by range (year)
subpartition template (
subpartition sp_2016 values less than (2017),
subpartition sp_2017 values less than (2018),
subpartition sp_2018 values less than (2019)
)
(
partition b1 values less than (2),
partition b2 values less than (4)
);
insert into sub values (1,2015);
insert into sub values (2,2016);
insert into sub values (3,2017);
commit;


create table swap_s
( a1 number,
year number
)
partition by range (year)

(
partition sp_16 values less than (2017),
partition sp_17 values less than (2018),
partition sp_18 values less than (2019)

);


alter table sub exchange partition b1 with table swap_s
commit;

select * from sub partition(b1);
select * from swap_s
```