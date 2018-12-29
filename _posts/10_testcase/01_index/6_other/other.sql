
 case 1 "Shrink 表和索引: 建表" 0
      src_sql:
          drop table dds_shrink
          /
          create table dds_shrink as select * from dba_objects where rownum<40001
          /
          create index dds_shrink_i1 on dds_shrink ( object_id )
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='DDS_SHRINK'
          /
          
 case 2 "Shrink 表和索引: shrink" 0
      src_sql:
          drop table dds_shrink
          /
          create table dds_shrink as select * from dba_objects where rownum<40001
          /
          alter table dds_shrink add primary key(object_id)
		  /
          delete from dds_shrink where rownum< (select count(*)/2 from dds_shrink)
          /
          alter table dds_shrink enable row movement
          /
          alter table dds_shrink shrink space cascade
          /

      tgt_sql:
          select count(*) from dds_shrink
          /
          select sum(nvl(object_id,0)) from dds_shrink
          /
          select sum(nvl(data_object_id,0)) from dds_shrink
          /
          select to_char(max(created),'YYYY-MM-DD HH24:MI:SS') from dds_shrink
          /
          
 case 3 "Shrink 表和索引: 删除表" 0
      src_sql:
          drop table dds_shrink
          /
          create table dds_shrink as select * from dba_objects where rownum<40001
          /
          create index dds_shrink_i1 on dds_shrink ( object_id )
          /
          delete from dds_shrink where rownum< (select count(*)/2 from dds_shrink)
          /
          alter table dds_shrink enable row movement
          /
          alter table dds_shrink shrink space cascade
          /
          drop table dds_shrink
          /

        tgt_sql:
          select count(*) from user_tables where table_name='dds_shrink'
          /
          
  
 case 4 "分区表，增加主键／唯一键，使用 LOCAL 索引" 0
      src_sql:
          drop table t03
          /
          create table t03 ( f1 int, f2 int, f3 int ) partition by range ( f1 ) (
               partition p1 values less than (1000),
               partition p2 values less than (2000),
               partition pm values less than (maxvalue) )
          /
          alter table t03 add constraint t03_pk primary key ( f1 ) using index local nologging
          /
          alter table t03 add constraint t03_uk unique ( f2, f1 ) using index local nologging
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='T03'
          /
          select count(*) from user_tab_partitions where table_name='T03'
          /
          select count(1) from user_constraints where constraint_name='T03_PK' and constraint_type='P'
          /
          select count(1) from user_constraints where constraint_name='T03_UK' and constraint_type='U'
          /
          select count(1) from user_indexes where index_name='T03_PK' and table_name='T03'
          /
          select count(1) from user_ind_partitions where index_name='T03_PK'
          /
          select count(1) from user_indexes where index_name='T03_UK' and table_name='T03'
          /
          select count(1) from user_ind_partitions where index_name='T03_UK'
          /
            
 case 5 "普通表，普通索引，改变参数 PARALLEL" 0
      src_sql:
          drop table t03
          /
          create table t03 ( f1 int, f2 int )
          /
          create index t03_index on t03 ( f1 )
          /
          alter index t03_index parallel 10
          /

      tgt_sql:
          select count(*) from user_tables where table_name='T03'
          /
          select count(*) from user_indexes where index_name='T03_INDEX'
          /
          select degree from user_indexes where index_name='T03_INDEX'
          /
            
 case 6 "普通表，分区索引，改变参数 PARALLEL" 0
      src_sql:
          drop table t03
          /
          create table t03 ( f1 int, f2 int )
          /
          create index t03_index on t03 ( f1 ) global partition by range (f1) (
              partition t03_i_1 values less than ( 1000 ) tablespace tbs1,
              partition t03_i_2 values less than ( 2000 ) tablespace tbs2,
              partition t03_i_m values less than ( maxvalue ) tablespace users )
          /
          alter index t03_index parallel 10
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='T03'
          /
          select count(*) from user_indexes where index_name='T03_INDEX'
          /
          select degree from user_indexes where index_name='T03_INDEX'
          /

 case 7 "分区表，普通索引，改变参数 PARALLEL" 0
      src_sql:
          drop table t03
          /
          create table t03 ( f1 int, f2 int ) partition by range (f1) (
              partition t03_p_1 values less than ( 1000 ) tablespace tbs1,
              partition t03_p_2 values less than ( 2000 ) tablespace tbs2,
              partition t03_p_m values less than ( maxvalue ) tablespace users )
          /
          create index t03_index on t03 ( f1 )
          /
          alter index t03_index parallel 10
          /

      tgt_sql:
          select count(*) from user_tables where table_name='T03'
          /
          select count(*) from user_indexes where index_name='T03_INDEX'
          /
          select degree from user_indexes where index_name='T03_INDEX'
          /
            
 case 8 "分区表，分区索引，改变参数 PARALLEL" 0
      src_sql:
          drop table t03
          /
          create table t03 ( f1 int, f2 int ) partition by range (f1) (
              partition t03_p_1 values less than ( 1000 ) tablespace tbs1,
              partition t03_p_2 values less than ( 2000 ) tablespace tbs2,
              partition t03_p_m values less than ( maxvalue ) tablespace users )
          /
          create index t03_index on t03 ( f1 ) global partition by range (f1) (
              partition t03_i_1 values less than ( 1000 ) tablespace tbs1,
              partition t03_i_2 values less than ( 2000 ) tablespace tbs2,
              partition t03_i_m values less than ( maxvalue ) tablespace users )
          /
          alter index t03_index parallel 10
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='T03'
          /
          select count(*) from user_indexes where index_name='T03_INDEX'
          /
          select degree from user_indexes where index_name='T03_INDEX'
          /