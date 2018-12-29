
 case 411 "组合表(列表+哈希):索引：建立普通索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id)
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/

 case 412 "组合表(列表+哈希):索引：删除普通索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id)
/
drop index "idx_account"
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/

case 413 "组合表(列表+哈希):索引:建立NON-PREFIX LOCAL 索引" 0
drop table accounts
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
create index "idx_account" on accounts (id) local
/

tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/
select table_name,partitioning_type,locality,ALIGNMENT from user_part_indexes where index_name='idx_account'
/

case 414 "组合表(列表+哈希):索引:删除NON-PREFIX LOCAL 索引" 0
drop table accounts
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
create index "idx_account" on accounts (id) local
/
drop index "idx_account"
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/

case 415 "组合表(列表+哈希):索引:建立PREFIX LOCAL 索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id) local
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/
select table_name,partitioning_type,locality,ALIGNMENT from user_part_indexes where index_name='idx_account'
/

case 416 "组合表(列表+哈希):索引:删除PREFIX LOCAL 索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id) local
/
drop index "idx_account"
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/

case 417 "组合表(列表+哈希):索引:建立全局范围索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id) global
partition by range(customer_id)
( partition p1 values less than (2000) 
, partition p2 values less than (maxvalue)
);
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/
select table_name,partitioning_type,locality,ALIGNMENT from user_part_indexes where index_name='idx_account'
/

case 418 "组合表(列表+哈希):索引:删除全局范围索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id) global
partition by range(customer_id)
( partition p1 values less than (2000) 
, partition p2 values less than (maxvalue)
);
/
drop index "idx_account"
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/

 case 419 "组合表(列表+HASH): 索引：建立全局HASH索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id) global
partition by hash(customer_id)
( partition p1 
, partition p2 
);
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/
select table_name,partitioning_type,locality,ALIGNMENT from user_part_indexes where index_name='idx_account'
/

case 420 "组合表(列表+HASH): 索引：删除全局HASH索引" 0
drop table accounts
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
create index "idx_account" on accounts (customer_id) global
partition by hash(customer_id)
( partition p1 
, partition p2 
)
/
drop index "idx_account"
/
tgt_sql:
select count(*) from user_indexes where index_name='idx_account'
/
select table_name,partitioning_type,locality,ALIGNMENT from user_part_indexes where index_name='idx_account'
/

case 421 "组合表(列表+哈希):普通索引：增加分区" 0
drop table accounts
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
create index "idx_account" on accounts (id)
/
alter table accounts add partition p_add values ('KK', 'TT')
/
alter index "idx_account" rebuild
/

tgt_sql:
select count(*) from user_objects where object_name='ACCOUNTS' and object_type='TABLE PARTITION'
/
select * from accounts
/

case 422 "组合表(列表+哈希):普通索引：增加子分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
alter table accounts modify partition p_northwest add subpartition p1_sub3
/
alter index "idx_account" rebuild
/

tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/

case 4221 "组合表(列表+哈希):普通索引：删除分区" 0
drop table accounts
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
create index "idx_account" on accounts (id)
/
alter table accounts add partition p_add values ('KK', 'TT')
/
alter index "idx_account" rebuild
/
alter table accounts drop partition p_add
/
alter index "idx_account" rebuild
/

tgt_sql:
select count(*) from user_objects where object_name='ACCOUNTS' and object_type='TABLE PARTITION'
/
select * from accounts
/

case 423 "组合表(列表+哈希):普通索引：有数据：建表" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/

tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts
/

case 424 "组合表(列表+哈希):普通索引：有数据：增加分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts add partition p_add values ('KK', 'TT')
/
alter index "idx_account" rebuild
/

tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts
/
select count(*) from user_objects where object_name='ACCOUNTS' and object_type='TABLE PARTITION'
/

case 425 "组合表(列表+哈希)普通索引：有数据：增加子分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts modify partition p_northwest add subpartition p1_sub3
/
alter index "idx_account" rebuild
/

tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts order by id
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/

case 426 "组合表(列表+哈希):普通索引：有数据：truncate分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter index "idx_account" rebuild
/
alter table accounts truncate partition p_other
/
alter index "idx_account" rebuild
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts order by id
/
select count(*) from user_objects where object_name='ACCOUNTS' and object_type='TABLE PARTITION'
/

