case 400 "组合表(列表+哈希): 建表" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
update accounts set branch_id=201708 where id > 3
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


 case 401 "组合表(列表+哈希): 增加分区" 0 
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
update accounts set branch_id=201708 where id > 3
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/

 case 402 "组合表(列表+哈希): 删除分区" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
update accounts set branch_id=201708 where id > 3
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


 case 403 "组合表(列表+哈希):添加子分区" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts modify partition p_southcentral add subpartition pp_southcentral_sub values (105)
/
update accounts set branch_id=201708 where id > 3
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/

 case 404 "组合表(列表+哈希): 融合子分区" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
alter table accounts modify partition p_southcentral add subpartition pp_southcentral_sub values (105)
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
ALTER TABLE accounts MODIFY PARTITION p_southcentral COALESCE SUBPARTITION
/
update accounts set branch_id=201708 where id > 3
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/

 case 405 "组合表(列表+哈希): 分区改名" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts rename partition p_southcentral to p_sc
/
commit
/
update accounts set branch_id=201708 where id > 3
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/

 case 406 "组合表(列表+哈希): 子分区改名" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
alter table accounts modify partition p_southcentral add subpartition pp_southcentral_sub values (105)
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
alter table accounts rename subpartition  pp_southcentral_sub to p_sc_sub
/
update accounts set branch_id=201708 where id > 3
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS' and subpartition_name='P_SC_SUB'
/
select * from accounts order by id
/

 case 407 "组合表(列表+哈希): 合并分区" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
alter table accounts add constraint pk_lh primary key (id)
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
alter index pk_lh rebuild
/
update accounts set branch_id=201708 where region = 'OK' or region = 'SD'
/
commit
/
update accounts set branch_id=201708 where id < 5
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/

 case 408 "组合表(列表+哈希): 分裂分区" 0
