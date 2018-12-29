
 case 518 "组合表(范围+列表): 索引测试：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /

 case 519 "组合表(范围+列表): 索引测试：普通索引建立" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "idx_objects_id" on "objects_type" ( oid )
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /

 case 520 "组合表(范围+列表): 索引测试：普通索引删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "idx_objects_id" on "objects_type" ( oid )
          /
          drop index "idx_objects_id"
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /

 case 521 "组合表(范围+列表): 索引测试：Non-Preefix-Local 建立" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "idx_objects_id_local" on "objects_type" ( oid ) local
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id_local'
          /
          select count(*) from user_ind_partitions where index_name='idx_objects_id_local'
          /
          select high_value from user_ind_partitions where index_name='idx_objects_id_local' and partition_position=1
          /
          select high_value from user_ind_partitions where index_name='idx_objects_id_local' and partition_position=2
          /
          select high_value from user_ind_partitions where index_name='idx_objects_id_local' and partition_position=3
          /
          select high_value from user_ind_partitions where index_name='idx_objects_id_local' and partition_position=4
          /

 case 522 "组合表(范围+列表): 索引测试：Non-Preefix-Local 删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "idx_objects_id_local" on "objects_type" ( oid ) local
          /
          drop index "idx_objects_id_local"
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id_local'
          /

 case 523 "组合表(范围+列表): 索引测试：Preefix-Local 建立" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "idx_objects_type_local" on "objects_type" ( otype ) local
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_type_local'
          /
          select count(*) from user_ind_partitions where index_name='idx_objects_type_local'
          /
          select high_value from user_ind_partitions where index_name='idx_objects_type_local' and partition_position=1
          /
          select high_value from user_ind_partitions where index_name='idx_objects_type_local' and partition_position=2
          /
          select high_value from user_ind_partitions where index_name='idx_objects_type_local' and partition_position=3
          /
          select high_value from user_ind_partitions where index_name='idx_objects_type_local' and partition_position=4
          /
          select count(*) from user_ind_subpartitions where index_name='idx_objects_type_local'
          /
          select high_value from user_ind_subpartitions where index_name='idx_objects_type_local' and partition_name='P1' and subpartition_position=1
          /
          select high_value from user_ind_subpartitions where index_name='idx_objects_type_local' and partition_name='P1' and subpartition_position=2
          /
          select high_value from user_ind_subpartitions where index_name='idx_objects_type_local' and partition_name='P2' and subpartition_position=1
          /
          select high_value from user_ind_subpartitions where index_name='idx_objects_type_local' and partition_name='P2' and subpartition_position=2
          /

 case 524 "组合表(范围+列表): 索引测试：Preefix-Local 删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "idx_objects_type_local" on "objects_type" ( otype ) local
          /
          drop index "idx_objects_type_local"
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_type_local'
          /

 case 525 "组合表(范围+列表): 索引测试：全局RANGE分区索引：建立" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "it_global_range" on "objects_type" ( otype ) global
              partition by  range ( otype ) (
                     partition pm1_ix VALUES LESS THAN ( 'INDEX' ) tablespace system,
                     partition pm2_ix VALUES LESS THAN ( 'TABLE' ) tablespace users,
                     partition pmm_ix VALUES LESS THAN ( MAXVALUE )
          )
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='it_global_range'
          /
          select count(*) from user_ind_partitions where index_name='it_global_range'
          /
          select high_value from user_ind_partitions where index_name='it_global_range' and partition_position=1
          /
          select high_value from user_ind_partitions where index_name='it_global_range' and partition_position=2
          /
          select high_value from user_ind_partitions where index_name='it_global_range' and partition_position=3
          /
          select tablespace_name from user_ind_partitions where index_name='it_global_range' and partition_position=1
          /
          select tablespace_name from user_ind_partitions where index_name='it_global_range' and partition_position=2
          /

 case 526 "组合表(范围+列表): 索引测试：全局RANGE分区索引：删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "it_global_range" on "objects_type" ( otype ) global
              partition by  range ( otype ) (
                     partition pm1_ix VALUES LESS THAN ( 'INDEX' ) tablespace system,
                     partition pm2_ix VALUES LESS THAN ( 'TABLE' ) tablespace users,
                     partition pmm_ix VALUES LESS THAN ( MAXVALUE )
          )
          /
          drop index "it_global_range"
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='it_global_range'
          /

 case 527 "组合表(范围+列表): 索引测试：全局 HASH 分区索引：建立" 0
      src_sql:
          drop index "it_global_hash"
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "it_global_hash" on "objects_type" ( otype ) global
              partition by hash ( otype ) (
                     partition pm1_ix tablespace system,
                     partition pm2_ix tablespace users,
                     partition pmm_ix
          )
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='it_global_hash'
          /
          select count(*) from user_ind_partitions where index_name='it_global_hash'
          /
          select tablespace_name from user_ind_partitions where index_name='it_global_hash' and partition_position=1
          /
          select tablespace_name from user_ind_partitions where index_name='it_global_hash' and partition_position=2
          /

 case 528 "组合表(范围+列表): 索引测试：全局 HASH 分区索引：删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "it_global_hash" on "objects_type" ( otype ) global
              partition by hash ( otype ) (
                     partition pm1_ix tablespace system,
                     partition pm2_ix tablespace users,
                     partition pmm_ix
          )
          /
          drop index "it_global_hash"
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='it_global_hash'
          /

 case 529 "组合表(范围+列表模板:1普索引): 建表(指定子分区模板)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=1
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=3
          /
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
          /
          select column_name from user_subpart_key_columns where name='objects_type' and object_type='TABLE'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_subpartition_templates where table_name='objects_type'
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /

 case 530 "组合表(范围+列表模板:1普索引): 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          alter table "objects_type" add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P4'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /

 case 531 "组合表(范围+列表模板:1普索引): 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          alter table "objects_type" drop partition P3
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          
 case 532 "组合表(范围+列表模板:1普索引): 修改子分区模板" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          alter table "objects_type" set subpartition template (
                subpartition sub_view  values('VIEW' ) tablespace system,
                subpartition sub_index values('INDEX') tablespace users,
                subpartition sub_table values('TABLE') tablespace system,
                subpartition sub_other values(DEFAULT) tablespace users
          )
          /
          
      tgt_sql:
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=4
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=4
          /

 case 533 "组合表(范围+列表:1普索引): 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=1
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=3
          /
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
          /
          select column_name from user_subpart_key_columns where name='objects_type' and object_type='TABLE'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_TABLE'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_INDEX'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P3_OTHER'
          /


 case 534 "组合表(范围+列表:1普索引): 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD')) (
             subpartition p5_table1 values ('TABLE'),
             subpartition p5_index1 values ('INDEX'),
             subpartition p5_view1  values ('VIEW')
          )
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
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P5'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P5' and subpartition_name='P5_TABLE1'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P5' and subpartition_name='P5_INDEX1'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P5' and subpartition_name='P5_VIEW1'
          /

 case 535 "组合表(范围+列表:1普索引): 增加子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          alter table "objects_type" modify partition p1 add subpartition p1_view values ('VIEW')
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /
          select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /

 case 536 "组合表(范围+列表:1普索引): 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          alter table "objects_type" drop partition p4
          /
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /


 case 537 "组合表(范围+列表:1普索引): 删除子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          alter table "objects_type" modify partition p1 add subpartition p1_view values ('VIEW')
          /
          alter table "objects_type" drop subpartition p1_view
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /

 case 538 "组合表(范围+列表:1普索引): 交换分区" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          create table swap_t ( oid number, otype varchar2(19), created date )
          partition by list ( otype ) (
                 partition type_table values ('TABLE'),
                 partition type_index values ('INDEX')
          )
          /
          alter index "r_li_idx001" rebuild
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+10000, otype, created from "objects_type" partition (p1)
          /
          insert into swap_t select oid+20000, otype, created from "objects_type" partition (p1)
          /
          alter table "objects_type" exchange partition p1 with table swap_t
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+100
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 539 "组合表(范围+列表:1普索引): 交换子分区: 建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          create table swap_t as select * from "objects_type" where 1=0
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+100000, otype, created from "objects_type" subpartition ( p1_table )
          /
          insert into swap_t select oid+200000, otype, created from "objects_type" subpartition ( p1_table )
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /


 case 540 "组合表(范围+列表:1普索引): 交换子分区" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          create table swap_t as select * from "objects_type" where 1=0
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+100000, otype, created from "objects_type" subpartition ( p1_table )
          /
          insert into swap_t select oid+200000, otype, created from "objects_type" subpartition ( p1_table )
          /
          alter table "objects_type" exchange subpartition p1_table with table swap_t
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+900000
          /
          update swap_t set oid=oid+800000
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 541 "组合表(范围+列表:1普索引): 合并分区(2个分区均有数据)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /

 case 542 "组合表(范围+列表:1普索引): SPLIT分区(2个分区均有数据)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /
 case 543 "组合表(范围+列表:1普索引): 合并分区(第一个分区有数据,分区名称重用):建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 544 "组合表(范围+列表:1普索引): 合并分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 545 "组合表(范围+列表:1普索引): SPLIT分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+80000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /


 case 546 "组合表(范围+列表:1普索引): 合并分区(第一个分区有数据,分区名称不重用):建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 547 "组合表(范围+列表:1普索引): 合并分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 548 "组合表(范围+列表:1普索引): SPLIT分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+80000
          /
          commit
          /

      tgt_sql:

          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /

 case 549 "组合表(范围+列表:1普索引): 合并分区(第2个分区有数据,分区名称重用):建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 550 "组合表(范围+列表:1普索引): 合并分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 551 "组合表(范围+列表:1普索引): SPLIT分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /


 case 552 "组合表(范围+列表:1普索引): 合并分区(第2个分区有数据,分区名称不重用):建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 553 "组合表(范围+列表:1普索引): 合并分区(第2个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /0
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 554 "组合表(范围+列表:1普索引): SPLIT分区(第2一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          alter index "r_li_idx001" rebuild
          /
          update "objects_type" set oid=oid+800000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /
          
 case 555 "组合表(范围+列表:1普索引): 操作子分区键值: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 556 "组合表(范围+列表:1普索引): 操作子分区键值: 增加" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" modify subpartition p1_index add values ('VIEW' )
          /
          alter index "r_li_idx001" rebuild
          /

      tgt_sql:
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_INDEX'
          /

 case 557 "组合表(范围+列表:1普索引): 操作子分区键值: 删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" modify subpartition p1_index add values ('VIEW' )
          /
          alter index "r_li_idx001" rebuild
          /
          alter table "objects_type" modify subpartition p1_index drop values ('VIEW' )
          /
          alter index "r_li_idx001" rebuild
          /
          commit
          /
          
      tgt_sql:
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_INDEX'
          /

 case 558 "组合表(范围+列表:1普索引): 分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" rename partition p4 to p4_4
          /
          alter index "r_li_idx001" rebuild
          /
          commit
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4_4'
          /

 case 559 "组合表(范围+列表:1普索引): 子分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" rename subpartition p2_table to p2_tab
          /
          alter index "r_li_idx001" rebuild
          /
      tgt_sql:          
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_TABLE'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_TAB'
          /
          
 case 560 "组合表(范围+列表:1普索引): 分区 TRUNCATE" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" truncate partition p2
          /
          alter index "r_li_idx001" rebuild
          /
          insert into "objects_type" values ( 4000, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /
          
      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition ( p2 )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition ( p2 )
          /

 case 561 "组合表(范围+列表:1普索引): 子分区 TRUNCATE" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( oid, otype )
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" truncate subpartition p2_table
          /
          alter index "r_li_idx001" rebuild
          /
          insert into "objects_type" values ( 7000, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+600000000
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition ( p2 )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition ( p2 )
          /
          select count(*) from "objects_type" subpartition ( p2_table )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" subpartition ( p2_table )
          /

 case 562 "组合表(范围+列表模板:1LOCAL索引): 建表(指定子分区模板)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=1
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=3
          /
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
          /
          select column_name from user_subpart_key_columns where name='objects_type' and object_type='TABLE'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P1' and subpartition_name='P1_SUB_TABLE'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P1' and subpartition_name='P1_SUB_INDEX'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P3' and subpartition_name='P3_SUB_OTHER'
          /
          select count(*) from user_subpartition_templates where table_name='objects_type'
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /

 case 563 "组合表(范围+列表模板:1LOCAL索引): 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P4'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /


 case 564 "组合表(范围+列表模板:1LOCAL索引): 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" drop partition P3
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /

 case 565 "组合表(范围+列表模板:1LOCAL索引): 修改子分区模板" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /
          alter table "objects_type" drop partition P3
          /
          alter table "objects_type" set subpartition template (
                subpartition sub_view  values('VIEW' ) tablespace system,
                subpartition sub_index values('INDEX') tablespace users,
                subpartition sub_table values('TABLE') tablespace system,
                subpartition sub_other values(DEFAULT) tablespace users
          )
          /

      tgt_sql:
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=4
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=4
          /
          
 case 566 "组合表(范围+列表:1LOCAL索引): 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /

 case 567 "组合表(范围+列表:1LOCAL索引): 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD')) (
             subpartition p5_table1 values ('TABLE'),
             subpartition p5_index1 values ('INDEX'),
             subpartition p5_view1  values ('VIEW')
          )
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=1
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=3
          /
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P4'
          /
          select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
          /
          select column_name from user_subpart_key_columns where name='objects_type' and object_type='TABLE'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P1' and subpartition_name='P1_TABLE'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P1' and subpartition_name='P1_INDEX'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P3' and subpartition_name='P3_OTHER'
          /


 case 568 "组合表(范围+列表:1LOCAL索引): 增加子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" modify partition p1 add subpartition p1_view values ('VIEW')
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /

 case 569 "组合表(范围+列表:1LOCAL索引): 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" drop partition p4
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /


 case 570 "组合表(范围+列表:1LOCAL索引): 删除子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" modify partition p1 add subpartition p1_view values ('VIEW')
          /
          alter table "objects_type" drop subpartition p1_view
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /

 case 571 "组合表(范围+列表:1LOCAL索引): 交换分区" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          create table swap_t ( oid number, otype varchar2(19), created date )
          partition by list ( otype ) (
                 partition type_table values ('TABLE'),
                 partition type_index values ('INDEX')
          )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+10000, otype, created from "objects_type" partition (p1)
          /
          insert into swap_t select oid+20000, otype, created from "objects_type" partition (p1)
          /
          alter table "objects_type" exchange partition p1 with table swap_t
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+100
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 572 "组合表(范围+列表:1LOCAL索引): 交换子分区: 建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          create table swap_t as select * from "objects_type" where 1=0
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+100000, otype, created from "objects_type" subpartition ( p1_table )
          /
          insert into swap_t select oid+200000, otype, created from "objects_type" subpartition ( p1_table )
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 573 "组合表(范围+列表:1LOCAL索引): 交换子分区" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          create table swap_t as select * from "objects_type" where 1=0
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+100000, otype, created from "objects_type" subpartition ( p1_table )
          /
          insert into swap_t select oid+200000, otype, created from "objects_type" subpartition ( p1_table )
          /
          alter table "objects_type" exchange subpartition p1_table with table swap_t
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+900000
          /
          update swap_t set oid=oid+800000
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 574 "组合表(范围+列表:1LOCAL索引): 合并分区(2个分区均有数据)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          
 case 575 "组合表(范围+列表:1LOCAL索引): SPLIT分区(2个分区均有数据)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
		  alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /

 case 576 "组合表(范围+列表:1LOCAL索引): 合并分区(第一个分区有数据,分区名称重用):建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 577 "组合表(范围+列表:1LOCAL索引): 合并分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /

 case 578 "组合表(范围+列表:1LOCAL索引): SPLIT分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+80000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /


 case 579 "组合表(范围+列表:1LOCAL索引): 合并分区(第一个分区有数据,分区名称不重用):建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 580 "组合表(范围+列表:1LOCAL索引): 合并分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 581 "组合表(范围+列表:1LOCAL索引): SPLIT分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+80000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /

 case 582 "组合表(范围+列表:1LOCAL索引): 合并分区(第2个分区有数据,分区名称重用):建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          
 case 583 "组合表(范围+列表:1LOCAL索引): 合并分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /

          
 case 584 "组合表(范围+列表:1LOCAL索引): SPLIT分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000
          /
          commit
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /    


 case 585 "组合表(范围+列表:1LOCAL索引): 合并分区(第2个分区有数据,分区名称不重用):建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /

 case 586 "组合表(范围+列表:1LOCAL索引): 合并分区(第2个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 587 "组合表(范围+列表:1LOCAL索引): SPLIT分区(第2一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+800000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /

 case 588 "组合表(范围+列表:1LOCAL索引): 操作子分区键值: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
		  commit
		  /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /

 case 589 "组合表(范围+列表:1LOCAL索引): 操作子分区键值: 增加" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" modify subpartition p1_index add values ('VIEW' )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          
      tgt_sql:
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_INDEX'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /


 case 590 "组合表(范围+列表:1LOCAL索引): 操作子分区键值: 删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" modify subpartition p1_index add values ('VIEW' )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" modify subpartition p1_index drop values ('VIEW' )
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_INDEX'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 591 "组合表(范围+列表:1LOCAL索引): 分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" rename partition p4 to p4_4
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4_4'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 592 "组合表(范围+列表:1LOCAL索引): 子分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" rename subpartition p2_table to p2_tab
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_TABLE'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_TAB'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 593 "组合表(范围+列表:1LOCAL索引): 分区 TRUNCATE" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" truncate partition p2
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 4000, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+10000000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition ( p2 )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition ( p2 )
          /
          
 case 594 "组合表(范围+列表:1LOCAL索引): 子分区 TRUNCATE" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" truncate subpartition p2_table
          /
          drop index "r_li_idx001"
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 7000, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+600000000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition ( p2 )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition ( p2 )
          /
          select count(*) from "objects_type" subpartition ( p2_table )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" subpartition ( p2_table )
          /
          
 case 595 "组合表(范围+列表模板:1普1LOCAL索引): 建表(指定子分区模板)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=1
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=3
          /
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
          /
          select column_name from user_subpart_key_columns where name='objects_type' and object_type='TABLE'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_subpartition_templates where table_name='objects_type'
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /

 case 596 "组合表(范围+列表模板:1普1LOCAL索引): 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P4'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /

 case 597 "组合表(范围+列表模板:1普1LOCAL索引): 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" drop partition P3
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          
 case 598 "组合表(范围+列表模板:1普1LOCAL索引): 修改子分区模板" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
          partition by range ( created )
          subpartition by list (otype)
          subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
          )(
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /
          alter table "objects_type" drop partition P3
          /
          alter table "objects_type" set subpartition template (
                subpartition sub_view  values('VIEW' ) tablespace system,
                subpartition sub_index values('INDEX') tablespace users,
                subpartition sub_table values('TABLE') tablespace system,
                subpartition sub_other values(DEFAULT) tablespace users
          )
          /

      tgt_sql:
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=4
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          select high_bound from user_subpartition_templates where table_name='objects_type' and subpartition_position=4
          /
          
 case 599 "组合表(范围+列表:1普1LOCAL索引): 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=1
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' and colno=3
          /
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select column_name from user_part_key_columns where name='objects_type' and object_type='TABLE'
          /
          select column_name from user_subpart_key_columns where name='objects_type' and object_type='TABLE'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          
 case 600 "组合表(范围+列表:1普1LOCAL索引): 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD')) (
             subpartition p5_table1 values ('TABLE'),
             subpartition p5_index1 values ('INDEX'),
             subpartition p5_view1  values ('VIEW')
          )
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
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P5'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P5' and subpartition_name='P5_TABLE1'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P5' and subpartition_name='P5_INDEX1'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and partition_name='P5' and subpartition_name='P5_VIEW1'
          /

 case 601 "组合表(范围+列表:1普1LOCAL索引): 增加子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" modify partition p1 add subpartition p1_view values ('VIEW')
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /
          select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_VIEW'
          /

 case 602 "组合表(范围+列表:1普1LOCAL索引): 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" drop partition p4
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /

 case 603 "组合表(范围+列表:1普1LOCAL索引): 删除子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD')) (
             subpartition p5_table1 values ('TABLE'),
             subpartition p5_index1 values ('INDEX'),
             subpartition p5_view1  values ('VIEW')
          )
          /
          alter table "objects_type" drop subpartition p1_table
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_TABLE'
          /

 case 604 "组合表(范围+列表:1普1LOCAL索引): 交换分区" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created )
          subpartition by list (otype) (
             partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')  ),
             partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT)  ),
             partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT)  ),
             partition p4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          create table swap_t ( oid number, otype varchar2(19), created date )
          partition by list ( otype ) (
                 partition type_table values ('TABLE'),
                 partition type_index values ('INDEX')
          )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+10000, otype, created from "objects_type" partition (p1)
          /
          insert into swap_t select oid+20000, otype, created from "objects_type" partition (p1)
          /
          alter table "objects_type" exchange partition p1 with table swap_t
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+100
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 605 "组合表(范围+列表:1普1LOCAL索引): 交换子分区: 建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          create table swap_t as select * from "objects_type" where 1=0
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+100000, otype, created from "objects_type" subpartition ( p1_table )
          /
          insert into swap_t select oid+200000, otype, created from "objects_type" subpartition ( p1_table )
          /
		  commit
		  /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 606 "组合表(范围+列表:1普1LOCAL索引): 交换子分区" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          create table swap_t as select * from "objects_type" where 1=0
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          insert into swap_t select oid+100000, otype, created from "objects_type" subpartition ( p1_table )
          /
          insert into swap_t select oid+200000, otype, created from "objects_type" subpartition ( p1_table )
          /
          alter table "objects_type" exchange subpartition p1_table with table swap_t
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+900000
          /
          update swap_t set oid=oid+800000
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select count(*) from swap_t
          /
          select to_char(sum(nvl(oid,0))) from swap_t
          /

 case 607 "组合表(范围+列表:1普1LOCAL索引): 合并分区(2个分区均有数据)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          
 case 608 "组合表(范围+列表:1普1LOCAL索引): SPLIT分区(2个分区均有数据)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /

 case 609 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第一个分区有数据,分区名称重用):建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
		  commit
		  /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 610 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 611 "组合表(范围+列表:1普1LOCAL索引): SPLIT分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+80000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /


 case 612 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第一个分区有数据,分区名称不重用):建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 613 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 614 "组合表(范围+列表:1普1LOCAL索引): SPLIT分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+80000
          /
		  commit
		  /


      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /
          
 case 615 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第2个分区有数据,分区名称重用):建表" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 616 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 617 "组合表(范围+列表:1普1LOCAL索引): SPLIT分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
          drop table swap_t
          /
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2003-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2003-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2003-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p2)
          /


 case 618 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第2个分区有数据,分区名称不重用):建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 619 "组合表(范围+列表:1普1LOCAL索引): 合并分区(第2个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 620 "组合表(范围+列表:1普1LOCAL索引): SPLIT分区(第2一个分区有数据,分区名称不重用)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9, 'TABLE', TO_DATE('2000-01-29','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+900000
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+10000000
          /
          alter table "objects_type"
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          update "objects_type" set oid=oid+800000
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" partition (p2)
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition (p1)
          /

 case 621 "组合表(范围+列表:1普1LOCAL索引): 操作子分区键值: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
		  select count(*) from "objects_type"
          /
          
 case 622 "组合表(范围+列表:1普1LOCAL索引): 操作子分区键值: 增加" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" modify subpartition p1_index add values ('VIEW' )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_INDEX'
          /
		  select count(*) from "objects_type"
          /

 case 623 "组合表(范围+列表:1普1LOCAL索引): 操作子分区键值: 删除" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          alter table "objects_type" modify subpartition p1_index add values ('VIEW' )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          alter table "objects_type" modify subpartition p1_index drop values ('VIEW' )
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select high_value from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P1_INDEX'
          /
		  select count(*) from "objects_type"
          /
          
 case 624 "组合表(范围+列表:1普1LOCAL索引): 分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" rename partition p4 to p4_4
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P4_4'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 625 "组合表(范围+列表:1普1LOCAL索引): 子分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" rename subpartition p2_table to p2_tab
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /

      tgt_sql:
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_TABLE'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_TAB'
          /
		  select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          
 case 626 "组合表(范围+列表:1普1LOCAL索引): 分区 TRUNCATE" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" truncate partition p2
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 4000, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 6000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+10000000
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition ( p2 )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition ( p2 )
          /
          
 case 627 "组合表(范围+列表:1普1LOCAL索引): 子分区 TRUNCATE" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid number, otype varchar2(19), created date )
          partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
               ( subpartition p1_table values ('TABLE'),
                 subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
               ( subpartition p2_table values ('TABLE'),
                 subpartition p2_index values ('INDEX'),
                 subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
               ( subpartition p3_table values ('TABLE'),
                 subpartition p3_index values ('INDEX'),
                 subpartition p3_other values (DEFAULT) ),
             partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
          )
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 1, 'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 3, 'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 4, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 5, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          commit
          /
          alter table "objects_type" truncate subpartition p2_table
          /
          drop index "r_li_idx001"
          /
          drop index "r_li_idx00p"
          /
          create index "r_li_idx00p" on "objects_type" ( oid, otype )
          /
          create index "r_li_idx001" on "objects_type" ( created ) local
          /
          insert into "objects_type" values ( 7000, 'INDEX', TO_DATE('2003-01-24','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 8000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          insert into "objects_type" values ( 9000, 'TABLE', TO_DATE('2003-01-25','YYYY-MM-DD'))
          /
          update "objects_type" set oid=oid+600000000
          /
		  commit
		  /
          
      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(nvl(oid,0))) from "objects_type"
          /
          select count(*) from "objects_type" partition ( p2 )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" partition ( p2 )
          /
          select count(*) from "objects_type" subpartition ( p2_table )
          /
          select to_char(sum(nvl(oid,0))) from "objects_type" subpartition ( p2_table )
          /