case 427 "组合表(列表+哈希)普通索引：有数据：truncate子分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts truncate subpartition p1_sub1
/
alter index "idx_account" rebuild
/

tgt_sql:
SELECT count(*) from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/

case 428 "组合表(列表+哈希):普通索引：有数据：分区更名" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter index "idx_account" rebuild
/
alter table accounts rename partition p_northcentral to p_northcenter
/
alter index "idx_account" rebuild
/
tgt_sql:
SELECT count(*) from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS' and partition_name='P_NORTHCENTER'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/

case 429 "组合表(列表+哈希)普通索引：有数据：子分区更名" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts rename subpartition p1_sub1 to pa_sub1
/
alter index "idx_account" rebuild
/

tgt_sql:
SELECT count(*) from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS' and subpartition_name='PA_SUB1'
/

case 431 "组合表(列表+哈希)普通索引：有数据：移动子分区（相同表空间）建表" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/

tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts order by id
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/

case 432 "组合表(列表+哈希)普通索引：有数据：移动子分区（相同表空间）" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts move subpartition p2_sub1
/
alter index "idx_account" rebuild
/
tgt_sql:
SELECT count(*) from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select tablespace_name from user_tab_subpartitions where table_name='ACCOUNTS' and subpartition_name='P2_SUB1'
/

case 433 "组合表(列表+哈希)普通索引：有数据：移动子分区（不同表空间）" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts move subpartition p2_sub1 tablespace system
/
alter index "idx_account" rebuild
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts order by id
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select tablespace_name from user_tab_subpartitions where table_name='ACCOUNTS' and subpartition_name='P2_SUB1'
/

case 434 "组合表(列表+哈希)普通索引：有数据：合并分区：建表" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts order by id
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/


case 435 "组合表(列表+哈希)普通索引：有数据：合并分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts merge partitions p_northwest,p_southwest into partition p_west
/
alter index "idx_account" rebuild
/
tgt_sql:
SELECT count(*) from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS' and partition_name='P_WEST'
/

case 436 "组合表(列表+哈希)普通索引：有数据：合并分区(重用第一个分区名称)：建表" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
commit
/

tgt_sql:
SELECT count(*) from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/

case 437 "组合表(列表+哈希)普通索引：有数据：合并分区(重用第一个分区名称)" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id)
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts merge partitions p_northwest,p_southwest into partition p_southwest
/
alter index "idx_account" rebuild
/
tgt_sql:
SELECT count(*) from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS' and partition_name='P_SOUTHWEST'
/

 case 439 "组合表(列表+哈希:子分区模板)1LOCAL: 修改子分区模板" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list ( created )
subpartition by hash (oid)
subpartition template (
subpartition sub_table tablespace system,
subpartition sub_index TABLESPACE users,
subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" set subpartition template (
subpartition sub_table tablespace users,
subpartition sub_index tablespace system,
subpartition sub_view  tablespace users,
subpartition sub_other tablespace users
)
/
tgt_sql:
select count(*) from user_subpartition_templates where table_name='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=4
/

 case 440 "组合表(列表+哈希:子分区模板)1LOCAL: 增加分区" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list ( created )
subpartition by hash (oid)
subpartition template (
subpartition sub_table tablespace system,
subpartition sub_index TABLESPACE users,
subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" set subpartition template (
subpartition sub_table tablespace users,
subpartition sub_index tablespace system,
subpartition sub_view  tablespace users,
subpartition sub_other tablespace users
)
/
alter table "objects_type" add partition P5 values (to_date('2006-12-31','YYYY-MM-DD'))
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (otype) local
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P5'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P5'
/

 case 441 "组合表(列表+哈希:子分区模板)1LOCAL:删除分区" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list ( created )
subpartition by hash (oid)
subpartition template (
subpartition sub_table tablespace system,
subpartition sub_index TABLESPACE users,
subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" set subpartition template (
subpartition sub_table tablespace users,
subpartition sub_index tablespace system,
subpartition sub_view  tablespace users,
subpartition sub_other tablespace users
)
/
alter table "objects_type" add partition P5 values (to_date('2006-12-31','YYYY-MM-DD'))
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" drop partition P5
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (otype) local
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P5'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P5'
/

 case 442 "组合表(LIST+HASH)1LOCAL: 增加子分区" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" add partition p3 values ('ZZ') (
             subpartition p3_table1,
             subpartition p3_index1,
             subpartition p3_view1
)
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
alter table "objects_type" modify partition p1 add subpartition p1_sub3
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
update "objects_type" set reccount=reccount+1
/
commit
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_SUB3'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

 case 443 "组合表(LIST+HASH)1LOCAL: truncate子分区" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
