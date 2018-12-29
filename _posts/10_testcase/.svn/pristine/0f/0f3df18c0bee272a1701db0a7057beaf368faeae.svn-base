
 case 111 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区均包含数据：建立分区表" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/


 case 112 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区均包含数据：分裂分区" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
			alter index "ptest_idx001" rebuild
			/
			drop index "ptest_idx002"
			/
            create index "ptest_idx002" on ptest ( b ) local
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
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/
            
 case 113 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区均包含数据：修改数据" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
            alter index "ptest_idx001" rebuild
            /
			drop index "ptest_idx002"
			/
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
            commit
            /

        tgt_sql:
            select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/

 case 114 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区第一个包含数据：建立分区表" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/


 case 115 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区第一个包含数据：分裂分区" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
			drop index "ptest_idx002"
			/
            create index "ptest_idx002" on ptest ( b ) local
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
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/
            
 case 116 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区第一个包含数据：修改数据" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
			drop index "ptest_idx002"
			/
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
            commit
            /

        tgt_sql:
            select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/

 case 117 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区第二个包含数据：建立分区表" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/



 case 118 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区第二个包含数据：分裂分区" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/
            
 case 119 "范围分区表(1普通1LOCAL索引)：SPLIT分区：分裂的分区第二个包含数据：修改数据" 0
        src_sql:
            drop table ptest
            /
            create table ptest (a number, b number) partition  by range (a)
                   ( partition pmax values less than (maxvalue)  )
            /
            create index "ptest_idx001" on ptest ( a, b )
            /
            create index "ptest_idx002" on ptest ( b ) local
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
            update ptest set b=b+1
            /
            commit
            /

        tgt_sql:
            select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/


 case 120 "范围分区表(1普通1LOCAL索引)：删除分区：删除的分区包含数据：建立分区表" 0
        src_sql:
            drop table ptest
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
            create index "ptest_idx002" on ptest ( b ) local
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
            select sum(a) from ptest
            /
            select count(*) from ptest partition (p1)
            /
            select sum(a) from ptest partition (p1)
            /
            select count(*) from ptest partition (p2)
            /
            select sum(b) from ptest partition (p2)
            /
            select count(*) from ptest partition (p3)
            /
            select sum(a) from ptest partition (p3)
            /
            select count(*) from ptest partition (p4)
            /
            select sum(b) from ptest partition (p4)
            /
            select count(*) from ptest partition (PMAX)
            /
            select sum(a) from ptest partition (PMAX)
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/


 case 121 "范围分区表(1普通1LOCAL索引)：删除分区：删除的分区包含数据：删除第三个分区" 0
        src_sql:
            drop table ptest
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
            create index "ptest_idx002" on ptest ( b ) local
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
            select count(*) from user_objects where object_name='PTEST' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P3' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from ptest
            /
            select sum(a) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/

 case 122 "范围分区表(1普通1LOCAL索引)：删除分区：删除的分区包含数据：修改数据" 0
        src_sql:
            drop table ptest
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
            alter table ptest drop partition p3
            /
            alter index "ptest_idx001" rebuild
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
            commit
            /

        tgt_sql:
            select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/

 case 123 "范围分区表(1普通1LOCAL索引)：删除分区：删除的分区包含数据：删除第一个分区" 0
        src_sql:
            drop table ptest
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
            create index "ptest_idx002" on ptest ( b ) local
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
            alter table ptest drop partition p3
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
			commit
			/
            alter table ptest drop partition p1
            /

        tgt_sql:
            select count(*) from user_objects where object_name='PTEST' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P1' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from ptest
            /
            select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/

 case 124 "范围分区表(1普通1LOCAL索引)：删除分区：删除的分区包含数据：再次修改数据" 0
        src_sql:
            drop table ptest
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
            create index "ptest_idx002" on ptest ( b ) local
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
            alter table ptest drop partition p3
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
            commit
            /
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
            commit
            /

        tgt_sql:
            select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/


 case 125 "范围分区表(1普通1LOCAL索引)：TRUNCATE 分区" 0
        src_sql:
            drop table ptest
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
            create index "ptest_idx002" on ptest ( b ) local
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
            alter table ptest drop partition p3
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
			commit
			/
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
			commit
			/
            alter table ptest truncate partition p4 update global indexes
            /

        tgt_sql:
            select count(*) from ptest partition (p4)
            /
			select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/

 case 126 "范围分区表(1普通1LOCAL索引)：改名分区" 0
        src_sql:
            drop table ptest
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
            create index "ptest_idx002" on ptest ( b ) local
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
            alter table ptest drop partition p3
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
			commit
			/
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
			commit
			/
            alter table ptest truncate partition p4 update global indexes
            /
            alter table ptest rename partition p4 to p4_4
            /

        tgt_sql:
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P4' and OBJECT_TYPE='TABLE PARTITION'
            /
            select count(*) from user_objects where object_name='PTEST' and SUBOBJECT_NAME='P4_4' and OBJECT_TYPE='TABLE PARTITION'
            /
			select sum(b) from ptest
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='PTEST' order by index_name
			/

 case 127 "范围分区表(1普通1LOCAL索引)：删除测试分区表" 0
        src_sql:
            drop table ptest
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
            create index "ptest_idx002" on ptest ( b ) local
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
            alter table ptest drop partition p3
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
			commit
			/
            alter table ptest drop partition p1
            /
            alter index "ptest_idx001" rebuild
            /
            drop index "ptest_idx002"
            /
            create index "ptest_idx002" on ptest ( b ) local
            /
            update ptest set b=b+1
            /
			commit
			/
            alter table ptest truncate partition p4 update global indexes
            /
            alter table ptest rename partition p4 to p4_4
            /
            drop table ptest
            /

        tgt_sql:
            select count(*) from user_tables where table_name='PTEST'
            /

 case 128 "范围分区表(1普通1LOCAL索引)：添加分区：建立分区表" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
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
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/
            
 case 129 "范围分区表(1普通1LOCAL索引)：ENABLE ROW MOVEMENT" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
            /
            alter table sales enable row movement
            /

        tgt_sql:
            select row_movement from user_tables where table_name='SALES'
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 200 "范围分区表(1普通1LOCAL索引)：DISABLE ROW MOVEMENT" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
            /
            alter table sales enable row movement
            /
            alter table sales disable row movement
            /

        tgt_sql:
            select row_movement from user_tables where table_name='SALES'
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 201 "范围分区表(1普通1LOCAL索引)：添加分区：增加分区" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
            /
            alter table sales add  partition p5 values less than (2005) tablespace system
            /

        tgt_sql:
            select count(*) from user_tab_partitions where table_name='SALES' and partition_name='P5'
            /
            select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P5'
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 202 "范围分区表(1普通1LOCAL索引)：交换分区：建立待交换的表 swap_t" 0
        src_sql:
            drop table sales
            /
            drop table swap_t
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
            create index "sales_idx002" on sales ( year ) local
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
            select * from sales partition ( p1 )
            /
            select * from swap_t
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 203 "范围分区表(1普通1LOCAL索引)：交换分区：执行交换" 0
        src_sql:
            drop table sales
            /
			drop table swap_t
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
            create index "sales_idx002" on sales ( year ) local
            /
            create table swap_t as select * from sales where 1=0
            /
            insert into sales values ( 1,2000)
            /
            insert into swap_t values ( 2,1900)
            /
			commit
			/
            alter table sales exchange partition p1 with table swap_t
            /
            alter index "sales_idx001" rebuild
            /
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /

        tgt_sql:
            select * from sales partition ( p1 )
            /
            select * from swap_t
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 204 "范围分区表(1普通1LOCAL索引)：交换分区：执行交换完成后看修改数据是否正确" 0
        src_sql:
            drop table sales
            /
			drop table swap_t
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
            create index "sales_idx002" on sales ( year ) local
            /
            create table swap_t as select * from sales where 1=0
            /
            insert into sales values ( 1,2000)
            /
            insert into swap_t values ( 2,2000)
            /
			commit
			/
            alter table sales exchange partition p1 with table swap_t
            /
            alter index "sales_idx001" rebuild
            /
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /
            update sales partition (p1) set id=1000000+id
            /
            update swap_t set id=90000+id
            /
            commit
            /

        tgt_sql:
            select * from sales partition ( p1 )
            /
            select * from swap_t
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 205 "范围分区表(1普通1LOCAL索引)：合并分区[合并方均有数据]" 0
        src_sql:
            drop table sales
            /
            drop table swap_t
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
            create index "sales_idx002" on sales ( year ) local
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
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /

        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 206 "范围分区表(1普通1LOCAL索引)：合并分区[合并方均有数据]：合并完成后修改数据" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
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
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 207 "范围分区表(1普通1LOCAL索引)：合并分区[合并方第一方有数据]：建立分区表" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2000 )
            /
			commit
			/

        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /
			select * from sales order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/
            
 case 208 "范围分区表(1普通1LOCAL索引)：合并分区[合并方第一方有数据]" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2000 )
            /
            commit
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            alter index "sales_idx001" rebuild
            /
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /
        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/


 case 209 "范围分区表(1普通1LOCAL索引)：合并分区[合并方第一方有数据]：合并完成后修改数据" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
            create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2000 )
            /
            commit
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            alter index "sales_idx001" rebuild
            /
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/


 case 300 "范围分区表(1普通1LOCAL索引)：合并分区[合并方第二方有数据]：建立分区表" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
			create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /
			select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/
            
 case 301 "范围分区表(1普通1LOCAL索引)：合并分区[合并方第二方有数据]" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
			create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
            alter table sales merge partitions p1,p2 into partition p2
            /
            alter index "sales_idx001" rebuild
            /
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /
        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/


 case 302 "范围分区表(1普通1LOCAL索引)：合并分区[合并方第二方有数据]：合并完成后修改数据" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
			create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
			commit
			/
            alter table sales merge partitions p1,p2 into partition p2
            /
            alter index "sales_idx001" rebuild
            /
            drop index "sales_idx002"
            /
            create index "sales_idx002" on sales ( year ) local
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /
            
        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/


 case 303 "范围分区表(1普通1LOCAL索引)：移动分区[移动到相同表空间]：建立分区表" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
			create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
			commit
			/

        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 304 "范围分区表(1普通1LOCAL索引)：移动分区[移动到相同表空间]" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
			create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
            alter table sales move partition p2
            /

        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P2'
			/
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 305 "范围分区表(1普通1LOCAL索引)：移动分区[移动到相同表空间]：移动完成后修改数据" 0
        src_sql:
            drop table sales
            /
            create table sales ( id number, year number(4) not null )
            partition by range ( year ) (
              partition p1 values less than (2001),
              partition p2 values less than (2002),
              partition p3 values less than (2003),
              partition p4 values less than (2004)
            )
            /
			create index "sales_idx001" on sales ( id, year )
            /
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
            alter table sales move partition p2
            /
            update sales partition ( p2 ) set id=id+9000000
            /
            commit
            /

        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P2'
			/
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/


 case 306 "范围分区表(1普通1LOCAL索引)：移动分区[移动到不同表空间]：建立分区表" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
			commit
			/
        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P2'
			/
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/

 case 307 "范围分区表(1普通1LOCAL索引)：移动分区[移动到不同表空间]" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
            commit
            /
            alter table sales move partition p2 tablespace users
            /
            alter index "sales_idx001" rebuild
            /

        tgt_sql:
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P2'
			/
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/


 case 308 "范围分区表(1普通1LOCAL索引)：移动分区[移动到不同表空间]：移动完成后修改数据" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
            commit
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
            select * from sales order by id
            /
            select * from sales partition ( p2 )  order by id
            /
			select tablespace_name from user_tab_partitions where table_name='SALES' and partition_name='P2'
			/
			select index_name,index_type,table_name,tablespace_name from user_indexes where table_name='SALES' order by index_name
			/



 case 309 "范围分区表：删除范围分区表" 0
        src_sql:
            drop table sales
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
            create index "sales_idx002" on sales ( year ) local
            /
            insert into sales values ( 1, 2001 )
            /
			commit
			/
            alter table sales move partition p2 tablespace users
            /
            alter index "sales_idx001" rebuild
            /
            update sales partition ( p2 ) set id=id+9000000
            /
			commit
			/
            drop table SALES
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='SALES'
            /