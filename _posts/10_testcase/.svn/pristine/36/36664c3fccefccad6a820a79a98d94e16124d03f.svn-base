case 601 "组合表(LIST+RANGE模板)：建表(指定子分区模板)" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)
subpartition template (subpartition p_sub1 values less than ('3'),
                       subpartition p_sub2 values less than ('5')
                       )                       
(partition p1 values ('TABLE')
,partition p2 values ('INDEX')
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from object_type order by obid
/


case 602 "组合表(LIST+RANGE模板)：增加分区" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)
subpartition template (subpartition p_sub1 values less than ('3'),
                       subpartition p_sub2 values less than ('5')
                       )                       
(partition p1 values ('TABLE')
,partition p2 values ('INDEX')
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
commit
/
alter table object_type add partition P5 values ('PROCEDURE')
/
insert into object_type values (5,5,'PROCEDURE','4')
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from object_type order by obid
/


case 603 "组合表(LIST+RANGE模板)：删除分区" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)
subpartition template (subpartition p_sub1 values less than ('3'),
                       subpartition p_sub2 values less than ('5')
                       )                       
(partition p1 values ('TABLE')
,partition p2 values ('INDEX')
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
insert into object_type values (5,2,'SEQUENCE','2')
/
insert into object_type values (6,4,'SEQUENCE','4')
/
commit
/
alter table object_type drop partition P3 
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from object_type order by obid
/


case 604 "组合表(LIST+RANGE模板)：修改子分区模板" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)
subpartition template (subpartition p_sub1 values less than ('3'),
                       subpartition p_sub2 values less than ('5')
                       )                       