insert into "objects_type" values (2,3,4,'MM')
/
alter table "objects_type" add partition p3 values ('ZZ') (
             subpartition p3_table1,
             subpartition p3_index1,
             subpartition p3_view1
)
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
alter table "objects_type" modify partition p1 add subpartition p1_sub3
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
update "objects_type" set reccount=reccount+1
/
alter table "objects_type" truncate partition p1
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
commit
/
tgt_sql:
select * from "objects_type" 
/

 case 444 "组合表(LIST+HASH)1LOCAL: 分区更名" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" rename partition p2 to p2_2
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
/
select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2_2'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

 case 445 "组合表(LIST+HASH)1LOCAL: 子分区更名" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" rename subpartition p2_sub1 to p2_sub_1
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
/
select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB_1'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/


 case 446 "组合表(LIST+HASH)1LOCAL: 移动子分区（相同表空间）：建表）" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
commit
/
tgt_sql:
select * from "objects_type"
/
          
 case 447 "组合表(LIST+HASH)1LOCAL: 移动子分区（相同表空间））" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" move subpartition p2_sub1
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
tgt_sql:
SELECT * from "objects_type"
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
/

 case 448 "组合表(LIST+HASH)1LOCAL: 移动子分区（不同表空间））" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" move subpartition p2_sub1 tablespace system
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
tgt_sql:
select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
/
select * from "objects_type"
/

 case 449 "组合表(LIST+HASH)1LOCAL: 合并分区：建表）" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
commit
/
tgt_sql:
select * from "objects_type"
/


 case 450 "组合表(LIST+HASH)1LOCAL: 合并分区）" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" merge partitions p1, p2 into partition p12
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
update "objects_type" set reccount=reccount+1
/
commit
/

tgt_sql:
SELECT * from "objects_type"
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type'
/


 case 451 "组合表(LIST+HASH)1LOCAL: 合并分区(重用第一个分区名称)）" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
tgt_sql:
select * from "objects_type"
/
alter table "objects_type" merge partitions p1, p2 into partition p2
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
update "objects_type" set reccount=reccount+1
/
commit
/

tgt_sql:
select * from "objects_type"
/
select count(*) from user_tab_partitions where table_name='objects_type'
/

