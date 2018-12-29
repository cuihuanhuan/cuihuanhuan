
case 29 "组合表(LIST+RANGE)：索引测试：建表" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/
commit
/
              
tgt_sql:
select tname,cname,coltype,width from col where tname = 'OBJECT_TYPE'
/
select count(*) from user_tab_partitions where table_name = 'OBJECT_TYPE'
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE'
/
select * from object_type order by obid
/

case 30 "组合表(LIST+RANGE)：索引测试：普通索引建立" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(objn)
/            
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/

case 31 "组合表(LIST+RANGE)：索引测试：普通索引删除" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(objn)
/  
drop index idx_object
/          
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/

case 32 "组合表(LIST+RANGE)：索引测试：Non-Prefix-Local 建立" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(objn) local
/         
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/

case 33 "组合表(LIST+RANGE)：索引测试：Non-Prefix-Local 删除" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(objn) local
/  
drop index idx_object
/       
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/

case 34 "组合表(LIST+RANGE)：索引测试：Prefix-Local 建立" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(obsp) local
/         
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/
select * from object_type order by obid
/


case 35 "组合表(LIST+RANGE)：索引测试：Preefix-Local 删除" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(obsp) local
/  
drop index idx_object
/       
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/
select * from object_type order by obid
/

case 36 "组合表(LIST+RANGE)：索引测试：建立全局范围索引" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(obsp) global
/         
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/
select * from object_type order by obid
/

case 37 "组合表(LIST+RANGE)：索引测试：删除全局范围索引" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(obsp) global
/  
drop index idx_object
/       
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/
select * from object_type order by obid
/

case 38 "组合表(LIST+RANGE)：索引测试：建立全局list索引" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(obtp) global
/         
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/
select * from object_type order by obid
/

case 39 "组合表(LIST+RANGE)：索引测试：删除全局list索引" 0
drop table object_type
/
drop index idx_object
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
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/  
create index idx_object on object_type(obtp) global
/  
drop index idx_object
/       
tgt_sql:
select count(*) from user_indexes where index_name='IDX_OBJECT'
/
select * from object_type order by obid
/

case 391 "组合表(LIST+RANGE模板:1普索引)：建表(指定子分区模板)" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type(obid) 
/ 
tgt_sql:
select tname,cname,coltype,width from col where tname = 'OBJECT_TYPE' order by cname 
/
select count(*) from user_tab_partitions where table_name = 'OBJECT_TYPE'
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 40 "组合表(LIST+RANGE模板:1普索引:指定子分区模板)：增加分区" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type(obid) 
/ 
alter table object_type add partition P5 values ('PROCEDURE')
/
tgt_sql:
select tname,cname,coltype,width from col where tname = 'OBJECT_TYPE' order by cname 
/
select count(*) from user_tab_partitions where table_name = 'OBJECT_TYPE'
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 41 "组合表(LIST+RANGE模板:1普索引:指定子分区模板)：删除分区" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type(obid) 
/ 
alter table object_type drop partition P3 
/
tgt_sql:
select tname,cname,coltype,width from col where tname = 'OBJECT_TYPE' order by cname 
/
select count(*) from user_tab_partitions where table_name = 'OBJECT_TYPE'
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 42 "组合表(LIST+RANGE模板:1普索引:指定子分区模板)：修改子分区模板" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type(obid) 
/ 
alter table object_type set subpartition template(
                                                    subpartition p_sub1 values less than ('2'),
                                                    subpartition p_sub2 values less than ('4'),
                                                    subpartition p_sub3 values less than ('6')
                                                  )                                                       
/
tgt_sql:
select tname,cname,coltype,width from col where tname = 'OBJECT_TYPE' order by cname 
/
select count(*) from user_tab_partitions where table_name = 'OBJECT_TYPE'
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 43 "组合表(LIST+RANGE:1普索引)：建表" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 44 "组合表(LIST+RANGE:1LOCAL索引)：增加分区" 0
drop table object_type
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
create index idx_object on object_type (obid) 
/
alter table object_type add partition P5 values ('PROCEDURE')
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 45 "组合表(LIST+RANGE:1普索引)：增加子分区" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
alter table object_type modify partition P1 add subpartition p1_sub3 values less than ('8')
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P1_SUB3'
/

case 46 "组合表(LIST+RANGE:1普索引)：删除分区" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
alter table object_type drop partition P3
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 47 "组合表(LIST+RANGE:1普索引)：删除子分区" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
alter table object_type drop subpartition p1_sub1
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P1_SUB1'
/