(partition p1 values ('TABLE')
,partition p2 values ('INDEX')
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
insert into object_type values (5,2,'SEQUENCE','2')
/
commit
/
alter table object_type set subpartition template(
                                                    subpartition p_sub1 values less than ('2'),
                                                    subpartition p_sub2 values less than ('4'),
                                                    subpartition p_sub3 values less than ('6')
                                                  )                                                       
/
alter table object_type add partition P5 values ('PROCEDURE')
/
insert into object_type values (6,4,'PROCEDURE','4')
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from object_type order by obid
/


case 605 "组合表(LIST+RANGE)：建表" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
insert into object_type values (5,2,'SEQUENCE','2')
/
insert into object_type values (6,4,'SEQUENCE','4')
/
update object_type set objn=objn+100 where obid>2
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 606 "组合表(LIST+RANGE)：增加分区" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
insert into object_type values (5,2,'SEQUENCE','2')
/
insert into object_type values (6,4,'SEQUENCE','4')
/
commit
/
alter table object_type add partition P5 values ('PROCEDURE')
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 607 "组合表(LIST+RANGE)：增加子分区" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
insert into object_type values (5,2,'SEQUENCE','2')
/
insert into object_type values (6,4,'SEQUENCE','4')
/
commit
/
alter table object_type modify partition P1 add subpartition p1_sub3 values less than ('8')
/
alter index pk_lr rebuild
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 608 "组合表(LIST+RANGE)：删除分区" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
insert into object_type values (5,2,'SEQUENCE','2')
/
insert into object_type values (6,4,'SEQUENCE','4')
/
commit
/
alter table object_type drop partition P3
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 609 "组合表(LIST+RANGE)：删除子分区" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (3,2,'INDEX','2')
/
insert into object_type values (4,4,'INDEX','4')
/
insert into object_type values (5,2,'SEQUENCE','2')
/
insert into object_type values (6,4,'SEQUENCE','4')
/
commit
/
alter table object_type drop subpartition p1_sub1
/
update object_type set objn=objn+100 where obid>2
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 610 "组合表(LIST+RANGE)：交换分区" 0
drop table object_type purge
/
drop table swap_t purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
create table swap_t (obid number ,objn number, obtp varchar(20),obsp number )
partition by range (obsp)(partition p1 values less than ('3'),
                          partition p2 values less than ('5')
                         )
/
alter table swap_t add constraint PK_obid_s primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
insert into swap_t values (10,2,'TABLE','2')
/
insert into swap_t values (20,4,'TABLE','4')
/
commit
/
alter table object_type exchange partition p1 with table swap_t
/
alter index pk_lr rebuild
/
alter index PK_obid_s rebuild
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
update swap_t set obid=obid+100 where obtp = 'TABLE'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('OBJECT_TYPE','SWAP_T') order by table_name,constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('OBJECT_TYPE','SWAP_T') order by table_name
/
select table_name,partition_name,high_value from user_tab_partitions where table_name in('OBJECT_TYPE','SWAP_T') order by table_name,partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/

case 611 "组合表(LIST+RANGE)：交换子分区" 0
drop table object_type purge
/
drop table swap_t purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
create table swap_t (obid number,objn number, obtp varchar(20),obsp number )      
/
alter table swap_t add constraint PK_obid_s primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (22,42,'SEQUENCE','4')
/
insert into swap_t values (10,5,'TABLE','2')
/
commit
/
alter table object_type exchange subpartition p1_sub1 with table swap_t
/
alter index pk_lr rebuild
/
alter index PK_obid_s rebuild
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/
update object_type set obid=obid+100 where obtp = 'SEQUENCE'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('OBJECT_TYPE','SWAP_T') order by table_name,constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('OBJECT_TYPE','SWAP_T') order by table_name
/
select table_name,partition_name,high_value from user_tab_partitions where table_name in('OBJECT_TYPE','SWAP_T') order by table_name,partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/

case 612 "组合表(LIST+RANGE)：合并分区(2个分区均有数据)" 0
drop table object_type purge
/
drop table swap_t purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
insert into object_type values (30,31,'SEQUENCE','2')
/
insert into object_type values (31,32,'SEQUENCE','4')
/
commit
/

alter table object_type merge partitions p1,p2 into partition p12
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'SEQUENCE'
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 613 "组合表(LIST+RANGE)：SPILT分区(2个分区均有数据)" 0
drop table object_type purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'SEQUENCE','2')
/
insert into object_type values (2,4,'SEQUENCE','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'TRIGGER','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p41 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/
alter index pk_lr rebuild
/                  
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
update object_type set obid=obid+100 where obtp = 'SEQUENCE'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 614 "组合表(LIST+RANGE)：合并分区(第一个分区均有数据分区名称重用):建表" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
update object_type set obid=obid+100 where obid>2
/
commit
/  
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 615 "组合表(LIST+RANGE)：合并分区(第一个分区有数据：分区名称重用)" 0
drop table object_type purge
/
create table object_type (obid number, objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (15,20,'SEQUENCE','2')
/
insert into object_type values (21,44,'SEQUENCE','4')
/
alter table object_type merge partitions p1,p2 into partition p1
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/
update object_type set obid=obid+100 where obtp = 'SEQUENCE'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 616 "组合表(LIST+RANGE)：SPILT分区(第一分区有数据：分区名称重用)" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER') TABLESPACE users                              
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'SEQUENCE','2')
/
insert into object_type values (2,4,'SEQUENCE','4')
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p4 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
update object_type set obid=obid+100 where obtp = 'SEQUENCE'
/
commit
/                
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 617 "组合表(LIST+RANGE)：合并分区(第一个分区有数据：分区名称不重用):建表" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 618 "组合表(LIST+RANGE)：合并分区(第一个分区有数据：分区名称不重用)" 0
drop table object_type purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (15,22,'SEQUENCE','2')
/
insert into object_type values (25,42,'SEQUENCE','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/
update object_type set obid=obid+100 where obtp = 'SEQUENCE'
/
commit
/ 

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 619 "组合表(LIST+RANGE)：SPILT分区(第一分区有数据：分区名称不重用)" 0
drop table object_type purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER') TABLESPACE users                              
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'SEQUENCE','2')
/
insert into object_type values (2,4,'SEQUENCE','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','4')
/
commit
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p43 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/ 
alter index pk_lr rebuild
/                 
update object_type set obid=obid+100 where obtp = 'SEQUENCE'
/
commit
/
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 620 "组合表(LIST+RANGE)：合并分区(第二个分区有数据：分区名称重用):建表" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','4')
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 621 "组合表(LIST+RANGE)：合并分区(第二个分区有数据：分区名称重用)" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','4')
/
commit
/
alter table object_type merge partitions p1,p2 into partition p2
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 622 "组合表(LIST+RANGE)：SPILT分区(第二分区有数据：分区名称重用)" 0
drop table object_type purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
insert into object_type values (22,25,'TRIGGER','4')
/
insert into object_type values (24,29,'TRIGGER','4')
/
commit
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p4 TABLESPACE system  )
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TRIGGER'
/
commit
/               
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 623 "组合表(LIST+RANGE)：合并分区(第二个分区有数据：分区名称不重用):建表" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
alter index pk_lr rebuild
/	
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 624 "组合表(LIST+RANGE)：合并分区(第二个分区有数据：分区名称不重用)" 0
drop table object_type purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                               
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 625 "组合表(LIST+RANGE)：SPILT分区(第二分区有数据：分区名称不重用)" 0
drop table object_type purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
insert into object_type values (22,25,'TRIGGER','4')
/
insert into object_type values (24,29,'TRIGGER','4')
/
commit
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p41 TABLESPACE system  )
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TRIGGER'
/
commit
/                   
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 626 "组合表(LIST+RANGE)：分区改名" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'TRIGGER','4')
/ 
alter table object_type rename partition p4 to p4_4
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/   
              
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 627 "组合表(LIST+RANGE)：子分区改名" 0
drop table object_type purge
/
create table object_type (obid number primary key,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/ 
commit
/
alter table object_type rename subpartition p1_sub1 to p_s1
/ 
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/              
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name='OBJECT_TYPE' and subpartition_name='P_S1'
/
select * from object_type order by obid
/

case 628 "组合表(LIST+RANGE)：分区truncate" 0
drop table object_type purge
/
create table object_type (obid number ,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/ 
insert into object_type values (22,25,'INDEX','4')
/
insert into object_type values (24,29,'INDEX','4')
/ 
commit
/ 
alter table object_type truncate partition p1
/
alter index pk_lr rebuild
/
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 629 "组合表(LIST+RANGE)：子分区truncate" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3'),
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'INDEX','2')
/ 
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'INDEX','4')
/ 
commit
/ 
alter table object_type truncate subpartition p1_sub2
/
alter index pk_lr rebuild
/ 
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 630 "组合表(LIST+RANGE)：移动第一个分区子分区，修改分区属性（相同表空间）" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3') tablespace users ,
                               subpartition p1_sub2 values less than ('5') tablespace users 
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'INDEX','2')
/ 
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'INDEX','4')
/ 
alter table object_type move SUBPARTITION p1_sub1 tablespace users
/
alter table object_type move SUBPARTITION p1_sub2 tablespace users
/
alter table object_type modify default ATTRIBUTES FOR PARTITION p1 tablespace users
/
alter index pk_lr rebuild
/ 
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 631 "组合表(LIST+RANGE)：移动第一个分区子分区，修改分区属性（不同表空间）" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3') tablespace users ,
                               subpartition p1_sub2 values less than ('5') tablespace users 
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3'),
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'INDEX','2')
/ 
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'INDEX','4')
/ 
alter table object_type move SUBPARTITION p1_sub1 tablespace system
/
alter table object_type move SUBPARTITION p1_sub2 tablespace system
/
alter table object_type modify default ATTRIBUTES FOR PARTITION p1 tablespace system
/
alter index pk_lr rebuild
/ 
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 632 "组合表(LIST+RANGE)：移动第二个分区子分区，修改分区属性（相同表空间）" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3')  ,
                               subpartition p1_sub2 values less than ('5') 
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3') tablespace users ,
                               subpartition p2_sub2 values less than ('5') tablespace users
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'INDEX','2')
/ 
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'INDEX','4')
/ 
alter table object_type move SUBPARTITION p2_sub1 tablespace users
/
alter table object_type move SUBPARTITION p2_sub2 tablespace users
/
alter table object_type modify default ATTRIBUTES FOR PARTITION p2 tablespace users
/
alter index pk_lr rebuild
/ 
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 633 "组合表(LIST+RANGE)：移动第二个分区子分区，修改分区属性（不同表空间）" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3') ,
                               subpartition p1_sub2 values less than ('5')
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3') tablespace users,
                               subpartition p2_sub2 values less than ('5') tablespace users
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')                             
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'INDEX','2')
/ 
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'INDEX','4')
/
commit
/
alter table object_type move SUBPARTITION p2_sub1 tablespace system
/
alter table object_type move SUBPARTITION p2_sub2 tablespace system
/
alter table object_type modify default ATTRIBUTES FOR PARTITION p2 tablespace system
/
alter index pk_lr rebuild
/ 
update object_type set obid=obid+100 where obtp = 'INDEX'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 634 "组合表(LIST+RANGE)：移动最后一个分区子分区，修改分区属性（相同表空间）" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3')  ,
                               subpartition p1_sub2 values less than ('5') 
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3')  ,
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')(subpartition p4_sub1 values less than ('3') tablespace users )                            
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'FUNCTION','2')
/ 
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TRIGGER','1')
/ 
alter table object_type move SUBPARTITION p4_sub1 tablespace users
/
alter table object_type modify default ATTRIBUTES FOR PARTITION p4 tablespace users
/
alter index pk_lr rebuild
/ 
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 635 "组合表(LIST+RANGE)：移动最后一个分区子分区，修改分区属性（不同表空间）" 0
drop table object_type purge
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
partition by list( obtp )
subpartition by range (obsp)                    
(partition p1 values ('TABLE')(subpartition p1_sub1 values less than ('3')  ,
                               subpartition p1_sub2 values less than ('5') 
                              ) 
,partition p2 values ('INDEX')(subpartition p2_sub1 values less than ('3')  ,
                               subpartition p2_sub2 values less than ('5')
                              ) 
,partition p3 values ('SEQUENCE','CLUSTER')
,partition p4 values ('FUNCTION','TRIGGER')(subpartition p4_sub1 values less than ('3') tablespace users )                            
)
/
alter table object_type add constraint pk_lr primary key (obid)
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'FUNCTION','2')
/ 
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TRIGGER','2')
/ 
commit
/
alter table object_type move SUBPARTITION p4_sub1 tablespace system
/
alter table object_type modify default ATTRIBUTES FOR PARTITION p4 tablespace system
/
alter index pk_lr rebuild
/ 
update object_type set obid=obid+100 where obtp = 'FUNCTION'
/
commit
/
update object_type set obid=obid+100 where obtp = 'TABLE'
/
commit
/             
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/