case 452 "组合表(LIST+HASH:子分区模板)1LOCAL: 建表" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list  ( created )
subpartition by hash (oid)
subpartition template (
subpartition sub_table tablespace system,
subpartition sub_index TABLESPACE users,
subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_idx" on "objects_type" (otype) local
/
tgt_sql:
select count(*) from user_tables where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/

case 453 "组合表(LIST+HASH:子分区模板)1LOCAL:修改子分区模板" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list  ( created )
subpartition by hash (oid)
subpartition template (
subpartition sub_table tablespace system,
subpartition sub_index TABLESPACE users,
subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" set subpartition template (
                subpartition sub_table tablespace users,
                subpartition sub_index tablespace system,
                subpartition sub_view  tablespace users,
                subpartition sub_other tablespace users)
/                                
tgt_sql:
select count(*) from user_tables where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type'
/

case 454 "组合表(LIST+HASH:子分区模板)1LOCAL:增加分区" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list  ( created )
subpartition by hash (oid)
subpartition template (
subpartition sub_table tablespace system,
subpartition sub_index TABLESPACE users,
subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" add partition P5 values (to_date('2006-12-31','YYYY-MM-DD'))  
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (otype) local
/  
                          
tgt_sql:
select count(*) from user_tables where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type'
/

case 4541 "组合表(LIST+HASH:子分区模板)1LOCAL:删除分区" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list  ( created )
subpartition by hash (oid)
subpartition template (
subpartition sub_table tablespace system,
subpartition sub_index TABLESPACE users,
subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" drop partition P3 
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (otype) local
/  
                          
tgt_sql:
select count(*) from user_tables where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type'
/

case 455 "组合表(LIST+HASH)1LOCAL: 增加子分区" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
)
/
create index "objects_type_idx" on "objects_type" (objd) local
/
alter table "objects_type" add partition p3 values less than ('ZZ') (
             subpartition p3_table1,
             subpartition p3_index1,
             subpartition p3_view1
)
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (objd) local
/
commit
/
tgt_sql:
select count(*) from user_tables where table_name='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type'
/
case 456 "组合表(列表+哈希)1LOCAL：truncate分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/
alter table accounts truncate partition p_other
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts
/
select count(*) from user_objects where object_name='ACCOUNTS' and object_type='TABLE PARTITION'
/

case 457 "组合表(列表+哈希)普通索引：有数据：truncate子分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
insert into accounts values(1,11,111,1111,11111,'OR','A')
/
insert into accounts values(2,22,222,2222,22222,'WA','B')
/
insert into accounts values(3,33,333,3333,33333,'AZ','C')
/
insert into accounts values(4,44,444,4444,44444,'WD','D')
/
alter table accounts truncate subpartition p1_sub1
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<10 
/
insert into accounts values(5,55,555,5555,55555,'OR','E')
/
insert into accounts values(6,66,666,6666,66666,'WA','F')
/
commit
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/

tgt_sql:
SELECT count(*) from accounts
/
SELECT count(*) from accounts subpartition(p1_sub1)
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/

case 458 "组合表(列表+哈希):普通索引：有数据：分区更名" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/
alter table accounts rename partition p_northcentral to p_northcenter
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/

tgt_sql:
SELECT count(*) from accounts
/
SELECT count(*) from accounts partition(p_northcenter)
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS' and partition_name='P_NORTHCENTER'
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/


case 459 "组合表(列表+哈希)普通索引：有数据：子分区更名" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts rename subpartition p1_sub1 to pa_sub1
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/

tgt_sql:
SELECT count(*) from accounts
/
SELECT count(*) from accounts subpartition(pa_sub1)
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS' and subpartition_name='PA_SUB1'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/

case 469 "组合表(列表+哈希)1LOCAL：移动子分区（相同表空间）建表" 0
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/

tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/

case 470 "组合表(列表+哈希)1LOCAL：移动子分区（相同表空间）" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts move subpartition p2_sub1
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts order by id
/
SELECT count(*) from accounts subpartition(p2_sub1)
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select tablespace_name from user_tab_subpartitions where table_name='ACCOUNTS' and subpartition_name='P2_SUB1'
/

case 471 "组合表(列表+哈希)1LOCAL：移动子分区（不同表空间）" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts move subpartition p2_sub1 tablespace system
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select tablespace_name from user_tab_subpartitions where table_name='ACCOUNTS' and subpartition_name='P2_SUB1'
/

case 472 "组合表(列表+哈希)1LOCAL：合并分区：建表" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/


case 473 "组合表(列表+哈希)1LOCAL：合并分区" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts merge partitions p_northwest,p_southwest into partition p_west
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT count(*) from accounts
/
SELECT count(*) from accounts partition(p_west)
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/

case 474 "组合表(列表+哈希)1local：合并分区(重用第一个分区名称)：建表" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
commit
/

tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT * from accounts order by id
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/

case 475 "组合表(列表+哈希)1LOCAL：合并分区(重用第一个分区名称)" 0
drop table accounts
/
CREATE TABLE accounts
( id             NUMBER
, account_number NUMBER
, customer_id    NUMBER
, balance        NUMBER
, branch_id      NUMBER
, region         VARCHAR(20)
, status         VARCHAR2(20)
)
PARTITION BY LIST (region)
SUBPARTITION BY HASH (customer_id) SUBPARTITIONS 8
( PARTITION p_northwest VALUES ('OR', 'WA')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 )
, PARTITION p_southwest VALUES ('AZ', 'UT', 'NM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
, PARTITION p_northeast VALUES ('NY', 'VM', 'NJ')
, PARTITION p_southeast VALUES ('FL', 'GA')
, PARTITION p_northcentral VALUES ('SD', 'WI')
, PARTITION p_other VALUES (default)
)
/
create index "idx_account" on accounts (id) local 
/
insert into accounts select object_id, object_id+1000, object_id, object_id+1000, object_id, object_name ,object_type from dba_objects where rownum<20 
/
alter table accounts merge partitions p_northwest,p_southwest into partition p_southwest
/
drop index "idx_account" 
/
create index "idx_account" on accounts (id) local 
/
tgt_sql:
select count(*) from user_tables where table_name = 'ACCOUNTS'
/
SELECT count(*) from accounts
/
SELECT count(*) from accounts partition(p_southwest)
/
select cname||coltype||width||scale||precision from col where tname='ACCOUNTS' order by cname
/
select count(*) from user_tab_partitions where table_name='ACCOUNTS'
/
select count(*) from user_tab_subpartitions where table_name='ACCOUNTS'
/

 case 476 "组合表(LIST+HASH:子分区模板)1普1LOCAL: 建表" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list ( created )
subpartition by hash (oid)
subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_IDX" on "objects_type" (oid)
/
create index "objects_type_idx" on "objects_type" (otype) local
/

tgt_sql:
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
/
select cname||coltype||width||scale||precision from col where tname='objects_type'
/

 case 477 "组合表(LIST+HASH:子分区模板)1普1LOCAL: 修改子分区模板" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list ( created )
subpartition by hash (oid)
subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/
create index "objects_type_IDX" on "objects_type" (oid)
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" set subpartition template (
                subpartition sub_table tablespace users,
                subpartition sub_index tablespace system,
                subpartition sub_view  tablespace users,
                subpartition sub_other tablespace users
          )
/          


tgt_sql:
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
/
select cname||coltype||width||scale||precision from col where tname='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type'
/

 case 478 "组合表(LIST+HASH:子分区模板)1普1LOCAL: 增加分区" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list ( created )
subpartition by hash (oid)
subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/    
create index "objects_type_IDX" on "objects_type" (oid)
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" add partition P5 values (to_date('2006-12-31','YYYY-MM-DD'))
/  
alter index "objects_type_IDX" rebuild
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (otype) local
/
tgt_sql:
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
/
select cname||coltype||width||scale||precision from col where tname='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type'
/

 case 4781 "组合表(LIST+HASH:子分区模板)1普1LOCAL: 删除分区" 0
drop table "objects_type"
/
create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
partition by list ( created )
subpartition by hash (oid)
subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values (to_date('2005-12-31','YYYY-MM-DD'))
           )
