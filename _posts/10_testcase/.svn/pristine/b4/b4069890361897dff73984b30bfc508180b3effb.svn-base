case 701 "interval插入数据添加分区" 0
drop table sub purge
/
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
)
/
insert into sub values (1,2015)
/
insert into sub values (2,2016)
/
insert into sub values (3,2017)
/
insert into sub values (203,2018)
/
insert into sub values (205,2014)
/
commit
/

tgt_sql:
select table_name,partitioning_type,partition_count from user_part_tables where table_name='SUB'
/
select count(*) from user_tab_subpartitions where table_name='SUB'
/
select * from sub order by a1
/

case 702 "interval插入数据添加分区delete" 0
drop table sub purge
/
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
)
/
insert into sub values (1,2015)
/
insert into sub values (2,2016)
/
insert into sub values (3,2017)
/
insert into sub values (203,2018)
/
insert into sub values (205,2014)
/
commit
/
delete from sub where a1=1
/
commit
/

tgt_sql:
select table_name,partitioning_type,partition_count from user_part_tables where table_name='SUB'
/
select count(*) from user_tab_subpartitions where table_name='SUB'
/
select * from sub order by a1
/


case 703 "interval插入数据添加分区update" 0
drop table sub purge
/
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
)
/
insert into sub values (1,2015)
/
insert into sub values (2,2016)
/
insert into sub values (3,2017)
/
insert into sub values (203,2018)
/
insert into sub values (205,2014)
/
commit
/
update sub set year=2015 where a1=205
/
commit
/

tgt_sql:
select table_name,partitioning_type,partition_count from user_part_tables where table_name='SUB'
/
select count(*) from user_tab_subpartitions where table_name='SUB'
/
select * from sub order by a1
/

case 704 "interval插入数据添加分区,交换分区" 0
drop table sub purge
/
drop table swap_t purge
/
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
partition b1 values less than (10),
partition b2 values less than (20)
)
/
insert into sub values (1,2015)
/
insert into sub values (2,2016)
/
insert into sub values (13,2017)
/
insert into sub values (203,2018)
/
insert into sub values (205,2014)
/
commit
/
create table swap_t
( a1 number,
year number
)
partition by range (year) (
partition sp_16 values less than (2017),
partition sp_17 values less than (2018),
partition sp_18 values less than (2019)
)
/
insert into swap_t values (4,2015)
/
insert into swap_t values (5,2016)
/
commit
/
alter table sub exchange partition b1 with table swap_t
/

tgt_sql:
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('SUB','SWAP_T') order by table_name
/
select count(*) from user_tab_subpartitions where table_name='SUB'
/
select * from sub order by a1
/
select * from swap_t order by a1
/