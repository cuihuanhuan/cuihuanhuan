
 case 1 "HASH分区表(一普通索引,一LOCAL索引)：建立：不指定分区名称，循环使用表空间" 0
        src_sql:
            drop table objects
            /
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32) )
                   partition by hash(deptno) partitions 4
                   store in (users, system)
            /

        tgt_sql:
            select count(*) from user_tables where table_name='dds_dept'
            /
            select count(*) from user_objects where object_name='dds_dept' and object_type='TABLE PARTITION'
            /
            select partitioning_type from user_part_tables where table_name='dds_dept'
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=1
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=2
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=3
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=4
            /
            
 case 2 "HASH分区表(一普通索引,一LOCAL索引)：建立：指定分区名称，为每个分区指定表空间" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /

        tgt_sql:
            select count(*) from user_tables where table_name='dds_dept'
            /
            select count(*) from user_objects where object_name='dds_dept' and object_type='TABLE PARTITION'
            /
            select partitioning_type from user_part_tables where table_name='dds_dept'
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=1
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=2
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=3
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=4
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=4
            /
            select partition_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=1
            /
            select partition_name from user_tab_partitions where table_name='dds_dept' and PARTITION_POSITION=3
            /
            
 case 3 "HASH分区表(一普通索引,一LOCAL索引)：INSERT 记录" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            commit
            /

        tgt_sql:
            select count(*) from "dds_dept"
            /
            select count(*) from "dds_dept" partition ( p1 )
            /
            select count(*) from "dds_dept" partition ( p2 )
            /
            select count(*) from "dds_dept" partition ( p3 )
            /
            select count(*) from "dds_dept" partition ( p4 )
            /
            
 case 4 "HASH分区表(一普通索引,一LOCAL索引)：UPDATE 记录" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /

        tgt_sql:
            select sum(salmount) from "dds_dept"
            /
            select sum(salmount) from "dds_dept" partition ( p1 )
            /
            select sum(salmount) from "dds_dept" partition ( p4 )
            /
            
 case 5 "HASH分区表(一普通索引,一LOCAL索引)：增加分区：分区未命名" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" add partition
            /
            update "dds_dept" set salmount=10000-rownum
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_objects where object_name='dds_dept' and object_type='TABLE PARTITION'
            /
            select sum(salmount) from "dds_dept"
            /
            select count(*) from "dds_dept" partition ( p1 )
            /
            select count(*) from "dds_dept" partition ( p2 )
            /
            select count(*) from "dds_dept" partition ( p3 )
            /
            select count(*) from "dds_dept" partition ( p4 )
            /
            select sum(salmount) from "dds_dept" partition ( p1 )
            /
            select sum(salmount) from "dds_dept" partition ( p2 )
            /
            select sum(salmount) from "dds_dept" partition ( p3 )
            /
            select sum(salmount) from "dds_dept" partition ( p4 )
            /

 case 6 "HASH分区表(一普通索引,一LOCAL索引)：增加分区：分区有命名" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" add partition p6
            /
            alter table "dds_dept" add partition p7
            /
            alter table "dds_dept" add partition p8
            /
            update "dds_dept" set salmount=12345-rownum
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_objects where object_name='dds_dept' and object_type='TABLE PARTITION'
            /
            select sum(salmount) from "dds_dept"
            /
            select count(*) from "dds_dept" partition ( p1 )
            /
            select count(*) from "dds_dept" partition ( p2 )
            /
            select count(*) from "dds_dept" partition ( p3 )
            /
            select count(*) from "dds_dept" partition ( p4 )
            /
            select sum(salmount) from "dds_dept" partition ( p1 )
            /
            select sum(salmount) from "dds_dept" partition ( p2 )
            /
            select sum(salmount) from "dds_dept" partition ( p3 )
            /
            select sum(salmount) from "dds_dept" partition ( p4 )
            /  
            
 case 7 "HASH分区表(一普通索引,一LOCAL索引)：分区改名" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" rename partition p3 to p3_x
            /
            commit
            /

        tgt_sql:
            select count(*) from user_tab_partitions where table_name='dds_dept' and partition_name='P3'
            /
            select count(*) from user_tab_partitions where table_name='dds_dept' and partition_name='P3_X'
            /
			select sum(salmount) from "dds_dept"
            /
            select count(*) from "dds_dept"
            /
            
 case 8 "HASH分区表(一普通索引,一LOCAL索引)：分区TRUNCATE" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" truncate partition p3
            /
            alter index dds_dept_idx1 rebuild
            /
            drop index dds_dept_idx2
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            insert into "dds_dept" select object_id, object_name, object_id from dba_objects where rownum<201
            /
            update "dds_dept" set salmount=987+rownum
            /
            commit
            /
            
        tgt_sql:
            select count(*) from "dds_dept"
            /
            select to_char(sum(deptno)) from "dds_dept"
            /
            select to_char(sum(salmount)) from "dds_dept"
            /
            select count(*) from "dds_dept" partition ( p3 )
            /
            
 case 9 "HASH分区表(一普通索引,一LOCAL索引)：分区: 交换分区: 交换第一个分区" 0
        src_sql:
            drop table swap_t
            /
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            create table swap_t as select * from "dds_dept" where 1=0
            /
            insert into "dds_dept" SELECT object_id, object_name, object_id from dba_objects where rownum<201
            /
            insert into swap_t
                   select deptno, substr(deptname,1,2)||'GUO' AS deptname,salmount+2000 from "dds_dept" partition (p1)
            /
			commit
			/
            alter table "dds_dept" exchange partition p1 with table swap_t
            /
            alter index dds_dept_idx1 rebuild
            /
            drop index dds_dept_idx2
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            update "dds_dept" partition (p1) set salmount=salmount+10
            /
            commit
            /
            
        tgt_sql:
            select count(*) from "dds_dept"
            /
            select to_char(sum(deptno)) from "dds_dept"
            /
            select count(*) from "dds_dept" partition (p1)
            /
            select to_char(sum(salmount)) from "dds_dept" partition (p1)
            /
            select count(*) from swap_t
            /
            select to_char(sum(salmount)) from swap_t
            /            

 case 10 "HASH分区表(一普通索引,一LOCAL索引)：分区: 交换分区: 交换中间的分区" 0
        src_sql:
            drop table swap_t
            /
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            create table swap_t as select * from "dds_dept" where 1=0
            /
            insert into "dds_dept" SELECT object_id, object_name, object_id from dba_objects where rownum<201
            /
            insert into swap_t
                   select deptno, substr(deptname,1,2)||'GUO',salmount+2000 from "dds_dept" partition (p3)
            /
			commit
			/
            alter table "dds_dept" exchange partition p3 with table swap_t
            /
            alter index dds_dept_idx1 rebuild
            /
            drop index dds_dept_idx2
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            update "dds_dept" set salmount=1234+rownum
            /
            commit
            /
            
        tgt_sql:
            select count(*) from "dds_dept"
            /
            select to_char(sum(deptno)) from "dds_dept"
            /
            select count(*) from "dds_dept" partition (p3)
            /
            select to_char(sum(salmount)) from "dds_dept" partition (p3)
            /
            select count(*) from swap_t
            /
            select to_char(sum(salmount)) from swap_t
            /     

 case 11 "HASH分区表(一普通索引,一LOCAL索引)：分区: 移动分区（移动到相同表空间）:第一个分区" 0
        src_sql:
            drop table swap_t
            /
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" move partition p1
            /
            
        tgt_sql:
            select count(*) from "dds_dept"
            /
            select to_char(sum(deptno)) from "dds_dept"
            /
            select count(*) from "dds_dept" partition (p1)
            /
            select to_char(sum(salmount)) from "dds_dept" partition (p1)
            /
            
 case 12 "HASH分区表(一普通索引,一LOCAL索引)：分区: 移动分区（移动到相同表空间）:中间分区" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" move partition p3
            /
            
        tgt_sql:
            select count(*) from "dds_dept"
            /
            select to_char(sum(deptno)) from "dds_dept"
            /
            select count(*) from "dds_dept" partition (p3)
            /
            select to_char(sum(salmount)) from "dds_dept" partition (p3)
            /
            

 case 13 "HASH分区表(一普通索引,一LOCAL索引)：分区: 移动分区（移动到相同表空间）:最后一个分区" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" move partition p4
            /
            
        tgt_sql:
            select count(*) from "dds_dept"
            /
            select to_char(sum(deptno)) from "dds_dept"
            /
            select count(*) from "dds_dept" partition (p4)
            /
            select to_char(sum(salmount)) from "dds_dept" partition (p4)
            /
            


 case 14 "HASH分区表(一普通索引,一LOCAL索引)：分区: 移动分区（移动到其它表空间）" 0
        src_sql:
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            alter table "dds_dept" move partition p1 tablespace system
            /
            commit
            /
            
        tgt_sql:
            select count(*) from "dds_dept"
            /
            select tablespace_name from user_tab_partitions where table_name='dds_dept' and partition_name='P1'
            /            
            select to_char(sum(deptno)) from "dds_dept"
            /
            select count(*) from "dds_dept" partition (p1)
            /
            select to_char(sum(salmount)) from "dds_dept" partition (p1)
            /
            

 case 15 "HASH分区表(一普通索引,一LOCAL索引)：删除HASH分区表" 0
        src_sql:
            drop table swap_t
            /
            drop table "dds_dept"
            /
            create table "dds_dept" ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            create index dds_dept_idx1 on "dds_dept" ( deptname, deptno )
            /
            create index dds_dept_idx2 on "dds_dept" ( deptno ) local
            /
            INSERT INTO "dds_dept" VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO "dds_dept" VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO "dds_dept" VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO "dds_dept" VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO "dds_dept" VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO "dds_dept" VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO "dds_dept" VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO "dds_dept" VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO "dds_dept" VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO "dds_dept" VALUES (10, 'AA10',10 )
            /
            INSERT INTO "dds_dept" VALUES (11, 'AA11',11 )
            /
            INSERT INTO "dds_dept" VALUES (12, 'AA12',12 )
            /
            INSERT INTO "dds_dept" VALUES (13, 'AA13',13 )
            /
            INSERT INTO "dds_dept" VALUES (14, 'AA14',14 )
            /
            INSERT INTO "dds_dept" VALUES (15, 'AA15',15 )
            /
            INSERT INTO "dds_dept" VALUES (16, 'AA16',16 )
            /
            INSERT INTO "dds_dept" VALUES (17, 'AA17',17 )
            /
            INSERT INTO "dds_dept" VALUES (18, 'AA18',18 )
            /
            INSERT INTO "dds_dept" VALUES (19, 'AA19',19 )
            /
            INSERT INTO "dds_dept" VALUES (20, 'AA20',20 )
            /
            update "dds_dept" set salmount=1000000-rownum
            /
            commit
            /
            drop table "dds_dept"
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='dds_dept'
            /