/    
create index "objects_type_IDX" on "objects_type" (oid)
/
create index "objects_type_idx" on "objects_type" (otype) local
/
alter table "objects_type" drop partition P3 
/  
alter index "objects_type_IDX" rebuild
/
drop index "objects_type_idx"
/
create index "objects_type_idx" on "objects_type" (otype) local
/
tgt_sql:
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
/
select cname||coltype||width||scale||precision from col where tname='objects_type'
/
select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type'
/


 case 479 "组合表(LIST+HASH)1普1LOCAL: 有数据：增加分区" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" add partition p3 values ('ZZ') (
             subpartition p3_table1,
             subpartition p3_index1,
             subpartition p3_view1
)
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

 case 480 "组合表(LIST+HASH)1普1LOCAL: 有数据：增加子分区" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" modify partition p1 add subpartition p1_sub3
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select * from "objects_type"
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/


 case 481 "组合表(LIST+HASH)1普1LOCAL: 有数据：分区更名" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" rename partition p2 to p2_2
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select * from "objects_type"
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

 case 4810 "组合表(LIST+HASH)1普1LOCAL: 有数据：子分区更名" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" rename subpartition p2_sub1 to p2_sub_1
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select * from "objects_type"
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

 case 4811 "组合表(LIST+HASH)1普1LOCAL: 有数据：移动子分区（相同表空间）" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" move subpartition p1_sub1
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select * from "objects_type"
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

 case 482 "组合表(LIST+HASH)1普1LOCAL: 有数据：移动子分区（不同表空间）" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" move subpartition p1_sub1 tablespace system
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select * from "objects_type"
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

 case 483 "组合表(LIST+HASH)1普1LOCAL:有数据:合并分区" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" merge partitions p1, p2 into partition p12
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select * from "objects_type"
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