drop table accounts purge
/
create table accounts ( object_id NUMBER, object_type VARCHAR2(19), branch_id NUMBER ) 
PARTITION BY LIST ( object_type ) 
subpartition by hash (object_id)              
            (   partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
/
insert into accounts values ( 1001, 'TABLE',1 )
/
insert into accounts values ( 1003, 'TABLE',3 )
/
insert into accounts values ( 1005, 'INDEX',5 )
/
commit
/ 
ALTER TABLE accounts SPLIT PARTITION type_tab_idx VALUES ('TABLE') INTO (
                  PARTITION type_table TABLESPACE users,
                  PARTITION type_index TABLESPACE system  )
/ 
update accounts set branch_id=201708 where object_type = 'TABLE'
/
commit
/                 
update accounts set branch_id=201708 where object_type = 'INDEX'
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by object_id
/


 case 409 "组合表(列表+哈希): 交换分区" 0
drop table accounts purge
/
drop table swap_t purge
/
create table accounts ( object_id NUMBER, object_type VARCHAR2(19), branch_id NUMBER )
PARTITION BY LIST ( object_type ) 
subpartition by hash (object_id)
                   (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
/
CREATE TABLE swap_t ( object_id NUMBER, object_type VARCHAR2(19), branch_id NUMBER ) partition by hash ( object_id ) 
/
insert into accounts values ( 1001, 'TABLE',1 )
/
insert into accounts values ( 1003, 'TABLE',3 )
/
insert into accounts values ( 1005, 'INDEX',5 )
/
insert into swap_t values ( 1001, 'TABLE',10 )
/
insert into swap_t values ( 1003, 'TABLE',30 )
/
commit
/
ALTER TABLE accounts EXCHANGE PARTITION type_table WITH TABLE swap_t
/
update accounts set branch_id=branch_id+201707 where object_type = 'TABLE'
/
commit
/
update accounts set branch_id=branch_id+201708 where object_type = 'INDEX'
/
commit
/

tgt_sql:
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('ACCOUNTS','SWAP_T') order by table_name
/
select table_name,partition_name,high_value from user_tab_partitions where table_name in('ACCOUNTS','SWAP_T') order by table_name,partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by object_id,branch_id
/
select * from swap_t order by object_id,branch_id
/

 case 410 "组合表(列表+哈希): 交换子分区" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 2
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
alter table accounts modify partition p_northwest add subpartition p_northwest_sub values (105)
/
CREATE TABLE swap_t
( id             NUMBER primary key
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(2)
, status         VARCHAR2(1)
)
/
insert into accounts values(1,11,101,1001,10001,'NY','B')
/
insert into accounts values(2,12,102,1002,10002,'AZ','A')
/
insert into accounts values(3,13,105,1003,10003,'WA','G')
/
insert into accounts values(5,15,105,1005,10005,'OR','K')
/
commit
/
alter table accounts exchange subpartition p_northwest_sub with table swap_t
/
update accounts set branch_id=branch_id+201707 where region = 'OR'
/
commit
/
update accounts set branch_id=branch_id+201708 where region != 'OR'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('ACCOUNTS','SWAP_T') order by table_name,constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('ACCOUNTS','SWAP_T') order by table_name
/
select table_name,partition_name,high_value from user_tab_partitions where table_name in('ACCOUNTS','SWAP_T') order by table_name,partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/
select * from swap_t order by id
/


case 411 "组合表(列表+哈希): 分区truncate" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
update accounts set branch_id=201708 where region != 'OR'
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 412 "组合表(列表+哈希): 子分区truncate" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 2
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
alter table accounts modify partition p_northwest add subpartition p_northwest_sub values (105)
/
insert into accounts values(1,11,102,1001,10001,'WA','B')
/
insert into accounts values(2,12,105,1002,10002,'OR','A')
/
insert into accounts values(3,13,103,1003,10003,'NY','A')
/
commit
/
alter table accounts truncate subpartition p_northwest_sub
/
update accounts set branch_id=201708 where customer_id !=105
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 413 "组合表(列表+哈希): 移动第一个分区子分区（相同表空间）" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')( subpartition p1_sub1,
											 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts move SUBPARTITION p1_sub1
/
alter table accounts move SUBPARTITION p1_sub2
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_northwest tablespace users
/
update accounts set branch_id=201708 where id < 4
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 414 "组合表(列表+哈希): 移动第一个分区子分区（不同表空间）" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')( subpartition p1_sub1,
											 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts move SUBPARTITION p1_sub1 tablespace system
/
alter table accounts move SUBPARTITION p1_sub2 tablespace system
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_northwest tablespace system
/
update accounts set branch_id=201708 where id < 4
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/



case 415 "组合表(列表+哈希): 移动第二个分区子分区（相同表空间）" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')( subpartition p2_sub1,
												   subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts move SUBPARTITION p2_sub1
/
alter table accounts move SUBPARTITION p2_sub2
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southwest tablespace users
/
update accounts set branch_id=201708 where id < 4
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 416 "组合表(列表+哈希): 移动第二个分区子分区（不同表空间）" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')( subpartition p1_sub1,
												   subpartition p1_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts move SUBPARTITION p1_sub1 tablespace system
/
alter table accounts move SUBPARTITION p1_sub2 tablespace system
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southwest tablespace system
/
update accounts set branch_id=201708 where id < 4
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 417 "组合表(列表+哈希): 移动最后一个分区子分区（相同表空间）" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')( subpartition p6_sub1,
												subpartition p6_sub2 )
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
alter table accounts move SUBPARTITION p6_sub1
/
alter table accounts move SUBPARTITION p6_sub2
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southcentral tablespace users
/
update accounts set branch_id=201708 where id < 4
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 418 "组合表(列表+哈希): 移动最后一个分区子分区（不同表空间）" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')( subpartition p6_sub1,
												subpartition p6_sub2 )
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
alter table accounts move SUBPARTITION p6_sub1 tablespace system
/
alter table accounts move SUBPARTITION p6_sub2 tablespace system
/
alter table accounts modify default ATTRIBUTES FOR PARTITION p_southcentral tablespace system
/
update accounts set branch_id=201708 where id < 4
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


 case 419 "组合表(列表+哈希):truncate表" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
truncate table accounts
/
insert into accounts values(21,11,101,1001,10001,'OR','B')
/
insert into accounts values(22,12,102,1002,10002,'UT','B')
/
insert into accounts values(23,13,103,1003,10003,'NY','A')
/
insert into accounts values(24,14,104,1004,10004,'FL','A')
/
insert into accounts values(25,15,105,1005,10005,'SD','G')
/
insert into accounts values(26,16,106,1006,10006,'OK','G')
/
update accounts set branch_id=201708 where id > 23
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
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


 case 420 "组合表(列表+哈希):创建普通索引和local索引" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
create index idxacc on accounts ( account_number,customer_id )
/
create index idxacc_loc on accounts ( balance ) local
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

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='ACCOUNTS' order by index_name
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/


