case 1 "范围分区表：建表测试" 0
        src_sql:
            drop table sales purge
            /
			drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (10000) tablespace users,
                   partition pmax values less than (maxvalue) tablespace system )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
            /
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
            /
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/



 case 2 "范围分区表：建索引测试:LOCAL分区，每个索引分区指定 TABLESPACE" 0
        src_sql:
		 drop table sales purge
            /
		 drop table ptest purge
            /
         create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (10000) tablespace users,
                   partition pmax values less than (maxvalue) tablespace system )
            /
            create index "ptest_idx001" on ptest ( b ) local (
                   partition p1   tablespace system,
                   partition pmax tablespace users )
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','ptest_idx001') order by object_name,object_type
            /
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
            /
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select index_name,partition_name,status,tablespace_name from user_ind_partitions where index_name='ptest_idx001' order by partition_name
/

 case 3 "范围分区表：SPLIT分区：分裂的分区均包含数据：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 10, 1 )
            /
            insert into ptest values ( 20, 10 )
            /
            insert into ptest values ( 50, 100 )
            /
            insert into ptest values ( 60, 1000 )
            /
            insert into ptest values ( 80, 10000 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 4 "范围分区表：SPLIT分区：分裂的分区均包含数据：分裂分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 10, 1 )
            /
            insert into ptest values ( 20, 10 )
            /
            insert into ptest values ( 50, 100 )
            /
            insert into ptest values ( 60, 1000 )
            /
            insert into ptest values ( 80, 10000 )
            /
			commit
			/
            alter table ptest split partition pmax at (50) into ( partition p1, partition pmax )
            /
            
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 5 "范围分区表：SPLIT分区：分裂的分区均包含数据：修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 10, 1 )
            /
            insert into ptest values ( 20, 10 )
            /
            insert into ptest values ( 50, 100 )
            /
            insert into ptest values ( 60, 1000 )
            /
            insert into ptest values ( 80, 10000 )
            /
            alter table ptest split partition pmax at (50) into ( partition p1, partition pmax )
            /
            update ptest set b=b+100000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 6 "范围分区表：SPLIT分区：分裂的分区第一个包含数据：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 10, 1 )
            /
            insert into ptest values ( 20, 10 )
            /
            insert into ptest values ( 50, 100 )
            /
            insert into ptest values ( 60, 1000 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 7 "范围分区表：SPLIT分区：分裂的分区第一个包含数据：分裂分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 10, 1 )
            /
            insert into ptest values ( 20, 10 )
            /
            insert into ptest values ( 50, 100 )
            /
            insert into ptest values ( 60, 1000 )
            /
			commit
			/
            alter table ptest split partition pmax at (90) into ( partition p1 , partition pmax)
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/

 case 8 "范围分区表：SPLIT分区：分裂的分区第一个包含数据：修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 10, 1 )
            /
            insert into ptest values ( 20, 10 )
            /
            insert into ptest values ( 50, 100 )
            /
            insert into ptest values ( 60, 1000 )
            /
            alter table ptest split partition pmax at (90) into ( partition p1 , partition pmax)
            /
            update ptest set b=b+1
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 9 "范围分区表：SPLIT分区：分裂的分区第二个包含数据：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 100, 1 )
            /
            insert into ptest values ( 200, 10 )
            /
            insert into ptest values ( 500, 100 )
            /
            insert into ptest values ( 600, 1000 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/



 case 10 "范围分区表：SPLIT分区：分裂的分区第二个包含数据：分裂分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 100, 1 )
            /
            insert into ptest values ( 200, 10 )
            /
            insert into ptest values ( 500, 100 )
            /
            insert into ptest values ( 600, 1000 )
            /
            alter table ptest split partition pmax at (50) into ( partition p1 , partition pmax)
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 11 "范围分区表：SPLIT分区：分裂的分区第二个包含数据：修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 100, 1 )
            /
            insert into ptest values ( 200, 10 )
            /
            insert into ptest values ( 500, 100 )
            /
            insert into ptest values ( 600, 1000 )
            /
            alter table ptest split partition pmax at (50) into ( partition p1 , partition pmax)
            /
            update ptest set b=b+1
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 12 "范围分区表：删除分区：删除的分区包含数据：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 13 "范围分区表：删除分区：删除的分区包含数据：删除第三个分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            alter table ptest drop partition p3
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 14 "范围分区表：删除分区：删除的分区包含数据：修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            alter table ptest drop partition p3
            /
            update ptest set b=b+1
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/

 case 15 "范围分区表：删除分区：删除的分区包含数据：删除第一个分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            alter table ptest drop partition p1
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 16 "范围分区表：删除分区：删除的分区包含数据：再次修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            alter table ptest drop partition p1
            /
            update ptest set b=b+1
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/

 case 17 "范围分区表：TRUNCATE 分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            alter table ptest truncate partition p4 update global indexes
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


 case 18 "范围分区表：改名分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            alter table ptest rename partition p4 to p4_4
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/

 case 19 "范围分区表：删除测试分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
            drop table ptest purge
            /
        tgt_sql:
select count(*) from user_objects where object_name='PTEST'
/


 case 20 "范围分区表：添加分区：建立分区表" 0
        src_sql:
			drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/


 case 21 "范围分区表：ENABLE ROW MOVEMENT" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
			alter table ptest add constraint PK_R primary key (id)
            /
            alter table ptest enable row movement
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select table_name,row_movement from user_tables where table_name='PTEST'
/


 case 22 "范围分区表：DISABLE ROW MOVEMENT" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            alter table ptest enable row movement
            /
            alter table ptest disable row movement
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select table_name,row_movement from user_tables where table_name='PTEST'
/


 case 23 "范围分区表：添加分区：增加分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            alter table ptest add  partition p5 values less than (2005) tablespace system
            /
			alter table ptest add  partition p6 values less than (2006)
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/



 case 24 "范围分区表：交换分区：建立待交换的表 swap_t" 0
        src_sql:
            drop table swap_t purge
            /
            drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create table swap_t as select * from ptest where 1=0
            /
            insert into ptest values ( 1,2000)
            /
            insert into swap_t values ( 2,2000)
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','SWAP_T') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/
select * from swap_t order by id
/


 case 25 "范围分区表：交换分区：执行交换" 0
        src_sql:
            drop table swap_t purge
            /
            drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create table swap_t as select * from ptest where 1=0
            /
            insert into ptest values (1,1000)
            /
            insert into swap_t values (2,2000)
            /
			commit
			/
            alter table ptest exchange partition p1 with table swap_t
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','SWAP_T') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/
select * from swap_t order by id
/


 case 26 "范围分区表：交换分区：执行交换完成后看修改数据是否正确" 0
        src_sql:
            drop table swap_t purge
            /
			drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create table swap_t as select * from ptest where 1=0
            /
            insert into ptest values ( 1,1000)
            /
            insert into swap_t values ( 2,2000)
            /
			commit
            /
            alter table ptest exchange partition p1 with table swap_t
            /
            update ptest partition (p1) set id=1000000+id
            /
            update swap_t set id=90000+id
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','SWAP_T') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/
select * from swap_t order by id
/


 case 27 "范围分区表：合并分区[合并方均有数据]" 0
        src_sql:
            drop table swap_t purge
            /
			drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1,2000)
            /
            insert into ptest values ( 200, 2001 )
            /
            insert into ptest values ( 112, 2000 )
            /
            alter table ptest merge partitions p1,p2 into partition p2_2
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 28 "范围分区表：合并分区[合并方均有数据]：合并完成后修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1,2000)
            /
            insert into ptest values ( 200, 2001 )
            /
            insert into ptest values ( 112, 2000 )
            /
			commit
            /
            alter table ptest merge partitions p1,p2 into partition p2_2
            /
			alter index PK_R rebuild
			/
            update ptest partition ( p2_2 ) set id=id+9000000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 29 "范围分区表：合并分区[合并方第一方有数据]：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2000 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 30 "范围分区表：合并分区[合并方第一方有数据]" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2000 )
            /
            alter table ptest merge partitions p1,p2 into partition p2
            /
         tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 31 "范围分区表：合并分区[合并方第一方有数据]：合并完成后修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2000 )
            /
            alter table ptest merge partitions p1,p2 into partition p2
            /
			alter index PK_R rebuild
			/
            update ptest partition ( p2 ) set id=id+9000000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 32 "范围分区表：合并分区[合并方第二方有数据]：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/

 case 33 "范围分区表：合并分区[合并方第二方有数据]" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            alter table ptest merge partitions p1,p2 into partition p2
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 34 "范围分区表：合并分区[合并方第二方有数据]：合并完成后修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            alter table ptest merge partitions p1,p2 into partition p2
            /
			alter index PK_R rebuild
			/
            update ptest partition ( p2 ) set id=id+9000000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 35 "范围分区表：移动分区[移动到相同表空间]：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 36 "范围分区表：移动分区[移动到相同表空间]" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
			commit
			/
            alter table ptest move partition p2
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 37 "范围分区表：移动分区[移动到相同表空间]：移动完成后修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            alter table ptest move partition p2
            /
			alter index PK_R rebuild
			/
            update ptest partition ( p2 ) set id=id+9000000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 38 "范围分区表：移动分区[移动到不同表空间]：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 39 "范围分区表：移动分区[移动到不同表空间]" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            alter table ptest move partition p2 tablespace users
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 40 "范围分区表：移动分区[移动到不同表空间]：移动完成后修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            alter table ptest add constraint PK_R primary key (id)
            /
            insert into ptest values ( 1, 2001 )
            /
            alter table ptest move partition p2 tablespace users
            /
			alter index PK_R rebuild
			/
            update ptest partition ( p2 ) set id=id+9000000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by id
/


 case 41 "范围分区表：TRUNCATE表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
            /
            alter table ptest add constraint PK_R primary key (a)
            /
            insert into ptest values ( 95, 100 )
            /
            insert into ptest values ( 96, 101 )
            /
            insert into ptest values ( 155, 200 )
            /
            insert into ptest values ( 156, 201 )
            /
            insert into ptest values ( 255, 300 )
            /
            insert into ptest values ( 256, 301 )
            /
            insert into ptest values ( 355, 400 )
            /
            insert into ptest values ( 356, 401 )
            /
            insert into ptest values ( 555, 500 )
            /
            insert into ptest values ( 556, 501 )
            /
			commit
			/
            truncate table ptest
			/
			insert into ptest values ( 97, 101 )
            /
            insert into ptest values ( 157, 200 )
            /
            insert into ptest values ( 257, 301 )
            /
            insert into ptest values ( 357, 400 )
            /
            insert into ptest values ( 557, 500 )
            /
			commit
			/
        tgt_sql:
select object_name,object_type from user_objects where object_name in('PTEST','PK_R') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='PTEST'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select * from ptest order by a
/


case 42 "范围分区表：创建普通索引和local索引" 0
        src_sql:
        drop table ptest purge
		/
		create table ptest (a number, b number,c number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
        /
        alter table ptest add constraint ptest_R primary key (a)
        /
		create index idx001 on ptest ( a,b )
		/
		create index idx002_loc on ptest ( c ) local
		/
        insert into ptest values ( 96, 101,1001 )
        /
        insert into ptest values ( 156, 201,2001 )
        /
        insert into ptest values ( 256, 301,3001 )
        /
        insert into ptest values ( 356, 401,4001 )
        /
        insert into ptest values ( 556, 501,5001 )
        /
		commit
		/
        tgt_sql:
select constraint_name,constraint_type from user_constraints where table_name in('PTEST') order by constraint_name,constraint_type
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
/
select * from ptest order by a
/



case 43 "范围分区表：删除普通索引和local索引" 0
        src_sql:
        drop table ptest purge
		/
		create table ptest (a number, b number,c number) partition  by range (a) (
                   partition p1   values less than (100),
                   partition p2   values less than (200),
                   partition p3   values less than (300),
                   partition p4   values less than (400),
                   partition pmax values less than (maxvalue)  )
        /
        alter table ptest add constraint ptest_R primary key (a)
        /
		create index idx001 on ptest ( a,b )
		/
		create index idx002_loc on ptest ( c ) local
		/
        insert into ptest values ( 96, 101,1001 )
        /
        insert into ptest values ( 156, 201,2001 )
        /
        insert into ptest values ( 256, 301,3001 )
        /
        insert into ptest values ( 356, 401,4001 )
        /
        insert into ptest values ( 556, 501,5001 )
        /
		commit
		/
		drop index idx001
		/
		drop index idx002_loc
		/
        tgt_sql:
select constraint_name,constraint_type from user_constraints where table_name in('PTEST') order by constraint_name,constraint_type
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
/
select * from ptest order by a
/



case 44 "范围分区表：增加约束" 0
src_sql:
drop table ptest purge
/
drop table ptestf purge
/
create table ptestf (af number,df number)
/
alter table ptestf add constraint PK_df primary key (df)
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add constraint PK_a primary key (a)
/
alter table ptest add constraint chk_b check(b>20)
/
alter table ptest add constraint unq_c unique(c)
/
alter table ptest add constraint fk_d foreign key (d) references ptestf(df)
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('PTEST','PTESTF') order by table_name,constraint_name
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/


case 45 "范围分区表：修改约束为disable" 0
src_sql:
drop table ptest purge
/
drop table ptestf purge
/
create table ptestf (af number,df number)
/
alter table ptestf add constraint PK_df primary key (df)
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add constraint PK_a primary key (a)
/
alter table ptest add constraint chk_b check(b>20)
/
alter table ptest add constraint unq_c unique(c)
/
alter table ptest add constraint fk_d foreign key (d) references ptestf(df)
/
alter table ptest modify constraint pk_a disable
/
alter table ptest modify constraint chk_b disable
/
alter table ptest modify constraint unq_c disable
/
alter table ptest modify constraint fk_d disable
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('PTEST','PTESTF') order by table_name,constraint_name
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/



case 46 "范围分区表：修改约束为enable" 0
src_sql:
drop table ptest purge
/
drop table ptestf purge
/
create table ptestf (af number,df number)
/
alter table ptestf add constraint PK_df primary key (df)
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add constraint PK_a primary key (a)
/
alter table ptest add constraint chk_b check(b>20)
/
alter table ptest add constraint unq_c unique(c)
/
alter table ptest add constraint fk_d foreign key (d) references ptestf(df)
/
alter table ptest modify constraint pk_a disable
/
alter table ptest modify constraint chk_b disable
/
alter table ptest modify constraint unq_c disable
/
alter table ptest modify constraint fk_d disable
/
alter table ptest modify constraint pk_a enable
/
alter table ptest modify constraint chk_b enable
/
alter table ptest modify constraint unq_c enable
/
alter table ptest modify constraint fk_d enable
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('PTEST','PTESTF') order by table_name,constraint_name
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/



case 47 "范围分区表：rename约束" 0
src_sql:
drop table ptest purge
/
drop table ptestf purge
/
create table ptestf (af number,df number)
/
alter table ptestf add constraint PK_df primary key (df)
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add constraint PK_a primary key (a)
/
alter table ptest add constraint chk_b check(b>20)
/
alter table ptest add constraint unq_c unique(c)
/
alter table ptest add constraint fk_d foreign key (d) references ptestf(df)
/
alter table ptest rename constraint pk_a to pk_aaa
/
alter table ptest rename constraint chk_b to chk_bbb
/
alter table ptest rename constraint unq_c to unq_ccc
/
alter table ptest rename constraint fk_d to fk_ddd
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('PTEST','PTESTF') order by table_name,constraint_name
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/



case 48 "范围分区表：删除约束" 0
src_sql:
drop table ptest purge
/
drop table ptestf purge
/
create table ptestf (af number,df number)
/
alter table ptestf add constraint PK_df primary key (df)
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add constraint PK_a primary key (a)
/
alter table ptest add constraint chk_b check(b>20)
/
alter table ptest add constraint unq_c unique(c)
/
alter table ptest add constraint fk_d foreign key (d) references ptestf(df)
/
alter table ptest drop constraint pk_a
/
alter table ptest drop constraint chk_b
/
alter table ptest drop constraint unq_c
/
alter table ptest drop constraint fk_d
/

tgt_sql:
select table_name,constraint_name,constraint_type,status from user_constraints where table_name in('PTEST','PTESTF') order by table_name,constraint_name
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/



case 49 "范围分区表：增加列(单列、多列)" 0
src_sql:
drop table ptest purge
/
drop table ptestf purge
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add ac1 varchar2(20)
/
alter table ptest add(ac2 varchar2(20),ac3 number(8) default 200 not null )
/
insert into ptest values(9,15,105,1005,'ym','ym1',2)
/
commit
/

tgt_sql:
select table_name,constraint_type,status from user_constraints where table_name in('PTEST')
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select column_name,data_type,nullable from user_tab_cols where table_name='PTEST' order by column_name
/
select * from ptest
/



case 50 "范围分区表：rename列名" 0
src_sql:
drop table ptest purge
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add ac1 varchar2(20)
/
alter table ptest add(ac2 varchar2(20),ac3 number(8) default 200 not null )
/
insert into ptest values(8,15,105,1005,'ym','ym1',2)
/
commit
/
alter table ptest rename column ac1 to accc1
/
alter table ptest rename column ac3 to accc3
/
insert into ptest values(9,16,106,1006,'ymm','ymm1',22)
/
commit
/

tgt_sql:
select table_name,constraint_type,status from user_constraints where table_name in('PTEST')
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select column_name,data_type,nullable from user_tab_cols where table_name='PTEST' order by column_name
/
select * from ptest order by a
/



case 51 "范围分区表：修改数据类型(单列、多列)" 0
src_sql:
drop table ptest purge
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/

alter table ptest add(ac1 varchar2(20),ac2 varchar2(20),ac3 number  default 200 not null)
/
alter table ptest  modify ac1 number
/
alter table ptest  modify (ac2 number,ac3 varchar2(20))
/
insert into ptest values(11,15,105,1005,2,20,'ym1')
/
commit
/

tgt_sql:
select table_name,constraint_type,status from user_constraints where table_name in('PTEST')
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select column_name,data_type,nullable from user_tab_cols where table_name='PTEST' order by column_name
/
select * from ptest order by a
/



case 52 "范围分区表：删除列(单列、多列)" 0
src_sql:
drop table ptest purge
/
create table ptest (a number, b number,c number,d number) partition  by range (a) (
       partition p1   values less than (10000) tablespace users,
       partition pmax values less than (maxvalue) tablespace system )
/
alter table ptest add ac1 number
/
alter table ptest add(ac2 number,ac3 varchar2(20),ac4 number(8) default 200 not null )
/
insert into ptest values(11,15,105,1005,2,20,'ym1',300)
/
commit
/
alter table ptest drop column ac1
/
alter table ptest drop (ac2,ac3,ac4)
/
insert into ptest values(12,16,106,1006)
/
commit
/

tgt_sql:
select table_name,constraint_type,status from user_constraints where table_name in('PTEST')
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='PTEST' order by partition_name
/
select column_name,data_type,nullable from user_tab_cols where table_name='PTEST' order by column_name
/
select * from ptest order by a
/