case 484 "组合表(列表+哈希):1普1LOCAL:分裂分区" 0
drop table objects
/
create table objects ( object_id NUMBER,objn number, objd number, object_type VARCHAR2(19) ) 
PARTITION BY LIST ( object_type ) 
subpartition by hash (object_id)              
            (   partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
/
create index "objects_type_idx" on objects (objn) 
/
create index "objects_type_IDX" on objects (objd) local
/
ALTER TABLE objects SPLIT PARTITION type_tab_idx VALUES ('TABLE') INTO (
                  PARTITION type_table TABLESPACE users,
                  PARTITION type_index TABLESPACE system  )
/    
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on objects (objd) local
/
alter index "objects_type_idx" rebuild
/

tgt_sql:
select count(*) from user_tab_subpartitions where table_name='OBJECTS'
/
select count(*) from user_tab_partitions where table_name='OBJECTS'
/

case 485 "组合表(LIST+HASH)1普1LOCAL:有数据:合并分区(重用第一个分区名称)" 0
drop table "objects_type"
/
create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
partition by list ( nm )
subpartition by hash (objn)
(           partition p1 values ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
            partition p2 values ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )  
)
/
create index "objects_type_idx" on "objects_type" (objn) 
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
insert into "objects_type" values (1,2,3,'HH')
/
alter table "objects_type" merge partitions p1, p2 into partition p1
/
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on "objects_type" (objd) local
/
alter index "objects_type_idx" rebuild
/
tgt_sql:
select count(*) from user_tab_partitions where table_name='objects_type'
/
select * from "objects_type"
/
select count(*) from user_tab_subpartitions where table_name='objects_type'
/
select count(*) from user_tab_partitions where table_name='objects_type'
/
select count(*) from "objects_type"
/
select to_char(sum(reccount)) from "objects_type"
/

case 4841 "组合表(列表+哈希): 1普1LOCAL：分裂分区(重用分区名称)" 0
drop table objects
/
create table objects ( object_id NUMBER,objn number, objd number, object_type VARCHAR2(19) ) 
PARTITION BY LIST ( object_type ) 
subpartition by hash (object_id)              
            (   partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
/
create index "objects_type_idx" on objects (objn) 
/
create index "objects_type_IDX" on objects (objd) local
/
ALTER TABLE objects SPLIT PARTITION type_tab_idx VALUES ('TABLE') INTO (
                  PARTITION type_tab_idx  TABLESPACE users,
                  PARTITION type_index TABLESPACE system  )
/    
drop index "objects_type_IDX"
/
create index "objects_type_IDX" on objects (objd) local
/
alter index "objects_type_idx" rebuild
/

tgt_sql:
select count(*) from user_tab_partitions where table_name= 'OBJECTS'
/
select * from objects
/
select count(*) from user_tab_subpartitions where table_name='OBJECTS'
/
select count(*) from user_tab_partitions where table_name='OBJECTS'
/
select count(*) from objects
/


 case 4851 "组合表(列表+哈希): 1普1LOCAL :交换分区" 0
drop table objects
/
drop table swap_t
/
create table objects ( object_id NUMBER, objn number, objd number,object_type VARCHAR2(19) )
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
create index "objects_type_idx" on objects (objn) 
/
create index "objects_type_IDX" on objects (objd) local
/
ALTER TABLE objects ADD PARTITION type_package VALUES ( 'PACKAGE', 'PACKAGE BODY' )
/
ALTER TABLE objects DROP PARTITION type_null
/
INSERT INTO objects SELECT object_id, object_id+2,object_id+2, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
/
CREATE TABLE swap_t ( object_id NUMBER, objn number, objd number, object_type VARCHAR2(19) )
partition by hash ( object_id ) 
/
INSERT INTO objects SELECT object_id+120,object_id+12,object_id+20, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
/
ALTER TABLE objects EXCHANGE PARTITION type_table WITH TABLE swap_t
/

drop index "objects_type_IDX"
/
create index "objects_type_IDX" on objects (objd) local
/
alter index "objects_type_idx" rebuild
/

tgt_sql:
select count(*) from user_tab_partitions where table_name= 'OBJECTS'
/
select * from objects
/
select count(*) from user_tab_subpartitions where table_name='OBJECTS'
/
select count(*) from user_tab_partitions where table_name='OBJECTS'
/
select count(*) from objects
/






