case 421 "组合表(列表+哈希):删除普通索引和local索引" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
create index idxacc on accounts ( account_number,customer_id )
/
create index idxacc_loc on accounts ( balance ) local
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
drop index idxacc
/
drop index idxacc_loc
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='ACCOUNTS' order by constraint_type
/
select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='ACCOUNTS' order by index_name
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/
select * from accounts order by id
/



case 422 "组合表(列表+哈希):增加约束" 0
drop table accounts purge
/
drop table check_table2 purge
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(10)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
create table check_table2
(
  t_key2       number not null PRIMARY KEY,
  t_unique2    number,
  t_notnull2   varchar2(10),
  t_condition2 number
)
/
alter table accounts add constraint pk_accounts primary key (id)
/
alter table accounts add constraint chk_accounts check(account_number>20)
/
alter table accounts add constraint unq_accounts unique(customer_id)
/
alter table accounts add constraint fk_accounts foreign key (branch_id) references check_table2(t_key2)
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_name
/
select table_name,constraint_type,status from user_constraints where table_name in('CHECK_TABLE2') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/


case 423 "组合表(列表+哈希):修改约束为disable" 0
drop table accounts purge
/
drop table check_table2 purge
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(10)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
create table check_table2
(
  t_key2       number not null PRIMARY KEY,
  t_unique2    number,
  t_notnull2   varchar2(10),
  t_condition2 number
)
/
alter table accounts add constraint pk_accounts primary key (id)
/
alter table accounts add constraint chk_accounts check(account_number>20)
/
alter table accounts add constraint unq_accounts unique(customer_id)
/
alter table accounts add constraint fk_accounts foreign key (branch_id) references check_table2(t_key2)
/
alter table accounts modify constraint pk_accounts disable
/
alter table accounts modify constraint chk_accounts disable
/
alter table accounts modify unique(customer_id) disable
/
alter table accounts modify constraint fk_accounts disable
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_name
/
select table_name,constraint_type,status from user_constraints where table_name in('CHECK_TABLE2') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/



case 424 "组合表(列表+哈希):修改约束为enable" 0
drop table accounts purge
/
drop table check_table2 purge
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(10)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
create table check_table2
(
  t_key2       number not null PRIMARY KEY,
  t_unique2    number,
  t_notnull2   varchar2(10),
  t_condition2 number
)
/
alter table accounts add constraint pk_accounts primary key (id)
/
alter table accounts add constraint chk_accounts check(account_number>20)
/
alter table accounts add constraint unq_accounts unique(customer_id)
/
alter table accounts add constraint fk_accounts foreign key (branch_id) references check_table2(t_key2)
/
alter table accounts modify constraint pk_accounts disable
/
alter table accounts modify constraint chk_accounts disable
/
alter table accounts modify unique(customer_id) disable
/
alter table accounts modify constraint fk_accounts disable
/
alter table accounts modify constraint pk_accounts enable
/
alter table accounts modify constraint chk_accounts enable
/
alter table accounts modify unique(customer_id) enable
/
alter table accounts modify constraint fk_accounts enable
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_name
/
select table_name,constraint_type,status from user_constraints where table_name in('CHECK_TABLE2') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/


case 425 "组合表(列表+哈希):rename约束" 0
drop table accounts purge
/
drop table check_table2 purge
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(10)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
create table check_table2
(
  t_key2       number not null PRIMARY KEY,
  t_unique2    number,
  t_notnull2   varchar2(10),
  t_condition2 number
)
/
alter table accounts add constraint pk_accounts primary key (id)
/
alter table accounts add constraint chk_accounts check(account_number>20)
/
alter table accounts add constraint unq_accounts unique(customer_id)
/
alter table accounts add constraint fk_accounts foreign key (branch_id) references check_table2(t_key2)
/
alter table accounts rename constraint pk_accounts to pk_acc
/
alter table accounts rename constraint chk_accounts to chk_acc
/
alter table accounts rename constraint unq_accounts to unq_acc
/
alter table accounts rename constraint fk_accounts to fk_acc
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_name
/
select table_name,constraint_type,status from user_constraints where table_name in('CHECK_TABLE2') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/



