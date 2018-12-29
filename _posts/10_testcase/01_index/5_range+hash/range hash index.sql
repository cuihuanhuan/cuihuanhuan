 case 652 "组合表(范围+HASH): 索引：建表" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /

 case 653 "组合表(范围+HASH): 索引：建立普通索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          drop index "idx_objects_id"
          /
          create index "idx_objects_id" on "objects_type" ( objn )
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /

 case 654 "组合表(范围+HASH): 索引：删除普通索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          drop index "idx_objects_id"
          /
          create index "idx_objects_id" on "objects_type" ( objn )
          /

          drop index "idx_objects_id"
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          
 case 655 "组合表(范围+HASH): 索引：建立 NON-PREFIX LOCAL 索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objd ) local
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          select count(*) from user_ind_partitions where index_name='idx_objects_id'
          /
          select count(*) from user_ind_subpartitions where index_name='idx_objects_id'
          /
          
 case 656 "组合表(范围+HASH): 索引：删除 NON-PREFIX LOCAL 索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objd ) local
          /
          drop index "idx_objects_id"
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          
 case 657 "组合表(范围+HASH): 索引：建立 PREFIX LOCAL 索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objn ) local
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          select count(*) from user_ind_partitions where index_name='idx_objects_id'
          /
          select count(*) from user_ind_subpartitions where index_name='idx_objects_id'
          /
          
 case 658 "组合表(范围+HASH): 索引：删除 PREFIX LOCAL 索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objn ) local
          /

          drop index "idx_objects_id"
          /
          
      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          
 case 659 "组合表(范围+HASH): 索引：建立全局范围索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objn ) global
             partition by  range ( objn ) (
                    partition pm1_ix values less than ( 5000 ),
                    partition pm2_ix values less than ( 10000 ),
                    partition pmm_ix values less than ( MAXVALUE )
             )
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          select count(*) from user_ind_partitions where index_name='idx_objects_id'
          /
          select count(*) from user_ind_subpartitions where index_name='idx_objects_id'
          /
          
 case 660 "组合表(范围+HASH): 索引：删除全局范围索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objn ) global
             partition by  range ( objn ) (
                    partition pm1_ix values less than ( 5000 ),
                    partition pm2_ix values less than ( 10000 ),
                    partition pmm_ix values less than ( MAXVALUE )
             )
          /
          drop index "idx_objects_id"
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          
 case 661 "组合表(范围+HASH): 索引：建立全局HASH索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objn ) global
             partition by hash ( objn ) (
                    partition pm1_ix,
                    partition pm2_ix,
                    partition pm3_ix,
                    partition pmm_ix
             )
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          select count(*) from user_ind_partitions where index_name='idx_objects_id'
          /
          select count(*) from user_ind_subpartitions where index_name='idx_objects_id'
          /
          
 case 662 "组合表(范围+HASH): 索引：删除全局HASH索引" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "idx_objects_id" on "objects_type" ( objn ) global
             partition by hash ( objn ) (
                    partition pm1_ix,
                    partition pm2_ix,
                    partition pm3_ix,
                    partition pmm_ix
             )
          /
          drop index "idx_objects_id"
          /

      tgt_sql:
          select count(*) from user_indexes where index_name='idx_objects_id'
          /
          
 case 663 "组合表(范围+HASH:子分区模板)1普索引: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
           )
           /
           create index "objects_type_idx" on "objects_type" (otype)
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          select count(*) from user_subpartition_templates where table_name='objects_type'
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          
 case 664 "组合表(范围+HASH:子分区模板)1普索引: 修改子分区模板" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
           )
           /
           create index "objects_type_idx" on "objects_type" (otype)
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
          
 case 665 "组合表(范围+HASH:子分区模板)1普索引: 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
           )
           /
           create index "objects_type_idx" on "objects_type" (otype)
           /
          alter table "objects_type" set subpartition template (
                subpartition sub_table tablespace users,
                subpartition sub_index tablespace system,
                subpartition sub_view  tablespace users,
                subpartition sub_other tablespace users
          )
          /
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /
          alter index "objects_type_idx" rebuild
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

 case 666 "组合表(范围+HASH:子分区模板)1普索引: 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
           )
           /
           create index "objects_type_idx" on "objects_type" (otype)
           /
          alter table "objects_type" set subpartition template (
                subpartition sub_table tablespace users,
                subpartition sub_index tablespace system,
                subpartition sub_view  tablespace users,
                subpartition sub_other tablespace users
          )
          /
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /
          alter index "objects_type_idx" rebuild
          /
          alter table "objects_type" drop partition P5
          /
          alter index "objects_type_idx" rebuild
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P5'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /

 case 667 "组合表(范围+HASH)1普索引: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /

 case 668 "组合表(范围+HASH)1普索引: 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" add partition p3 values less than ('ZZ') (
             subpartition p3_table1,
             subpartition p3_index1,
             subpartition p3_view1
          )
          /
          alter index "objects_type_idx" rebuild
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P3'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 669 "组合表(范围+HASH)1普索引: 增加子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" modify partition p1 add subpartition p1_sub3
          /
          alter index "objects_type_idx" rebuild
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
          
 case 670 "组合表(范围+HASH)1普索引: TRUNCATE 分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" truncate partition p1
          /
          alter index "objects_type_idx" rebuild
          /
          insert into "objects_type" select object_id, object_id+90000, object_id, object_name
                 from dba_objects where object_name<'MM' and rownum<100
          /
          update "objects_type" set reccount=reccount+1
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 671 "组合表(范围+HASH)1普索引: TRUNCATE 子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" truncate subpartition p2_sub1
          /
          alter index "objects_type_idx" rebuild
          /
          insert into "objects_type" select object_id, object_id+900000, object_id, object_name
                 from dba_objects where object_name<'MM' and rownum<150
          /
          update "objects_type" set reccount=reccount+1
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 672 "组合表(范围+HASH)1普索引: 分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
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
          
 case 673 "组合表(范围+HASH)1普索引: 子分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" rename subpartition p2_sub1 to p2_sub_1
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

 case 674 "组合表(范围+HASH)1普索引: 移动子分区（相同表空间）：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          
 case 675 "组合表(范围+HASH)1普索引: 移动子分区（相同表空间）" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /

          alter table "objects_type" move subpartition p2_sub1
          /
          alter index "objects_type_idx" rebuild
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 676 "组合表(范围+HASH)1普索引: 移动子分区（不同表空间）" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /

          alter table "objects_type" move subpartition p2_sub1
          /
          alter index "objects_type_idx" rebuild
          /
          alter table "objects_type" move subpartition p2_sub1 tablespace system
          /
          alter index "objects_type_idx" rebuild
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 677 "组合表(范围+HASH)1普索引: 合并分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 678 "组合表(范围+HASH)1普索引: 合并分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" set reccount=reccount+1
          /
          commit
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
		  select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 679 "组合表(范围+HASH)1普索引: 分裂分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" set reccount=reccount+1
          /
          alter table "objects_type" split partition p12 at ('II') into ( partition p121, partition p122 )
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" set reccount=reccount+1
          /
          commit 
          /
          
      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
		  select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P121'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P122'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P121'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P122'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /

 case 680 "组合表(范围+HASH)1普索引: 合并分区(重用第一个分区名称)：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 681 "组合表(范围+HASH)1普索引: 合并分区(重用第一个分区名称)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /

          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" set reccount=reccount+1
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 682 "组合表(范围+HASH)1普索引: 分裂分区(重用第一个分区名称)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /

          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" set reccount=reccount+1
          /
          alter table "objects_type" split partition p2 at ('II') into ( partition p1, partition p2 )
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" set reccount=reccount+1
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /

 case 683 "组合表(范围+HASH)1普索引: 交换分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+1234, objd+2345, reccount+3456, nm from "objects_type" partition (p1)
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from user_tables where table_name='SWAP_T'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 684 "组合表(范围+HASH)1普索引: 交换分区" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+1234, objd+2345, reccount+3456, nm from "objects_type" partition (p1)
          /

          alter table "objects_type" exchange partition p1 with table swap_t
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" partition (p1) set reccount=rownum
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type" 
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" partition (p1)
          /
          
 case 685 "组合表(范围+HASH)1普索引: 交换子分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+2345, reccount+3456, nm from "objects_type" subpartition (p1_sub2)
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from user_tables where table_name='SWAP_T'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 686 "组合表(范围+HASH)1普索引: 交换子分区" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd)
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+2345, reccount+3456, nm from "objects_type" subpartition (p1_sub2)
          /
          alter table "objects_type" exchange subpartition p1_sub2 with table swap_t
          /
          alter index "objects_type_idx" rebuild
          /
          update "objects_type" partition (p1) set reccount=rownum
          /
          commit
          /
          
      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type" 
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" subpartition (p1_sub2)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" subpartition (p1_sub2)
          /

 case 687 "组合表(范围+HASH:子分区模板)1LOCAL: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
           )
           /
           create index "objects_type_idx" on "objects_type" (otype) local
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          select count(*) from user_subpartition_templates where table_name='objects_type'
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=1
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=2
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' and subpartition_position=3
          /
          
 case 688 "组合表(范围+HASH:子分区模板)1LOCAL: 修改子分区模板" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
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
 case 689 "组合表(范围+HASH:子分区模板)1LOCAL: 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
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
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD'))
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

 case 690 "组合表(范围+HASH:子分区模板)1LOCAL: 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
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
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD'))
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

 case 691 "组合表(范围+HASH)1LOCAL: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /

 case 692 "组合表(范围+HASH)1LOCAL: 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
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

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P3'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 693 "组合表(范围+HASH)1LOCAL: 增加子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
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
          
 case 694 "组合表(范围+HASH)1LOCAL: TRUNCATE 分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" truncate partition p1
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type" select object_id, object_id+90000, object_id, object_name
                 from dba_objects where object_name<'MM' and rownum<100
          /
          update "objects_type" set reccount=reccount+1
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 695 "组合表(范围+HASH)1LOCAL: TRUNCATE 子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
		  /
          alter table "objects_type" truncate subpartition p2_sub1
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type" select object_id, object_id+900000, object_id, object_name
                 from dba_objects where object_name<'MM' and rownum<150
          /
          update "objects_type" set reccount=reccount+1
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 696 "组合表(范围+HASH)1LOCAL: 分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
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
          
 case 697 "组合表(范围+HASH)1LOCAL: 子分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" rename subpartition p2_sub1 to p2_sub_1
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

 case 698 "组合表(范围+HASH)1LOCAL: 移动子分区（相同表空间）：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
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
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 699 "组合表(范围+HASH)1LOCAL: 移动子分区（相同表空间）" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" move subpartition p2_sub1
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
		  select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 700 "组合表(范围+HASH)1LOCAL: 移动子分区（不同表空间）" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" move subpartition p2_sub1 tablespace system
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 701 "组合表(范围+HASH)1LOCAL: 合并分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 702 "组合表(范围+HASH)1LOCAL: 合并分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
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
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
		  select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 703 "组合表(范围+HASH)1LOCAL: 分裂分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" set reccount=reccount+1
          /
          alter table "objects_type" split partition p12 at ('II') into ( partition p121, partition p122 )
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
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P121'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P122'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P121'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P122'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 704 "组合表(范围+HASH)1LOCAL: 合并分区(重用第一个分区名称)：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
 case 705 "组合表(范围+HASH)1LOCAL: 合并分区(重用第一个分区名称)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
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
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 706 "组合表(范围+HASH)1LOCAL: 分裂分区(重用第一个分区名称)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" set reccount=reccount+1
          /
          alter table "objects_type" split partition p2 at ('II') into ( partition p1, partition p2 )
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
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 707 "组合表(范围+HASH)1LOCAL: 交换分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+1234, objd+2345, reccount+3456, nm from "objects_type" partition (p1)
          /
          commit
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from user_tables where table_name='SWAP_T'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 708 "组合表(范围+HASH)1LOCAL: 交换分区" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+1234, objd+2345, reccount+3456, nm from "objects_type" partition (p1)
          /
          alter table "objects_type" exchange partition p1 with table swap_t
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" partition (p1) set reccount=rownum
          /
          commit
          /
          
      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type" 
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" partition (p1)
          /

 case 709 "组合表(范围+HASH)1LOCAL: 交换子分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+2345, reccount+3456, nm from "objects_type" subpartition (p1_sub2)
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from user_tables where table_name='SWAP_T'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 710 "组合表(范围+HASH)1LOCAL: 交换子分区" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+2345, reccount+3456, nm from "objects_type" subpartition (p1_sub2)
          /
          alter table "objects_type" exchange subpartition p1_sub2 with table swap_t
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" partition (p1) set reccount=rownum
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type" 
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" subpartition (p1_sub2)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" subpartition (p1_sub2)
          /
          
 case 711 "组合表(范围+HASH:子分区模板)1普1LOCAL: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
           )
           /
           create index "objects_type_IDX" on "objects_type" (oid)
           /
           create index "objects_type_idx" on "objects_type" (otype) local
           /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          select count(*) from user_subpartition_templates where table_name='objects_type'
          /
          select subpartition_name||','||tablespace_name from user_subpartition_templates where table_name='objects_type' order by subpartition_name
          /
          
 case 712 "组合表(范围+HASH:子分区模板)1普1LOCAL: 修改子分区模板" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
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
          
 case 713 "组合表(范围+HASH:子分区模板)1普1LOCAL: 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
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
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /
          alter index "objects_type_IDX" rebuild
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

 case 714 "组合表(范围+HASH:子分区模板)1普1LOCAL: 删除分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( oid NUMBER, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
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
          alter table "objects_type" add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD'))
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (otype) local
          /
          alter table "objects_type" drop partition P5
          /
          alter index "objects_type_IDX" rebuild
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


 case 715 "组合表(范围+HASH)1普1LOCAL: 建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /

 case 716 "组合表(范围+HASH)1普1LOCAL: 增加分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" add partition p3 values less than ('ZZ') (
             subpartition p3_table1,
             subpartition p3_index1,
             subpartition p3_view1
          )
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_subpartitions where table_name='objects_type' and partition_name='P3'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P3'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 717 "组合表(范围+HASH)1普1LOCAL: 增加子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" modify partition p1 add subpartition p1_sub3
          /
          alter index "objects_type_IDX" rebuild
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
          
 case 718 "组合表(范围+HASH)1普1LOCAL: TRUNCATE 分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
		  /
          alter table "objects_type" truncate partition p1
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type" select object_id, object_id+90000, object_id, object_name
                 from dba_objects where object_name<'MM' and rownum<100
          /
          update "objects_type" set reccount=reccount+1
          /
          commit
          /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 719 "组合表(范围+HASH)1普1LOCAL: TRUNCATE 子分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" truncate subpartition p2_sub1
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type" select object_id, object_id+900000, object_id, object_name
                 from dba_objects where object_name<'MM' and rownum<2048
          /
          update "objects_type" set reccount=reccount+1
          /
		  commit
		  /

      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 720 "组合表(范围+HASH)1普1LOCAL: 分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
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
          
 case 721 "组合表(范围+HASH)1普1LOCAL: 子分区改名" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" rename subpartition p2_sub1 to p2_sub_1
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

 case 722 "组合表(范围+HASH)1普1LOCAL: 移动子分区（相同表空间）：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type" select object_id, object_id+1000, object_id, object_name
                 from dba_objects where rownum<2048 and object_name<'MM'
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select cname||coltype||width||scale||precision from col where tname='objects_type' order by cname
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
          select subpartition_name,tablespace_name from user_tab_subpartitions where table_name='objects_type' order by subpartition_name
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 723 "组合表(范围+HASH)1普1LOCAL: 移动子分区（相同表空间）" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type" select object_id, object_id+1000, object_id, object_name
                 from dba_objects where rownum<2048 and object_name<'MM'
          /

          alter table "objects_type" move subpartition p2_sub1
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
		  select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 724 "组合表(范围+HASH)1普1LOCAL: 移动子分区（不同表空间）" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type" select object_id, object_id+1000, object_id, object_name
                 from dba_objects where rownum<2048 and object_name<'MM'
          /
          commit
          /
          alter table "objects_type" move subpartition p2_sub1 tablespace system
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /

      tgt_sql:
          select count(*) from user_tab_partitions where table_name='objects_type'
          /
		  select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select tablespace_name from user_tab_subpartitions where table_name='objects_type' and subpartition_name='P2_SUB1'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 725 "组合表(范围+HASH)1普1LOCAL: 合并分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /

 case 726 "组合表(范围+HASH)1普1LOCAL: 合并分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "objects_type_IDX" rebuild
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
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 727 "组合表(范围+HASH)1普1LOCAL: 分裂分区" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" merge partitions p1, p2 into partition p12
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" set reccount=reccount+1
          /
          alter table "objects_type" split partition p12 at ('II') into ( partition p121, partition p122 )
          /
          alter index "objects_type_IDX" rebuild
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
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P121'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P122'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P12'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P121'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P122'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 728 "组合表(范围+HASH)1普1LOCAL: 合并分区(重用第一个分区名称)：建表" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /

      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 729 "组合表(范围+HASH)1普1LOCAL: 合并分区(重用第一个分区名称)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /

          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "objects_type_IDX" rebuild
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
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 730 "组合表(范围+HASH)1普1LOCAL: 分裂分区(重用第一个分区名称)" 0
      src_sql:
          drop table "objects_type"
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table "objects_type" merge partitions p1, p2 into partition p2
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" set reccount=reccount+1
          /
          alter table "objects_type" split partition p2 at ('II') into ( partition p1, partition p2 )
          /
          alter index "objects_type_IDX" rebuild
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
          select count(*) from user_tab_subpartitions where table_name='objects_type'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P1'
          /
          select high_value from user_tab_partitions where table_name='objects_type' and partition_name='P2'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /

 case 731 "组合表(范围+HASH)1普1LOCAL: 交换分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+1234, objd+2345, reccount+3456, nm from "objects_type" partition (p1)
          /
          commit
          /

        tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from user_tables where table_name='SWAP_T'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
 
 case 732 "组合表(范围+HASH)1普1LOCAL: 交换分区" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+1234, objd+2345, reccount+3456, nm from "objects_type" partition (p1)
          /
          alter table "objects_type" exchange partition p1 with table swap_t
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" partition (p1) set reccount=rownum
          /
          commit
          /
          
      tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type" 
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" partition (p1)
          /
          
 case 733 "组合表(范围+HASH)1普1LOCAL: 交换子分区：建表" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+2345, reccount+3456, nm from "objects_type" subpartition (p1_sub2)
          /
          commit
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='objects_type'
          /
          select count(*) from user_tables where table_name='SWAP_T'
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type"
          /
          
 case 734 "组合表(范围+HASH)1普1LOCAL: 交换子分区" 0
      src_sql:
          drop table "objects_type"
          /
          drop table swap_t
          /
          create table "objects_type" ( objn number, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create index "objects_type_IDX" on "objects_type" (objn)
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          create table swap_t ( objn number, objd number, reccount int, nm varchar2(30) )
          /
          insert into "objects_type"
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+2345, reccount+3456, nm from "objects_type" subpartition (p1_sub2)
          /
          alter table "objects_type" exchange subpartition p1_sub2 with table swap_t
          /
          alter index "objects_type_IDX" rebuild
          /
          drop index "objects_type_idx"
          /
          create index "objects_type_idx" on "objects_type" (objd) local
          /
          update "objects_type" partition (p1) set reccount=rownum
          /
          commit
          /
          
        tgt_sql:
          select count(*) from "objects_type"
          /
          select to_char(sum(reccount)) from "objects_type" 
          /
          select count(*) from "objects_type" partition (p1)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" partition (p1)
          /
          select count(*) from "objects_type" subpartition (p1_sub2)
          /
          select to_char(sum(nvl(reccount,0))) from "objects_type" subpartition (p1_sub2)
          /