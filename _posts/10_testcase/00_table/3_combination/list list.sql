 case 500 "组合表(列表+列表): 建表" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
update accounts set customer_id=201708 where id > 3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/


 case 501 "组合表(列表+列表): 增加分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
commit
/
alter table accounts add partition p_add values ('KK', 'TT')
/
insert into accounts values(7,17,107,1007,10007,'KK','G')
/
update accounts set customer_id=201708 where id > 3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/


case 502 "组合表(列表+列表): 删除分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')	
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
commit
/
alter table accounts drop partition p_southcentral
/
update accounts set customer_id=201708 where id > 3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/



 case 503 "组合表(列表+列表): 增加子分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
commit
/
alter table accounts modify partition p_southcentral add subpartition p_sc_add values ('J')
/
insert into accounts values(7,17,107,1007,10007,'OK','J')
/
update accounts set customer_id=201708 where id > 3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/



case 504 "组合表(列表+列表): 删除子分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
commit
/
alter table accounts drop subpartition p_sc_good
/
update accounts set customer_id=201708 where id > 3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/



 case 505 "组合表(列表+列表): 分区改名" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
commit
/
alter table accounts rename partition p_southcentral to p_sc
/
update accounts set customer_id=201708 where id >3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/

 case 506 "组合表(列表+列表): 子分区改名" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
insert into accounts values(7,17,107,1007,10007,'TX','B')
/
commit
/
alter table accounts rename subpartition  p_sc_bad to p_sc_sub
/
update accounts set customer_id=201708 where id >3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/



 case 507 "组合表(列表+列表): 合并分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
alter table accounts add constraint pk_ll primary key (id)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
commit
/
alter table accounts merge partitions p_northcentral,p_southcentral into partition p_central
/
alter index pk_ll rebuild
/
update accounts set customer_id=201708 where id >3
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


 case 508 "组合表(列表+列表): 分裂分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
alter table accounts merge partitions p_northcentral,p_southcentral into partition p_central
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
commit
/
alter table accounts split partition p_central VALUES ('SD', 'OK') into ( partition p_northcentral, partition p_southcentral )
/
update accounts set customer_id=201708 where id >3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 509 "组合表(列表+列表): 合并子分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','A')
/
insert into accounts values(7,17,107,1007,10007,'TX','B')
/
commit
/
alter table accounts merge subpartitions p_sc_bad,p_sc_average into subpartition p_sc_notgood
/
update accounts set customer_id=201708 where id > 5
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/

 case 510 "组合表(列表+列表): 分裂子分区" 0 
 drop table accounts purge
 /
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
alter table accounts merge subpartitions p_sc_bad,p_sc_average into subpartition p_notgood
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'UT','B')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
insert into accounts values(4,14,104,1004,10004,'FL','A')
/
insert into accounts values(5,15,105,1005,10005,'SD','G')
/
insert into accounts values(6,16,106,1006,10006,'OK','G')
/
insert into accounts values(7,17,107,1007,10007,'TX','B')
/
commit
/
alter table accounts split subpartition p_notgood values ('B') into ( subpartition p_sc_bad , subpartition p_sc_average )
/
update accounts set customer_id=201708 where id > 3
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/

case 511 "组合表(列表+列表): 交换分区" 0
drop table accounts purge
 /
drop table swap_t purge
/
 CREATE TABLE accounts
( id             NUMBER 
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
alter table accounts add constraint pk_ll primary key (id)
/
 CREATE TABLE swap_t
( id             NUMBER 
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (status)
( PARTITION swap_t_p1 VALUES ('B')
, PARTITION swap_t_p2 VALUES ('A')
, PARTITION swap_t_p3 VALUES ('G')
)
/
alter table swap_t add constraint PK_id_s primary key (id)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'OR','A')
/
insert into accounts values(3,13,103,1003,10003,'AZ','G')
/
insert into swap_t values(11,11,101,1001,10001,'OR','B')
/
insert into swap_t values(22,12,102,1002,10002,'OR','A')
/
insert into swap_t values(33,13,103,1003,10003,'OR','G')
/
commit
/
alter table accounts exchange partition p_northwest with table swap_t
/
alter index pk_ll rebuild
/
alter INDEX PK_id_s rebuild
/
update accounts set customer_id=201708 where region = 'OR'
/
update accounts set customer_id=201708 where region != 'OR'
/
commit
/
update swap_t set customer_id=201709 where region = 'OR'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('ACCOUNTS','SWAP_T') order by table_name
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('ACCOUNTS','SWAP_T') order by table_name
/
select table_name,partition_name,high_value from user_tab_partitions where table_name in('ACCOUNTS','SWAP_T') order by table_name,partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/
select * from swap_t order by id
/


case 512 "组合表(列表+列表): 交换子分区" 0
drop table accounts purge
/
drop table swap_t purge
/
 CREATE TABLE accounts
( id             NUMBER 
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
alter table accounts add constraint pk_ll primary key (id)
/
 CREATE TABLE swap_t
( id             NUMBER 
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
/
alter table swap_t add constraint PK_id_s primary key (id)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'OR','B')
/
insert into accounts values(3,13,103,1003,10003,'OK','G')
/
insert into swap_t values(11,11,101,1001,10001,'OR','B')
/
commit
/
alter table accounts exchange subpartition p_nw_bad with table swap_t
/
alter index pk_ll rebuild
/
alter INDEX PK_id_s rebuild
/
update accounts set customer_id=201708 where region = 'OR'
/
commit
/
update accounts set customer_id=201708 where region != 'OR'
/
update swap_t set customer_id=201709 where region = 'OR'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('ACCOUNTS','SWAP_T') order by table_name
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('ACCOUNTS','SWAP_T') order by table_name
/
select table_name,partition_name,high_value from user_tab_partitions where table_name in('ACCOUNTS','SWAP_T') order by table_name,partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/
select * from swap_t order by id
/


case 513 "组合表(列表+列表): 分区truncate" 0
drop table accounts purge
/
drop table swap_t purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'OR','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/ 
alter table accounts truncate partition p_northwest
/
update accounts set customer_id=201708 where id = 3
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/

case 513 "组合表(列表+列表): 子分区truncate" 0
drop table accounts purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region)
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'OR','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
alter table accounts truncate subpartition p_nw_bad
/
update accounts set customer_id=201708 where not (region = 'OR' and status = 'B')
/
commit
/            
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/

case 514 "组合表(列表+列表): 移动第一个分区子分区（相同表空间）" 0
drop table accounts purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region) 
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'OR','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/ 
alter table accounts move SUBPARTITION p_nw_bad
/
alter table accounts move SUBPARTITION p_nw_average
/
alter table accounts move SUBPARTITION p_nw_good
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_northwest tablespace users
/
update accounts set customer_id=201708 where id < 4
/
commit
/            
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/