case 461 "组合表(LIST+RANGE:1普索引)：交换分区" 0
drop table object_type
/
drop table swap_t
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
create index idx_object on object_type(obid) 
/
create table swap_t (obid number,objn number, obtp varchar(20),obsp number )
partition by range (obsp)(partition p1 values less than ('3'),
                          partition p2 values less than ('5')
                         )
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into swap_t values (2,2,'TABLE','2')
/
insert into swap_t values (2,4,'TABLE','4')
/
alter table object_type exchange partition p1 with table swap_t
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/

case 471 "组合表(LIST+RANGE:1普索引)：交换子分区" 0
drop table object_type
/
drop table swap_t
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
create index idx_object on object_type(obid) 
/
create table swap_t as select * from object_type where 1=0         
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into swap_t values (2,5,'TABLE','2')
/
alter table object_type exchange subpartition p1_sub1 with table swap_t
/
update object_type set obid=obid+100
/
update swap_t set obid=obid+200
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/

case 48 "组合表(LIST+RANGE:1普索引)：合并分区(2个分区均有数据)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 49 "组合表(LIST+RANGE:1普索引)：SPILT分区(2个分区均有数据)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'FUNCTION','2')
/
insert into object_type values (1,4,'FUNCTION','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p41 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/                  
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 50 "组合表(LIST+RANGE:1普索引)：合并分区(第一个分区均有数据分区名称重用):建表" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
commit
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 51 "组合表(LIST+RANGE:1普索引)：合并分区(第一个分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
alter table object_type merge partitions p1,p2 into partition p1
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 52 "组合表(LIST+RANGE:1普索引)：SPILT分区(第一分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p4 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/    
alter index idx_object rebuild
/              
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 53 "组合表(LIST+RANGE:1普索引)：合并分区(第一个分区有数据：分区名称不重用):建表" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
commit
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 54 "组合表(LIST+RANGE:1普索引)：合并分区(第一个分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
alter index idx_object rebuild
/

tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 55 "组合表(LIST+RANGE:1普索引)：SPILT分区(第一分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','2')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p43 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/                  
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 56 "组合表(LIST+RANGE:1普索引)：合并分区(第二个分区有数据：分区名称重用):建表" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
commit
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 57 "组合表(LIST+RANGE:1普索引)：合并分区(第二个分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p2
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 58 "组合表(LIST+RANGE:1普索引)：SPILT分区(第二分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p4 TABLESPACE system  )
/   
alter index idx_object rebuild
/               
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 59 "组合表(LIST+RANGE:1普索引)：合并分区(第二个分区有数据：分区名称不重用):建表" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
commit
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 60 "组合表(LIST+RANGE:1普索引)：合并分区(第二个分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (2,4,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
alter index idx_object rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 61 "组合表(LIST+RANGE:1普索引)：SPILT分区(第二分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p41 TABLESPACE system  )
/
alter index idx_object rebuild
/                  
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 62 "组合表(LIST+RANGE:1普索引)：分区改名" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/ 
alter table object_type rename partition p1 to p4_4
/  
alter index idx_object rebuild
/            
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 63 "组合表(LIST+RANGE:1普索引)：子分区改名" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/ 
alter table object_type rename subpartition p1_sub1 to p_4
/   
alter index idx_object rebuild
/           
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P_4'
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 64 "组合表(LIST+RANGE:1普索引)：子分区truncate" 0
drop table object_type
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
create index idx_object on object_type(obid) 
/
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/ 
alter table object_type truncate subpartition p1_sub2
/  
alter index idx_object rebuild
/            
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from object_type
/

case 65 "组合表(LIST+RANGE模板:1LOCAL索引)：建表(指定子分区模板)" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 66 "组合表(LIST+RANGE模板:1LOCAL索引)：增加分区" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type (obtp) local 
/
alter table object_type add partition P5 values ('PROCEDURE')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 67 "组合表(LIST+RANGE模板:1LOCAL索引)：删除分区" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type (obtp) local 
/
alter table object_type drop partition P3 
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 68 "组合表(LIST+RANGE模板:1LOCAL索引)：修改子分区模板" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type (obtp) local 
/
alter table object_type set subpartition template(
                                                    subpartition p_sub1 values less than ('2'),
                                                    subpartition p_sub2 values less than ('4'),
                                                    subpartition p_sub3 values less than ('6')
                                                  )                                                       
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 651 "组合表(LIST+RANGE:1LOCAL索引)：建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 661 "组合表(LIST+RANGE:1LOCAL索引)：增加分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
alter table object_type add partition P5 values ('PROCEDURE')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 671 "组合表(LIST+RANGE:1LOCAL索引)：增加子分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
alter table object_type modify partition P1 add subpartition p1_sub3 values less than ('8')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P1_SUB3'
/

case 681 "组合表(LIST+RANGE:1LOCAL索引)：删除分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
alter table object_type drop partition P3
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 69 "组合表(LIST+RANGE:1LOCAL索引)：删除子分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
alter table object_type drop subpartition p1_sub1
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P1_SUB1'
/

case 70 "组合表(LIST+RANGE:1LOCAL索引)：交换分区" 0
drop table object_type
/
drop table swap_t
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
create index idx_object on object_type (obtp) local 
/
create table swap_t (obid number,objn number, obtp varchar(20),obsp number )
partition by range (obsp)(partition p1 values less than ('3'),
                          partition p2 values less than ('5')
                         )
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into swap_t values (2,2,'TABLE','2')
/
insert into swap_t values (2,4,'TABLE','4')
/
alter table object_type exchange partition p1 with table swap_t
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/

case 71 "组合表(LIST+RANGE:1LOCAL索引)：交换子分区" 0
drop table object_type
/
drop table swap_t
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
create table swap_t as select * from object_type where 1=0         
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into swap_t values (2,5,'TABLE','2')
/
alter table object_type exchange subpartition p1_sub1 with table swap_t
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
update object_type set obid=obid+100
/
update swap_t set obid=obid+200
/
commit
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/

case 72 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(2个分区均有数据)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 73 "组合表(LIST+RANGE:1LOCAL索引)：SPILT分区(2个分区均有数据)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'FUNCTION','2')
/
insert into object_type values (1,4,'FUNCTION','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p41 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/                  
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 74 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第一个分区均有数据分区名称重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 75 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第一个分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
alter table object_type merge partitions p1,p2 into partition p1
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 76 "组合表(LIST+RANGE:1LOCAL索引)：SPILT分区(第一分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p4 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/  
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/                
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 77 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第一个分区有数据：分区名称不重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
commit
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 78 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第一个分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 79 "组合表(LIST+RANGE:1LOCAL索引)：SPILT分区(第一分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','2')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p43 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/          
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/        
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 80 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第二个分区有数据：分区名称重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 81 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第二个分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (1,4,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p2
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 82 "组合表(LIST+RANGE:1LOCAL索引)：SPILT分区(第二分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p4 TABLESPACE system  )
/     
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/             
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 83 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第二个分区有数据：分区名称不重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 84 "组合表(LIST+RANGE:1LOCAL索引)：合并分区(第二个分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (1,4,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 85 "组合表(LIST+RANGE:1LOCAL索引)：SPILT分区(第二分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p41 TABLESPACE system  )
/ 
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/                 
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 86 "组合表(LIST+RANGE:1LOCAL索引)：分区改名" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/ 
alter table object_type rename partition p1 to p4_4
/   
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/           
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 87 "组合表(LIST+RANGE:1LOCAL索引)：子分区改名" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/ 
alter table object_type rename subpartition p1_sub1 to p_4
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/              
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P_4'
/
select * from object_type order by obid
/

case 88 "组合表(LIST+RANGE:1LOCAL索引)：子分区truncate" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/ 
alter table object_type truncate subpartition p1_sub2
/ 
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/             
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 89 "组合表(LIST+RANGE模板:1LOCAL索引+1普)：建表(指定子分区模板)" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 90 "组合表(LIST+RANGE模板:1LOCAL索引+1普)：增加分区" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
alter table object_type add partition P5 values ('PROCEDURE')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 91 "组合表(LIST+RANGE模板:1LOCAL索引+1普)：删除分区" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
alter table object_type drop partition P3 
/
alter index idx_obj rebuild
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 92 "组合表(LIST+RANGE模板:1LOCAL索引+1普)：修改子分区模板" 0
drop table object_type
/
create table object_type (obid number,objn number, obtp varchar(20),obsp number )
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
create index idx_obj on object_type (objn)  
/
create index idx_object on object_type (obtp) local 
/
alter table object_type set subpartition template(
                                                    subpartition p_sub1 values less than ('2'),
                                                    subpartition p_sub2 values less than ('4'),
                                                    subpartition p_sub3 values less than ('6')
                                                  )                                                       
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select subpartition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by subpartition_name
/
select subpartition_name,high_bound from user_subpartition_templates where table_name='OBJECT_TYPE'
/

case 93 "组合表(LIST+RANGE:1LOCAL索引+1普)：建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local
/
create index idx_obj on object_type (objn)  
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 94 "组合表(LIST+RANGE:1LOCAL索引+1普)：增加分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
alter table object_type add partition P5 values ('PROCEDURE')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/


case 95 "组合表(LIST+RANGE:1LOCAL索引+1普)：增加子分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
alter table object_type modify partition P1 add subpartition p1_sub3 values less than ('8')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P1_SUB3'
/

case 96 "组合表(LIST+RANGE:1LOCAL索引+1普)：删除分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
alter table object_type drop partition P3
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/

case 97 "组合表(LIST+RANGE:1LOCAL索引+1普)：删除子分区" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
alter table object_type drop subpartition p1_sub1
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P1_SUB1'
/

case 98 "组合表(LIST+RANGE:1LOCAL索引+1普)：交换分区" 0
drop table object_type
/
drop table swap_t
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
create index idx_object on object_type (obtp) local 
/
create table swap_t (obid number,objn number, obtp varchar(20),obsp number )
partition by range (obsp)(partition p1 values less than ('3'),
                          partition p2 values less than ('5')
                         )
/
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','4')
/
insert into swap_t values (3,2,'TABLE','2')
/
insert into swap_t values (4,4,'TABLE','4')
/
alter table object_type exchange partition p1 with table swap_t
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/

case 99 "组合表(LIST+RANGE:1LOCAL索引+1普)：交换子分区" 0
drop table object_type
/
drop table swap_t
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
create index idx_object on object_type (obtp) local
/
create table swap_t as select * from object_type where 1=0         
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into swap_t values (2,5,'TABLE','2')
/
alter table object_type exchange subpartition p1_sub1 with table swap_t
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
update object_type set obid=obid+100
/
update swap_t set obid=obid+200
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
select * from swap_t order by obid
/


case 100 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(2个分区均有数据)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 101 "组合表(LIST+RANGE:1LOCAL索引+1普)：SPILT分区(2个分区均有数据)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'FUNCTION','2')
/
insert into object_type values (1,4,'FUNCTION','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p41 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/                  
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 102 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第一个分区均有数据分区名称重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 103 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第一个分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
alter table object_type merge partitions p1,p2 into partition p1
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 104 "组合表(LIST+RANGE:1LOCAL索引+1普)：SPILT分区(第一分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p4 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/  
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/  
alter index idx_obj rebuild
/              
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 105 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第一个分区有数据：分区名称不重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 106 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第一个分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 107 "组合表(LIST+RANGE:1LOCAL索引+1普)：SPILT分区(第一分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
insert into object_type values (22,25,'FUNCTION','2')
/
insert into object_type values (24,29,'FUNCTION','2')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p43 TABLESPACE users,
                                                            PARTITION p42 TABLESPACE system  )
/          
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/  
alter index idx_obj rebuild
/      
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 108 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第二个分区有数据：分区名称重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (1,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 109 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第二个分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (1,4,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p2
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 110 "组合表(LIST+RANGE:1LOCAL索引+1普)：SPILT分区(第二分区有数据：分区名称重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p4 TABLESPACE system  )
/     
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/             
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 111 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第二个分区有数据：分区名称不重用):建表" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'TABLE','2')
/
insert into object_type values (2,4,'TABLE','2')
/
insert into object_type values (22,25,'INDEX','2')
/
insert into object_type values (24,29,'INDEX','4')
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 112 "组合表(LIST+RANGE:1LOCAL索引+1普)：合并分区(第二个分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (1,2,'INDEX','2')
/
insert into object_type values (1,4,'INDEX','4')
/
alter table object_type merge partitions p1,p2 into partition p12
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/
alter index idx_obj rebuild
/
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/

case 113 "组合表(LIST+RANGE:1LOCAL索引+1普)：SPILT分区(第二分区有数据：分区名称不重用)" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/
alter table object_type split partition p4 values ('FUNCTION') into (
                                                            PARTITION p42 TABLESPACE users,
                                                            PARTITION p41 TABLESPACE system  )
/ 
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/    
alter index idx_obj rebuild
/             
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 114 "组合表(LIST+RANGE:1LOCAL索引+1普)：分区改名" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/ 
alter table object_type rename partition p1 to p4_4
/   
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/  
alter index idx_obj rebuild
/         
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/


case 115 "组合表(LIST+RANGE:1LOCAL索引+1普)：子分区改名" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (22,25,'FUNCTION','4')
/
insert into object_type values (24,29,'FUNCTION','4')
/ 
alter table object_type rename subpartition p1_sub1 to p_4
/
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/  
alter index idx_obj rebuild
/            
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select count(*) from user_tab_subpartitions where table_name = 'OBJECT_TYPE' and subpartition_name='P_4'
/
select * from object_type order by obid
/


case 116 "组合表(LIST+RANGE:1LOCAL索引+1普)：子分区truncate" 0
drop table object_type
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
create index idx_object on object_type (obtp) local 
/
create index idx_obj on object_type (objn)  
/
insert into object_type values (22,25,'TABLE','4')
/
insert into object_type values (24,29,'TABLE','4')
/ 
alter table object_type truncate partition p1
/ 
drop index idx_object
/
create index idx_object on object_type (obtp) local 
/  
alter index idx_obj rebuild
/           
tgt_sql:
select partition_name,high_value from user_tab_partitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name = 'OBJECT_TYPE' order by partition_name
/
select * from object_type order by obid
/
