
 case 1 "范围分区表：建立普通索引 create index .. on .. (..)" 0
        src_sql:
            drop index "sales_idx001"
            /
            drop index "sales_idx002"
            /
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_sales_id on sales ( id )
            /

        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_SALES_ID'
            /

            
 case 2 "范围分区表：删除普通索引" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_sales_id on sales ( id )
            /
            drop index idx_sales_id
            /

        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_SALES_ID'
            /

            
 case 3 "范围分区表：建立 non-prefix-local 索引 create index .. on .. (..) LOCAL" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_sales_id_np on sales ( id ) local
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_SALES_ID_NP'
            /
            select count(*) from user_ind_partitions where INDEX_NAME='IDX_SALES_ID_NP'
            /
            select high_value from user_ind_partitions where INDEX_NAME='IDX_SALES_ID_NP' and partition_name='P3'
            /            



 case 4 "范围分区表：删除 non-prefix-local 索引" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_sales_id_np on sales ( id ) local
            /
            drop index idx_sales_id_np
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_SALES_ID_NP'
            /


 case 5 "范围分区表：建立 prefix-local 索引 create index .. on .. (..) LOCAL" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_year_local on sales ( year ) LOCAL
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_YEAR_LOCAL'
            /
            select index_name||','||partitioning_type||','||partition_count from user_part_indexes where table_name='SALES' and index_name='IDX_YEAR_LOCAL'
            /            


 case 6 "范围分区表：删除 prefix-local 索引" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_year_local on sales ( year ) LOCAL
            /
            drop index idx_year_local
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_YEAR_LOCAL'
            /


 case 7 "范围分区表：建立 GLOBAL RANGE-PARTITIONED INDEX" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_year_global_range ON sales(year)
            global partition by range ( year ) (
               partition pm1_ix values less than ( 2000 ),
               partition pm2_ix values less than ( 2008 ),
               partition pmm_ix values less than ( MAXVALUE)
            )
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_YEAR_GLOBAL_RANGE'
            /
            select count(*) from user_ind_partitions where INDEX_NAME='IDX_YEAR_GLOBAL_RANGE'
            /
            select high_value from user_ind_partitions where INDEX_NAME='IDX_YEAR_GLOBAL_RANGE' and partition_name='PM2_IX'
            /


 case 8 "范围分区表：删除 GLOBAL RANGE-PARTITIONED INDEX" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_year_global_range ON sales(year)
            global partition by range ( year ) (
               partition pm1_ix values less than ( 2000 ),
               partition pm2_ix values less than ( 2008 ),
               partition pmm_ix values less than ( MAXVALUE)
            )
            /
            drop index idx_year_global_range
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_YEAR_GLOBAL_RANGE'
            /


 case 9 "范围分区表：建立 GLOBAL Hash-PARTITIONED INDEX" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_year_global_hash ON sales(year)
              global partition by hash ( year ) (
                partition pm1_ix,
                partition pm2_ix,
                partition pm3_ix,
                partition pm4_ix
              )
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_YEAR_GLOBAL_RANGE'
            /
            select count(*) from user_ind_partitions where INDEX_NAME='IDX_YEAR_GLOBAL_RANGE'
            /
            select high_value from user_ind_partitions where INDEX_NAME='IDX_YEAR_GLOBAL_RANGE' and partition_name='PM2_IX'
            /


 case 10 "范围分区表：删除 GLOBAL Hash-PARTITIONED INDEX" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index idx_year_global_hash ON sales(year)
              global partition by hash ( year ) (
                partition pm1_ix,
                partition pm2_ix,
                partition pm3_ix,
                partition pm4_ix
              )
            /
            drop index idx_year_global_hash
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_YEAR_GLOBAL_HASH'
            /


 case 11 "范围分区表(一普通索引)：SPLIT分区：分裂的分区均包含数据：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
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
            select count(*) from ptest
            /


 case 12 "范围分区表(一普通索引)：SPLIT分区：分裂的分区均包含数据：分裂分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
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
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P1' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='PMAX' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from ptest partition (p1)
            /
            select count(*) from ptest partition (pmax)
            /

 case 13 "范围分区表(一普通索引)：SPLIT分区：分裂的分区均包含数据：修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /            
            alter table ptest split partition pmax at (90) into ( partition p1 , partition pmax)
            /
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            commit
            /
            
        tgt_sql:
            select sum(b) from ptest
            /


 case 14 "范围分区表(一普通索引)：SPLIT分区：分裂的分区第一个包含数据：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a) ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
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
            select count(*) from ptest
            /



 case 15 "范围分区表(一普通索引)：SPLIT分区：分裂的分区第一个包含数据：分裂分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            
            
        tgt_sql:
            select count(*) from ptest
            /
            select * from ptest
            /

 case 16 "范围分区表(一普通索引)：SPLIT分区：分裂的分区第一个包含数据：修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            commit
            /
            
        tgt_sql:
            select sum(b) from ptest
            /         



 case 17 "范围分区表(一普通索引)：SPLIT分区：分裂的分区第二个包含数据：建立分区表" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
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
            select count(*) from ptest
            /


 case 18 "范围分区表(一普通索引)：SPLIT分区：分裂的分区第二个包含数据：分裂分区" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
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
            alter table ptest split partition pmax at (50) into ( partition p1 , partition pmax)
            /
            
        tgt_sql:
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P1' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='PMAX' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from ptest partition (p1)
            /
            select count(*) from ptest partition (pmax)
            /

 case 19 "范围分区表(一普通索引)：SPLIT分区：分裂的分区第二个包含数据：修改数据" 0
        src_sql:
            drop table ptest purge
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
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
            select sum(b) from ptest
            /    


 case 20 "范围分区表(一普通索引)：删除分区：删除的分区包含数据：建立分区表" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            select count(*) from ptest
            /
            select count(*) from ptest partition (p1)
            /
            select sum(b) from ptest partition (p2)
            /
            select count(*) from ptest partition (p3)
            /
            select sum(b) from ptest partition (p4)
            /
            select count(*) from ptest partition (PMAX)
            /




 case 21 "范围分区表(一普通索引)：删除分区：删除的分区包含数据：删除第三个分区" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            commit
            /
          
        tgt_sql:
            select count(*) from user_objects where object_name='PTEST' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P3' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from ptest
            /



 case 22 "范围分区表(一普通索引)：删除分区：删除的分区包含数据：修改数据" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            commit
            /
            
        tgt_sql:
            select sum(b) from ptest
            /


 case 23 "范围分区表(一普通索引)：删除分区：删除的分区包含数据：删除第一个分区" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest drop partition p1
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_objects where object_name='PTEST' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P1' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from ptest
            /
            select count(*) from ptest
            /

 case 24 "范围分区表(一普通索引)：删除分区：删除的分区包含数据：再次修改数据" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            commit
            /
            
        tgt_sql:
            select sum(b) from ptest
            /


 case 25 "范围分区表(一普通索引)：TRUNCATE 分区" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest truncate partition p4 update global indexes
            /
            commit
            /
           
        tgt_sql:
            select count(*) from ptest partition (p4)
            /

 case 26 "范围分区表(一普通索引)：改名分区" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest truncate partition p4 update global indexes
            /
            alter table ptest rename partition p4 to p4_4
            /
            commit
            /
           
        tgt_sql:
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P4' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P4_4' and OBJECT_TYPE='TABLE PARTITION'
            /

 case 27 "范围分区表(一普通索引)：删除测试分区表" 0
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
            create index "ptest_idx001" on ptest ( a, b )
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
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            update ptest set b=b+1
            /
            alter table ptest truncate partition p4 update global indexes
            /
            alter table ptest rename partition p4 to p4_4
            /
            drop table ptest purge
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='PTEST'
            /


 case 28 "范围分区表(一普通索引)：添加分区：建立分区表" 0
        src_sql:
            drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /
            select count(*) from user_tab_partitions where table_name='SALES'
            /
            select high_value from user_tab_partitions where table_name='SALES' and partition_name='P1'
            /
            select high_value from user_tab_partitions where table_name='SALES' and partition_name='P2'
            /
            select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P2'
            /
            select to_char(partition_position) from user_tab_partitions where table_name='SALES' and partition_name='P2'
            /
            select row_movement from user_tables where table_name='SALES'
            /

 case 29 "范围分区表(一普通索引)：ENABLE ROW MOVEMENT" 0
        src_sql:
            drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            alter table sales enable row movement
            /
            
        tgt_sql:
            select row_movement from user_tables where table_name='SALES'
            /

 case 30 "范围分区表(一普通索引)：DISABLE ROW MOVEMENT" 0
        src_sql:
            drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            alter table sales enable row movement
            /
            alter table sales disable row movement
            /
            
        tgt_sql:
            select row_movement from user_tables where table_name='SALES'
            /


 case 31 "范围分区表(一普通索引)：添加分区：增加分区" 0
        src_sql:
            drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            alter table sales add  partition p5 values less than (2005) tablespace system
            /
            
        tgt_sql:
            select count(*) from user_tab_partitions where table_name='SALES' and partition_name='P5'
            /
            select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P5'
            /


 case 32 "范围分区表(一普通索引)：交换分区：建立待交换的表 swap_t" 0
        src_sql:
            drop table swap_t purge
            /
            drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            alter table sales add  partition p5 values less than (2005) tablespace system
            /
            create table swap_t as select * from sales where 1=0
            /
            insert into sales values ( 1,2000)
            /
            insert into swap_t values ( 2,2000)
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='SWAP_T'
            /
            select count(*) from sales partition ( p1 )
            /
            select count(*) from swap_t
            /

 case 33 "范围分区表(一普通索引)：交换分区：执行交换" 0
        src_sql:
            drop table sales purge
            /
            drop table swap_t purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            alter table sales add  partition p5 values less than (2005) tablespace system
            /
            create table swap_t as select * from sales where 1=0
            /
            insert into sales values ( 1,2000)
            /
            insert into swap_t values ( 2,2000)
            /
            alter table sales exchange partition p1 with table swap_t
            /
            alter index "sales_idx001" rebuild
            /
            commit
            /
            
        tgt_sql:
            select to_char(sum(id)) from sales partition ( p1 )
            /
            select to_char(sum(id)) from swap_t
            /
            
 case 34 "范围分区表(一普通索引)：交换分区：执行交换完成后看修改数据是否正确" 0
        src_sql:
            drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            alter table sales add  partition p5 values less than (2005) tablespace system
            /

            drop table swap_t purge
            /
            create table swap_t as select * from sales where 1=0
            /
            insert into sales values ( 1,2000)
            /
            insert into swap_t values ( 2,2000)
            /
            alter table sales exchange partition p1 with table swap_t
            /
            alter index "sales_idx001" rebuild
            /
            update sales partition (p1) set id=1000000+id
            /
            update swap_t set id=90000+id
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p1 )
            /
            select to_char(sum(id)) from swap_t
            /


 case 35 "范围分区表(一普通索引)：合并分区[合并方均有数据]" 0
        src_sql:
            drop table swap_t purge
            /
			drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            insert into sales values ( 200, 2001 )
            /
            insert into sales values ( 112, 2000 )
            /
            commit
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            alter index "sales_idx001" rebuild
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /


 case 36 "范围分区表(一普通索引)：合并分区[合并方均有数据]：合并完成后修改数据" 0
        src_sql:
            drop table sales purge
            /
            create table sales (
                  id        number,
                  year      number(4) not null
            ) partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            insert into sales values ( 200, 2001 )
            /
            insert into sales values ( 112, 2000 )
            /
            commit
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            alter index "sales_idx001" rebuild
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /


 case 37 "范围分区表(一普通索引)：合并分区[合并方第一方有数据]：建立分区表" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2000 )
            /
            commit
            /

        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /


 case 38 "范围分区表(一普通索引)：合并分区[合并方第一方有数据]" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2000 )
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /

 case 39 "范围分区表(一普通索引)：合并分区[合并方第一方有数据]：合并完成后修改数据" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2000 )
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /



 case 40 "范围分区表(一普通索引)：合并分区[合并方第二方有数据]：建立分区表" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /

 case 41 "范围分区表(一普通索引)：合并分区[合并方第二方有数据]" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2001 )
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /


 case 42 "范围分区表(一普通索引)：合并分区[合并方第二方有数据]：合并完成后修改数据" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2001 )
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /



 case 43 "范围分区表(一普通索引)：移动分区[移动到相同表空间]：建立分区表" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /


 case 44 "范围分区表(一普通索引)：移动分区[移动到相同表空间]" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2001 )
            /
            alter table sales move partition p2
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /



 case 45 "范围分区表(一普通索引)：移动分区[移动到相同表空间]：移动完成后修改数据" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            insert into sales values ( 1, 2001 )
            /
            alter table sales move partition p2
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /



 case 46 "范围分区表(一普通索引)：移动分区[移动到不同表空间]：建立分区表" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /



 case 47 "范围分区表(一普通索引)：移动分区[移动到不同表空间]" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            insert into sales values ( 1, 2001 )
            /
            alter table sales move partition p2 tablespace users
            /
            alter index "sales_idx001" rebuild
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /


 case 48 "范围分区表(一普通索引)：移动分区[移动到不同表空间]：移动完成后修改数据" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            insert into sales values ( 1, 2001 )
            /
            alter table sales move partition p2 tablespace users
            /
            alter index "sales_idx001" rebuild
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /



 case 49 "范围分区表(一普通索引)：建立普通索引 create index .. on .. (..)" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            insert into sales values ( 1, 2001 )
            /

            alter table sales move partition p2 tablespace users
            /
            alter index "sales_idx001" rebuild
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            drop index "sales_idx001"
            /
            create index idx_sales_id on sales ( id )
            /
            commit
            /
            
        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_SALES_ID'
            /

 case 50 "范围分区表(一普通索引)：删除普通索引" 0
        src_sql:
            drop table sales purge
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002) tablespace system,
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            insert into sales values ( 1, 2001 )
            /
            alter table sales move partition p2 tablespace users
            /
            alter index "sales_idx001" rebuild
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            drop index "sales_idx001"
            /
            create index idx_sales_id on sales ( id )
            /
            drop index idx_sales_id
            /
            commit
            /
            
        tgt_sql:
            select to_char(sum(id)) from sales partition ( p2 )
            /
            select count(*) from user_indexes where table_name='SALES' and index_name='IDX_SALES_ID'
            /