case 515 "组合表(列表+列表): 移动第一个分区子分区（不同表空间）" 0
drop table accounts purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region) 
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OR','B')
/
insert into accounts values(2,12,102,1002,10002,'OR','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/  
alter table accounts move SUBPARTITION p_nw_bad tablespace system
/
alter table accounts move SUBPARTITION p_nw_average tablespace system
/
alter table accounts move SUBPARTITION p_nw_good tablespace system
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_northwest tablespace system
/
update accounts set customer_id=201708 where id < 4
/
commit
/            
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/


case 516 "组合表(列表+列表): 移动第二个分区子分区（相同表空间）" 0
drop table accounts purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region) 
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'AZ','B')
/
insert into accounts values(2,12,102,1002,10002,'AZ','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/ 
alter table accounts move SUBPARTITION p_sw_bad
/
alter table accounts move SUBPARTITION p_sw_average
/
alter table accounts move SUBPARTITION p_sw_good
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southwest tablespace users
/
update accounts set customer_id=201708 where id < 4
/
commit
/            
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/


case 517 "组合表(列表+列表): 移动第二个分区子分区（不同表空间）" 0
drop table accounts purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region) 
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'AZ','B')
/
insert into accounts values(2,12,102,1002,10002,'AZ','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/ 
alter table accounts move SUBPARTITION p_sw_bad tablespace system
/
alter table accounts move SUBPARTITION p_sw_average tablespace system
/
alter table accounts move SUBPARTITION p_sw_good tablespace system
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southwest tablespace system
/
update accounts set customer_id=201708 where id < 4
/
commit
/            
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/


case 518 "组合表(列表+列表): 移动最后一个分区子分区（相同表空间）" 0
drop table accounts purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region) 
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B') 
  , SUBPARTITION p_sw_average VALUES ('A') 
  , SUBPARTITION p_sw_good VALUES ('G') 
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OK','B')
/
insert into accounts values(2,12,102,1002,10002,'OK','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/
alter table accounts move SUBPARTITION p_sc_bad
/
alter table accounts move SUBPARTITION p_sc_average
/
alter table accounts move SUBPARTITION p_sc_good
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southcentral tablespace users
/
update accounts set customer_id=201708 where id < 4
/
commit
/            
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/


case 519 "组合表(列表+列表): 移动最后一个分区子分区（不同表空间）" 0
drop table accounts purge
/
 CREATE TABLE accounts
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
PARTITION BY LIST (region) 
SUBPARTITION BY LIST (status)
( PARTITION p_northwest VALUES ('OR', 'WA')
  ( SUBPARTITION p_nw_bad VALUES ('B')
  , SUBPARTITION p_nw_average VALUES ('A')
  , SUBPARTITION p_nw_good VALUES ('G')
  )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
  ( SUBPARTITION p_sw_bad VALUES ('B')
  , SUBPARTITION p_sw_average VALUES ('A')
  , SUBPARTITION p_sw_good VALUES ('G')
  )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
  ( SUBPARTITION p_ne_bad VALUES ('B')
  , SUBPARTITION p_ne_average VALUES ('A')
  , SUBPARTITION p_ne_good VALUES ('G')
  )
, PARTITION p_southeast VALUES ('FL', 'GA')
  ( SUBPARTITION p_se_bad VALUES ('B')
  , SUBPARTITION p_se_average VALUES ('A')
  , SUBPARTITION p_se_good VALUES ('G')
  )
, PARTITION p_northcentral VALUES ('SD', 'WI')
  ( SUBPARTITION p_nc_bad VALUES ('B')
  , SUBPARTITION p_nc_average VALUES ('A')
  , SUBPARTITION p_nc_good VALUES ('G')
  )
, PARTITION p_southcentral VALUES ('OK', 'TX')
  ( SUBPARTITION p_sc_bad VALUES ('B')
  , SUBPARTITION p_sc_average VALUES ('A')
  , SUBPARTITION p_sc_good VALUES ('G')
  )
)
/
insert into accounts values(1,11,101,1001,10001,'OK','B')
/
insert into accounts values(2,12,102,1002,10002,'OK','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/
alter table accounts move SUBPARTITION p_sc_bad tablespace system
/
alter table accounts move SUBPARTITION p_sc_average tablespace system
/
alter table accounts move SUBPARTITION p_sc_good tablespace system
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southcentral tablespace system
/
update accounts set customer_id=201708 where id < 4
/
commit
/            
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name,subpartition_name
/
select * from accounts order by id
/