case 426 "组合表(列表+哈希):删除约束" 0
drop table accounts purge
/
drop table check_table2 purge
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(10)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
)
/
create table check_table2
(
  t_key2       number not null PRIMARY KEY,
  t_unique2    number,
  t_notnull2   varchar2(10),
  t_condition2 number
)
/
alter table accounts add constraint pk_accounts primary key (id)
/
alter table accounts add constraint chk_accounts check(account_number>20)
/
alter table accounts add constraint unq_accounts unique(customer_id)
/
alter table accounts add constraint fk_accounts foreign key (branch_id) references check_table2(t_key2)
/
alter table accounts drop constraint pk_accounts
/
alter table accounts drop constraint chk_accounts
/
alter table accounts drop constraint unq_accounts
/
alter table accounts drop constraint fk_accounts
/

tgt_sql:
select count(*) from user_constraints where table_name in('ACCOUNTS')
/
select table_name,constraint_type,status from user_constraints where table_name in('CHECK_TABLE2') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select partition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='ACCOUNTS' order by partition_name
/




case 427 "组合表(列表+哈希):增加列(普通列、default not null)" 0
drop table accounts purge
/
drop table check_table2 purge
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts add ac1 varchar2(20)
/
alter table accounts add(ac2 varchar2(20),ac3 number(8) default 200 not null )
/
insert into accounts values(9,15,105,1005,10005,'SD','G','ym','ym1',2)
/
insert into accounts(id,account_number,customer_id,balance,branch_id,region,status,ac1,ac2) values(10,16,106,1006,10006,'OK','G','yaom','yaom1')
/
commit
/
update accounts set account_number=account_number+10,ac3=ac3+5
/
commit
/

tgt_sql:
select column_name,data_type,nullable from user_tab_cols where table_name='ACCOUNTS' order by column_name
/
select table_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select * from accounts order by id
/


case 428 "组合表(列表+哈希):增加列(带default值)" 0
drop table accounts purge
/
drop table check_table2 purge
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts add ac2 number  default 200
/
insert into accounts(id,account_number,customer_id,balance,branch_id,region,status) values(7,17,107,1007,10007,'OR','G')
/
insert into accounts values(8,18,108,1008,10008,'OK','G',250)
/
commit
/
update accounts set account_number=account_number+10,ac2=ac2+5
/
commit
/

tgt_sql:
select column_name,data_type,nullable from user_tab_cols where table_name='ACCOUNTS' order by column_name
/
select table_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select * from accounts order by id
/



case 429 "组合表(列表+哈希):rename列名" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts add ac1 varchar2(20)
/
alter table accounts add(ac2 varchar2(20),ac3 number(8) default 200 not null )
/
insert into accounts values(9,15,105,1005,10005,'SD','G','ym','ym1',2)
/
insert into accounts(id,account_number,customer_id,balance,branch_id,region,status,ac1,ac2) values(10,16,106,1006,10006,'OK','G','yaom','yaom1')
/
commit
/
alter table accounts rename column ac1 to accc1
/
alter table accounts rename column ac3 to accc3
/
insert into accounts(id,account_number,customer_id,balance,branch_id,region,status,accc1,ac2) values(11,17,107,1007,10007,'OK','G','yaom','yaom2')
/
commit
/

tgt_sql:
select column_name,data_type,nullable from user_tab_cols where table_name='ACCOUNTS' order by column_name
/
select table_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select * from accounts order by id
/



case 430 "组合表(列表+哈希):修改数据类型(单列、多列)" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts add(ac1 varchar2(20),ac2 varchar2(20),ac3 varchar2(20),ac4 number  default 200 not null)
/
alter table accounts  modify ac1 number
/
alter table accounts  modify (ac2 number,ac3 varchar2(50))
/
insert into accounts values(11,15,105,1005,10005,'SD','G',20,22,'ym1'，222)
/
commit
/

tgt_sql:
select column_name,data_type,nullable from user_tab_cols where table_name='ACCOUNTS' order by column_name
/
select table_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select * from accounts order by id
/



case 431 "组合表(列表+哈希):删除列(单列、多列)" 0
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
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_southcentral VALUES ('OK', 'TX')
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
alter table accounts add(ac1 varchar2(20),ac2 varchar2(20),ac3 number  default 200 not null)
/
alter table accounts drop column ac1
/
alter table accounts drop (ac2,ac3)
/
insert into accounts values(11,17,107,1007,10007,'SD','G')
/
commit
/

tgt_sql:
select column_name,data_type,nullable from user_tab_cols where table_name='ACCOUNTS' order by column_name
/
select table_name,constraint_type,status from user_constraints where table_name in('ACCOUNTS') order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='ACCOUNTS'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='ACCOUNTS' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select * from accounts order by id
/