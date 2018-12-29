 case 429 "HASH分区表：建立：不指定分区名称，循环使用表空间" 0
        src_sql:
            drop table dds_dept purge 
            /
            create table dds_dept ( deptno number, deptname varchar2(32) )
                   partition by hash(deptno) partitions 4
                   store in (users, system)
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
            
            
 case 430 "HASH分区表：建立：指定分区名称，为每个分区指定表空间" 0
        src_sql:
             drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/


 case 431 "HASH分区表：INSERT 记录" 0
        src_sql:
             drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
            commit
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/

 case 432 "HASH分区表：UPDATE 记录" 0
        src_sql:
             drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
            commit
            /
            update dds_dept set salmount=1000000-rownum
            /
            commit
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/

 case 433 "HASH分区表：增加分区：分区未命名" 0
        src_sql:
             drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
            /
            alter table dds_dept add partition
            /
            update dds_dept set salmount=10000-rownum
            /
            commit
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' and partition_name not like 'SYS_%' order by partition_name
/
select tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' and partition_name like 'SYS_%' order by partition_name
/
select * from dds_dept order by deptno
/

            
 case 434 "HASH分区表：增加分区：分区有命名" 0
        src_sql:
             drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
			/
            alter table dds_dept add partition p6
            /
            alter table dds_dept add partition p7
            /
            alter table dds_dept add partition p8
            /
            update dds_dept set salmount=10000-rownum
            /
            commit
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/


 case 435 "HASH分区表：分区改名" 0
        src_sql:
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
			/
            alter table dds_dept rename partition p2 to p2_x
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/

 case 436 "HASH分区表：分区TRUNCATE" 0
        src_sql:
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
            update dds_dept set salmount=1000000-rownum
            /
            commit
            /
            alter table dds_dept truncate partition p2
            /
            update dds_dept set salmount=1000000-rownum
            /
            commit
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/


 case 437 "HASH分区表：分区: 交换分区: 交换第一个分区" 0
        src_sql:
            drop table swap_t purge
            /
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            / 
			commit
			/
            create table swap_t as select * from dds_dept where 1=0
            /
            insert into swap_t
                   select deptno, substr(deptname,1,2)||'GUO' AS deptname,salmount+2000 from dds_dept partition (p1)
            /
			commit
			/
            alter table dds_dept exchange partition p1 with table swap_t
            /
            update dds_dept partition (p1) set salmount=salmount+10
            /
            commit
            /
        tgt_sql:
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','SWAP_T') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno,deptname
/
select * from swap_t order by deptno,deptname
/

 case 438 "HASH分区表：分区: 交换分区: 交换中间的分区" 0
        src_sql:
            drop table swap_t purge
            /
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
			/
            create table swap_t as select * from dds_dept where 1=0
            /
            insert into swap_t
                   select deptno, substr(deptname,1,2)||'GUO',salmount+2000 from dds_dept partition (p3)
            /
			commit
			/
            alter table dds_dept exchange partition p3 with table swap_t
            /
            update dds_dept set salmount=1234+rownum
            /
            commit
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','SWAP_T') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno,deptname
/
select * from swap_t order by deptno,deptname
/

 case 439 "HASH分区表：分区: 移动分区（移动到相同表空间）:第一个分区" 0
        src_sql:
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
			/
            alter table dds_dept move partition p1
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/


 case 440 "HASH分区表：分区: 移动分区（移动到相同表空间）:中间分区" 0
        src_sql:
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
			/
            alter table dds_dept move partition p2
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/


 case 441 "HASH分区表：分区: 移动分区（移动到相同表空间）:最后一个分区" 0
        src_sql:
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
			/
            alter table dds_dept move partition p4
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/



 case 442 "HASH分区表：分区: 移动分区（移动到其它表空间）" 0
        src_sql:
            drop table swap_t
            /
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
			commit
			/
            alter table dds_dept move partition p1 tablespace system
            /
tgt_sql:
select object_name,object_type from user_objects where object_name in('DDS_DEPT','PK_H') order by object_name,object_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='DDS_DEPT'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='DDS_DEPT' order by partition_name
/
select * from dds_dept order by deptno
/


 case 443 "HASH分区表：删除HASH分区表" 0
        src_sql:
            drop table swap_t purge
            /
            drop table dds_dept purge
            /
            create table dds_dept ( deptno number, deptname varchar2(32), salmount number )
                  partition by hash(deptno) (
                    partition p1 tablespace users,
                    partition p2 tablespace users,
                    partition p3 tablespace system,
                    partition p4 tablespace system  )
            /
            alter table dds_dept add constraint PK_H primary key (deptno)
            /
            INSERT INTO dds_dept VALUES ( 1, 'AA01', 1 )
            /
            INSERT INTO dds_dept VALUES ( 2, 'AA02', 2 )
            /
            INSERT INTO dds_dept VALUES ( 3, 'AA03', 3 )
            /
            INSERT INTO dds_dept VALUES ( 4, 'AA04', 4 )
            /
            INSERT INTO dds_dept VALUES ( 5, 'AA05', 5 )
            /
            INSERT INTO dds_dept VALUES ( 6, 'AA06', 6 )
            /
            INSERT INTO dds_dept VALUES ( 7, 'AA07', 7 )
            /
            INSERT INTO dds_dept VALUES ( 8, 'AA08', 8 )
            /
            INSERT INTO dds_dept VALUES ( 9, 'AA09', 9 )
            /
            INSERT INTO dds_dept VALUES (10, 'AA10',10 )
            /
            INSERT INTO dds_dept VALUES (11, 'AA11',11 )
            /
            INSERT INTO dds_dept VALUES (12, 'AA12',12 )
            /
            INSERT INTO dds_dept VALUES (13, 'AA13',13 )
            /
            INSERT INTO dds_dept VALUES (14, 'AA14',14 )
            /
            INSERT INTO dds_dept VALUES (15, 'AA15',15 )
            /
            INSERT INTO dds_dept VALUES (16, 'AA16',16 )
            /
            INSERT INTO dds_dept VALUES (17, 'AA17',17 )
            /
            INSERT INTO dds_dept VALUES (18, 'AA18',18 )
            /
            INSERT INTO dds_dept VALUES (19, 'AA19',19 )
            /
            INSERT INTO dds_dept VALUES (20, 'AA20',20 )
            /
            commit
            /
            drop table dds_dept purge
            /
tgt_sql:
select count(*) from user_objects where object_name = 'DDS_DEPT'
/