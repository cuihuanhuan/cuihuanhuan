
 case 66 "分析（ANALYZE）普通表：首次分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test ( f1 int not null, f2 int )
            /
            create index dds_table_test_i on dds_table_test ( f1 )
            /
            insert into dds_table_test values ( 10,10 )
            /
            commit
            /
            analyze table dds_table_test compute statistics
            /


 case 67 "分析（ANALYZE）普通表：多次分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test ( f1 int not null, f2 int )
            /
            create index dds_table_test_i on dds_table_test ( f1 )
            /
            insert into dds_table_test values ( 10,10 )
            /
            commit
            /
            analyze table dds_table_test compute statistics
            /
            insert into dds_table_test values ( 10,10 )
            /
            commit
            /
            analyze table dds_table_test compute statistics
            /



 case 68 "分析（ANALYZE）普通表：删除分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test ( f1 int not null, f2 int )
            /
            create index dds_table_test_i on dds_table_test ( f1 )
            /
            insert into dds_table_test values ( 10,10 )
            /
            commit
            /
            analyze table dds_table_test compute statistics
            /
            analyze table dds_table_test delete statistics
            /



 case 69 "分析（ANALYZE）普通索引：分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test ( f1 int not null, f2 int )
            /
            create index dds_table_test_i on dds_table_test ( f1 )
            /
            insert into dds_table_test values ( 10,10 )
            /
            commit
            /
            analyze index dds_table_test_i compute statistics
            /



 case 70 "分析（ANALYZE）普通索引表：删除分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test ( f1 int not null, f2 int )
            /
            create index dds_table_test_i on dds_table_test ( f1 )
            /
            insert into dds_table_test values ( 10,10 )
            /
            commit
            /
            analyze index dds_table_test_i compute statistics
            /
            analyze index dds_table_test_i delete statistics
            /


 case 71 "分析（ANALYZE）分区表：表级别首次分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a number, b number) partition  by range (a) (
                  partition p1   values less than (1000),
                  partition pmax values less than (maxvalue)
            )
            /
            create index dds_table_test_i on dds_table_test ( a ) local
            /
            insert into dds_table_test values ( 10,10 )
            /
            insert into dds_table_test values ( 5000, 5000 )
            /
            commit
            /
            analyze table dds_table_test compute statistics
            /


 case 72 "分析（ANALYZE）分区表：表级别再次分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a number, b number) partition  by range (a) (
                  partition p1   values less than (1000),
                  partition pmax values less than (maxvalue)
            )
            /
            create index dds_table_test_i on dds_table_test ( a ) local
            /
            insert into dds_table_test values ( 10,10 )
            /
            insert into dds_table_test values ( 5000, 5000 )
            /
            commit
            /
            analyze table dds_table_test compute statistics
            /
            analyze table dds_table_test compute statistics
            /

            

 case 73 "分析（ANALYZE）分区表：表级别删除分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a number, b number) partition  by range (a) (
                  partition p1   values less than (1000),
                  partition pmax values less than (maxvalue)
            )
            /
            create index dds_table_test_i on dds_table_test ( a ) local
            /
            insert into dds_table_test values ( 10,10 )
            /
            insert into dds_table_test values ( 5000, 5000 )
            /
            commit
            /
            analyze table dds_table_test compute statistics
            /
            analyze table dds_table_test compute statistics
            /
            analyze table dds_table_test delete statistics
            /

            

 case 74 "分析（ANALYZE）分区表：分析一个分区" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a number, b number) partition  by range (a) (
                  partition p1   values less than (1000),
                  partition pmax values less than (maxvalue)
            )
            /
            create index dds_table_test_i on dds_table_test ( a ) local
            /
            insert into dds_table_test values ( 10,10 )
            /
            insert into dds_table_test values ( 5000, 5000 )
            /
            commit
            /
            analyze table dds_table_test delete statistics
            /
            analyze table dds_table_test partition (p1) compute statistics
            /


 case 75 "分析（ANALYZE）分区表：删除一个分区分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a number, b number) partition  by range (a) (
                  partition p1   values less than (1000),
                  partition pmax values less than (maxvalue)
            )
            /
            create index dds_table_test_i on dds_table_test ( a ) local
            /
            insert into dds_table_test values ( 10,10 )
            /
            insert into dds_table_test values ( 5000, 5000 )
            /
            commit
            /
            analyze table dds_table_test delete statistics
            /
            analyze table dds_table_test partition (p1) compute statistics
            /
            analyze table dds_table_test partition (p1) delete statistics
            /


 case 76 "分析（ANALYZE）分区表索引：一个分区分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a number, b number) partition  by range (a) (
                  partition p1   values less than (1000),
                  partition pmax values less than (maxvalue)
            )
            /
            create index dds_table_test_i on dds_table_test ( a ) local
            /
            insert into dds_table_test values ( 10,10 )
            /
            insert into dds_table_test values ( 5000, 5000 )
            /
            commit
            /
            analyze table dds_table_test delete statistics
            /
            analyze index dds_table_test_i compute statistics
            /

            

 case 77 "分析（ANALYZE）分区表索引：删除一个分区分析" 0
        src_sql:            drop table dds_table_test
            /
            create table dds_table_test (a number, b number) partition  by range (a) (
                  partition p1   values less than (1000),
                  partition pmax values less than (maxvalue)
            )
            /
            create index dds_table_test_i on dds_table_test ( a ) local
            /
            insert into dds_table_test values ( 10,10 )
            /
            insert into dds_table_test values ( 5000, 5000 )
            /
            commit
            /
            analyze table dds_table_test delete statistics
            /
            analyze index dds_table_test_i compute statistics
            /
            analyze index dds_table_test_i delete statistics
            /

            

 case 78 "分析（ANALYZE）组合分区表：分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (   p1 number,
                                            p2 varchar2(6),
                                            p3 varchar2(20)
                                        )
                   PARTITION BY RANGE(p1) SUBPARTITION BY HASH(p2) SUBPARTITIONS 2 (
                       PARTITION part_1 VALUES LESS THAN(10000000)
                                (subpartition part_1_sub_1, subpartition part_1_sub_2),
                       PARTITION part_2 values less than(20000000)
                                (subpartition part_2_sub_1, subpartition part_2_sub_2)
                   )
            /
            analyze table dds_table_test compute statistics
            /

            

 case 79 "分析（ANALYZE）组合分区表：删除分析" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (   p1 number,
                                            p2 varchar2(6),
                                            p3 varchar2(20)
                                        )
                   PARTITION BY RANGE(p1) SUBPARTITION BY HASH(p2) SUBPARTITIONS 2 (
                       PARTITION part_1 VALUES LESS THAN(10000000)
                                (subpartition part_1_sub_1, subpartition part_1_sub_2),
                       PARTITION part_2 values less than(20000000)
                                (subpartition part_2_sub_1, subpartition part_2_sub_2)
                   )
            /
            analyze table dds_table_test compute statistics
            /
            analyze table dds_table_test delete statistics
            /



 case 80 "DML 回滚测试(单条）" 0
        src_sql:
            drop table tt2 purge
            /
            create table tt2 ( f1 int, f2 int )
            /
            insert into tt2 values ( 12, 12 )
            /
            rollback
            /
            insert into tt2 values ( 13, 13 )
            /
            commit
            /
            update tt2 set f2=133 where f1=13
            /
            rollback
            /
		
		tgt_sql:
			select * from tt2
			/


 case 81 "DML 回滚测试(单表多条插入QMI）" 0
        src_sql:
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            insert into tt2 select * from dba_objects
            /
            rollback
            /
			
		tgt_sql:
			select count(*) from tt2
			/

 case 82 "DML 回滚测试(单表多条插入QMI＋一条QMI）" 0
        src_sql:
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            insert into tt2 select * from dba_objects
            /
            insert into tt2 select * from dba_objects where rownum<2
            /
            rollback
            /

		tgt_sql:
			select count(*) from tt2
			/


 case 83 "DML 回滚测试(单表插入+修改+删除）" 0
        src_sql:
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            commit
            /
            update tt2 set OBJECT_ID=rownum+1000000000
            /
            delete from tt2 where rownum<10
            /
            rollback
            /

		tgt_sql:
			select count(*) from tt2
			/
			select sum(OBJECT_ID) from tt2
			/


 case 84 "DML 回滚测试(多表多条插入QMI）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            insert into tt2 select * from dba_objects
            /
            insert into tt1 select * from dba_tables
            /
            rollback
            /

		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/

 case 85 "DML 回滚测试(多表多条插入QMI＋一条QMI）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            insert into tt1 select * from dba_tables where rownum<180
            /
            insert into tt2 select * from dba_objects where rownum<2
            /
            insert into tt1 select * from dba_tables where rownum<2
            /
            rollback
            /

		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/


 case 86 "DML 回滚测试(多表插入+修改+删除）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            insert into tt1 select * from dba_tables where rownum<100
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            commit
            /
            update tt1 set next_extent=rownum+9999999999
            /
            update tt2 set object_id=rownum+1000000000
            /
            delete from tt1 where rownum<10
            /
            delete from tt2 where rownum<10
            /
            update tt1 set next_extent=10+rownum
            /
            rollback
            /
			
		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/
			select sum(next_extent) from tt1
			/
			select sum(object_id) from tt2
			/



 case 87 "DML 回滚测试(部分回滚：一次部分回滚：单表插入）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            savepoint point1
            /
            insert into tt2 select * from dba_objects where rownum<240
            /
            rollback to point1
            /
			commit
			/
			
		tgt_sql:
			select count(*) from tt2
			/
			select sum(object_id) from tt2
			/


 case 88 "DML 回滚测试(部分回滚：一次部分回滚：单表插入+修改+删除）" 0
        src_sql:
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            savepoint point1
            /
            insert into tt2 select * from dba_objects where rownum<240
            /
            update tt2 set object_id=100000+object_id
            /
            delete from tt2 where rownum<5
            /
            update tt2 set DATA_OBJECT_ID=object_id+1000000000
            /
            insert into tt2 select * from dba_objects where rownum<1000
            /
            rollback to point1
            /
			commit
			/
			
		tgt_sql:
			select count(*) from tt2
			/
			select sum(object_id) from tt2
			/



 case 89 "DML 回滚测试(部分回滚：一次部分回滚：多表插入）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            insert into tt1 select * from dba_tables where rownum<10
            /
            savepoint point1
            /
            insert into tt2 select * from dba_objects where rownum<240
            /
            insert into tt1 select * from dba_tables where rownum<189
            /
            rollback to point1
            /
			commit
			/
		
		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/
			select sum(next_extent) from tt1
			/
			select sum(object_id) from tt2
			/


 case 90 "DML 回滚测试(部分回滚：一次部分回滚：多表插入+修改+删除）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            update tt1 set pct_free=rownum+100000000
            /
            insert into tt1 select * from dba_tables where rownum<10
            /
            insert into tt2 select * from dba_objects where rownum<290
            /
            savepoint point1
            /
            update tt1 set pct_free=rownum
            /
            update tt2 set object_id=10999999999+object_id
            /
            delete from tt1 where rownum<20
            /
            delete from tt2 where rownum<39
            /
            insert into tt1 select * from tt1 where rownum<20
            /
            insert into tt2 select * from tt2 where rownum<19
            /
            rollback to point1
            /
            update tt1 set pct_free=9999999990-rownum
            /
            update tt2 set object_id=rownum+100001
            /
            delete from tt1 where rownum<20
            /
            delete from tt2 where rownum<39
            /
			commit
			/
		
		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/
			select sum(object_id) from tt2
			/


 case 91 "DML 回滚测试(部分回滚：二次部分回滚：单表插入）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            savepoint point1
            /
            insert into tt2 select * from dba_objects where rownum<240
            /
            savepoint point2
            /
            insert into tt2 select * from dba_objects where rownum<10
            /
            rollback to point2
            /
            insert into tt2 select * from dba_objects where rownum<13
            /
            rollback to point1
            /
            insert into tt2 select * from dba_objects where rownum<3
            /
			commit
			/
		
		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/
			select sum(object_id) from tt2
			/


 case 92 "DML 回滚测试(部分回滚：二次部分回滚：单表插入+修改+删除）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            savepoint point1
            /
            insert into tt2 select * from dba_objects where rownum<240
            /
            update tt2 set object_id=100000+object_id
            /
            savepoint point2
            /
            delete from tt2 where rownum<5
            /
            update tt2 set DATA_OBJECT_ID=object_id+1000000000
            /
            rollback to point2
            /
            insert into tt2 select * from dba_objects where rownum<1000
            /
            rollback to point1
            /
            insert into tt2 select * from dba_objects where rownum<1000
            /
            update tt2 set DATA_OBJECT_ID=1000000000+rownum*2
            /
			commit
			/
		
		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/
			select sum(object_id) from tt2
			/


 case 93 "DML 回滚测试(部分回滚：二次部分回滚：多表插入）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            insert into tt2 select * from dba_objects where rownum<100
            /
            insert into tt1 select * from dba_tables where rownum<10
            /
            savepoint point1
            /
            insert into tt2 select * from dba_objects where rownum<240
            /
            insert into tt1 select * from dba_tables where rownum<189
            /
            savepoint point2
            /
            insert into tt2 select * from dba_objects where rownum<198
            /
            rollback to point2
            /
            insert into tt1 select * from dba_tables where rownum<156
            /
            rollback to point1
            /
            insert into tt2 select * from tt2 where rownum<10
            /
			commit
			/
		
		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/
			select sum(next_extent) from tt1
			/
			select sum(object_id) from tt2
			/


 case 94 "DML 回滚测试(部分回滚：二次部分回滚：多表插入+修改+删除）" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            update tt1 set pct_free=rownum+100000000
            /
            insert into tt1 select * from dba_tables where rownum<10
            /
            insert into tt2 select * from dba_objects where rownum<290
            /
            savepoint point1
            /
            update tt1 set pct_free=rownum
            /
            update tt2 set object_id=10999999999+object_id
            /
            delete from tt1 where rownum<20
            /
            savepoint point2
            /
            delete from tt2 where rownum<39
            /
            insert into tt1 select * from tt1 where rownum<20
            /
            insert into tt2 select * from tt2 where rownum<19
            /
            rollback to point2
            /
            update tt1 set pct_free=9999999990-rownum
            /
            update tt2 set object_id=rownum+10
            /
            rollback to point1
            /
            update tt2 set object_id=rownum+100001
            /
            delete from tt1 where rownum<20
            /
            delete from tt2 where rownum<39
            /
			commit
			/
			
		tgt_sql:
			select count(*) from tt1
			/
			select count(*) from tt2
			/
			select sum(object_id) from tt2
			/


 case 95 "DML 回滚测试：删除测试过程中的表" 0
        src_sql:
            drop table tt1 purge
            /
            drop table tt2 purge
            /
            create table tt2 as select * from dba_objects where 1=0
            /
            create table tt1 as select * from dba_tables where 1=0
            /
            drop table tt1 purge
            /
            drop table tt2 purge
            /
		tgt_sql:
			select count(*) from user_tables where table_name in('TT1','TT2')
			/


    case 38 "alter table move tablespace 操作" 0
        src_sql:
            create table dds_table_test00 (no int,name varchar2(10))
            /
            alter table dds_table_test00 move tablespace system
            /
		
		tgt_sql:
			select tablespace_name from user_tables where table_name='DDS_TABLE_TEST00'
			/			



    case 39 "alter table move tablespace 操作：更新表中的数据" 0
        src_sql:
            create table dds_table_test11 (a1 int,name varchar2(10))
            /
            insert into dds_table_test11 values ('1','2')
            /
			commit
			/
            alter table dds_table_test11 move tablespace system
            /
            update dds_table_test11 set a1=a1+10000
            /
			commit
			/
			
		tgt_sql:
			select tablespace_name from user_tables where table_name='DDS_TABLE_TEST00'
			/
			select * from dds_table_test11
			/

 case 795 "修改主键并引起冲突: 建表" 0
      src_sql:
          drop table "fk_test"
          /
          drop table "pk_test"
          /
          create table "pk_test" ( f1 int primary key, f2 int )
          /
          create table "fk_test" ( f1 int references "pk_test", f2 int )
          /
          insert into "pk_test" values ( 1,2 )
          /
          insert into "pk_test" values ( 2,3 )
          /
          insert into "pk_test" values ( 3,4 )
          /
          insert into "pk_test" values ( 4,5 )
          /
          insert into "pk_test" values ( 5,1 )
          /
          insert into "fk_test" select * from "pk_test"
          /
		  commit
		  /
		  
		tgt_sql:
			select * from "pk_test" order by f1
			/
			select * from "fk_test" order by f1
			/


 case 796 "修改主键并引起冲突: 修改主表记录" 0
      src_sql:
          drop table "fk_test"
          /
          drop table "pk_test"
          /
          create table "pk_test" ( f1 int primary key, f2 int )
          /
          create table "fk_test" ( f1 int references "pk_test", f2 int )
          /
          insert into "pk_test" values ( 1,2 )
          /
          insert into "pk_test" values ( 2,3 )
          /
          insert into "pk_test" values ( 3,4 )
          /
          insert into "pk_test" values ( 4,5 )
          /
          insert into "pk_test" values ( 5,1 )
          /
          insert into "fk_test" select * from "pk_test"
          /
          update "pk_test" set f1=f2, f2=f1
          /
		  commit
		  /
		  
		tgt_sql:
			select * from "pk_test" order by f1
			/
			select * from "fk_test" order by f1
			/


 case 797 "修改主键并引起冲突: 修改附表记录" 0
      src_sql:
          drop table "fk_test"
          /
          drop table "pk_test"
          /
          create table "pk_test" ( f1 int primary key, f2 int )
          /
          create table "fk_test" ( f1 int references "pk_test", f2 int )
          /
          insert into "pk_test" values ( 1,2 )
          /
          insert into "pk_test" values ( 2,3 )
          /
          insert into "pk_test" values ( 3,4 )
          /
          insert into "pk_test" values ( 4,5 )
          /
          insert into "pk_test" values ( 5,1 )
          /
          insert into "fk_test" select * from "pk_test"
          /
          update "pk_test" set f1=f2, f2=f1
          /
          update "fk_test" set f1=f2, f2=f1
          /
		  commit
		  /
		  
		tgt_sql:
			select * from "pk_test" order by f1
			/
			select * from "fk_test" order by f1
			/

 case 798 "修改主键并引起冲突: 删除表" 0
      src_sql:
          drop table "fk_test"
          /
          drop table "pk_test"
          /
          create table "pk_test" ( f1 int primary key, f2 int )
          /
          create table "fk_test" ( f1 int references "pk_test", f2 int )
          /
          insert into "pk_test" values ( 1,2 )
          /
          insert into "pk_test" values ( 2,3 )
          /
          insert into "pk_test" values ( 3,4 )
          /
          insert into "pk_test" values ( 4,5 )
          /
          insert into "pk_test" values ( 5,1 )
          /
          insert into "fk_test" select * from "pk_test"
          /
          update "pk_test" set f1=f2, f2=f1
          /
          update "fk_test" set f1=f2, f2=f1
          /
          drop table "fk_test"
          /
          drop table "pk_test"
          /
		  
		tgt_sql:
			select count(*) from user_tables where table_name in('fk_test','pk_test')
			/


 case 799 "Shrink 表和索引: 建表" 0
      src_sql:
          drop table dds_shrink
          /
          create table dds_shrink as select * from dba_objects where rownum<40001
          /
          create index dds_shrink_i1 on dds_shrink ( object_id )
          /
		  
	tgt_sql:
			select count(*) from dds_shrink
			/
			select sum(object_id) from dds_shrink
			/


 case 800 "Shrink 表和索引: shrink" 0
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
		  
	tgt_sql:
			select count(*) from dds_shrink
			/
			select sum(object_id) from dds_shrink
			/
			select to_char(max(created),'YYYY-MM-DD HH24:MI:SS') from dds_shrink
			/
			select index_name,status from user_indexes where index_name = 'DDS_SHRINK_I1'
			/
			select SEGMENT_NAME,EXTENTS,BLOCKS from user_segments where SEGMENT_NAME='DDS_SHRINK'
			/
			select TABLE_NAME,BLOCKS,EMPTY_BLOCKS from user_tables where table_name='DDS_SHRINK'
			/
			
			select count(*) from dds_shrink
			/
			select sum(nvl(object_id,0)) from dds_shrink
			/
			select sum(nvl(data_object_id,0)) from dds_shrink
			/
			select to_char(max(created),'YYYY-MM-DD HH24:MI:SS') from dds_shrink
			/
			

 case 801 "Shrink 表和索引: 删除表" 0
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
			select count(*) from user_tables where table_name='DDS_SHRINK'
			/

 case 802 "连续插入删除记录: 建立表" 0
      src_sql:
          drop table dds_test_tab
          /
          create table dds_test_tab as select * from dba_objects where 1=0
          /
          insert into dds_test_tab select * from dba_objects where rownum<8000
          /
          delete from dds_test_tab where rownum<7999
          /
		  commit
		  /
		  
	tgt_sql:
			select count(*) from dds_test_tab
			/
		

 case 803 "连续插入删除记录: 删除表" 0
      src_sql:
          drop table dds_test_tab
          /
          create table dds_test_tab as select * from dba_objects where 1=0
          /
          insert into dds_test_tab select * from dba_objects where rownum<8000
          /
          delete from dds_test_tab where rownum<7999
          /
          drop table dds_test_tab
          /
		  
	tgt_sql:
			select count(*) from user_tables where table_name='DDS_TEST_TAB'
			/


 case 804 "连续插入删除记录BLOB: 建立表" 0
      src_sql:
          drop table dds_test_tab
          /
          create table dds_test_tab (
          STATEMENT_ID                                       VARCHAR2(30),
           PLAN_ID                                            NUMBER,
           TIMESTAMP                                          DATE,
           REMARKS                                            VARCHAR2(4000),
           OPERATION                                          VARCHAR2(30),
           OPTIONS                                            VARCHAR2(255),
           OBJECT_NODE                                        VARCHAR2(128),
           OBJECT_OWNER                                       VARCHAR2(30),
           OBJECT_NAME                                        VARCHAR2(30),
           OBJECT_ALIAS                                       VARCHAR2(65),
           OBJECT_INSTANCE                                    NUMBER(38),
           OBJECT_TYPE                                        VARCHAR2(30),
           OPTIMIZER                                          VARCHAR2(255),
           SEARCH_COLUMNS                                     NUMBER,
           ID                                                 NUMBER(38),
           PARENT_ID                                          NUMBER(38),
           DEPTH                                              NUMBER(38),
           POSITION                                           NUMBER(38),
           COST                                               NUMBER(38),
           CARDINALITY                                        NUMBER(38),
           BYTES                                              NUMBER(38),
           OTHER_TAG                                          VARCHAR2(255),
           PARTITION_START                                    VARCHAR2(255),
           PARTITION_STOP                                     VARCHAR2(255),
           PARTITION_ID                                       NUMBER(38),
           OTHER                                              varchar2(20),
           OTHER_XML                                          CLOB,
           DISTRIBUTION                                       VARCHAR2(30),
           CPU_COST                                           NUMBER(38),
           IO_COST                                            NUMBER(38),
           TEMP_SPACE                                         NUMBER(38),
           ACCESS_PREDICATES                                  VARCHAR2(4000),
           FILTER_PREDICATES                                  VARCHAR2(4000),
           PROJECTION                                         VARCHAR2(4000),
           TIME                                               NUMBER(38),
           QBLOCK_NAME                                        VARCHAR2(30)
          )
          /
          insert into dds_test_tab values ( '1', 1, sysdate, '1-4', '1-OP', '1-OPS', '1-OBJ-NODE', '1-OBJ-OWN',
            '1-OBJ-NAM', '1-OBJ-ALIAS', 1,'1-OBJ-INST', '1-OBJ-TYP', 1, 1, 1,1,1,1,1,1,'OTHER-arg',
            '1-PARTITION_START', '1-PARTITION_STOP', 1, '1-LONGLONGLONG', '1-LOB-LOB-LOB', '1-DISTRIBUTION',
            1,1,1,'1-ACCESS_PREDI', '1-FILTER_PREDICATES', '1-PROJECTION', 1, '1-QBLOCK_NAME' )
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
		  delete from dds_test_tab
		  /
		  commit
		  /
	
	tgt_sql:
			select count(*) from dds_test_tab
			/


 case 805 "连续插入删除记录BLOB: 删除表" 0
      src_sql:
          drop table dds_test_tab
          /
          create table dds_test_tab (
          STATEMENT_ID                                       VARCHAR2(30),
           PLAN_ID                                            NUMBER,
           TIMESTAMP                                          DATE,
           REMARKS                                            VARCHAR2(4000),
           OPERATION                                          VARCHAR2(30),
           OPTIONS                                            VARCHAR2(255),
           OBJECT_NODE                                        VARCHAR2(128),
           OBJECT_OWNER                                       VARCHAR2(30),
           OBJECT_NAME                                        VARCHAR2(30),
           OBJECT_ALIAS                                       VARCHAR2(65),
           OBJECT_INSTANCE                                    NUMBER(38),
           OBJECT_TYPE                                        VARCHAR2(30),
           OPTIMIZER                                          VARCHAR2(255),
           SEARCH_COLUMNS                                     NUMBER,
           ID                                                 NUMBER(38),
           PARENT_ID                                          NUMBER(38),
           DEPTH                                              NUMBER(38),
           POSITION                                           NUMBER(38),
           COST                                               NUMBER(38),
           CARDINALITY                                        NUMBER(38),
           BYTES                                              NUMBER(38),
           OTHER_TAG                                          VARCHAR2(255),
           PARTITION_START                                    VARCHAR2(255),
           PARTITION_STOP                                     VARCHAR2(255),
           PARTITION_ID                                       NUMBER(38),
           OTHER                                              varchar2(20),
           OTHER_XML                                          CLOB,
           DISTRIBUTION                                       VARCHAR2(30),
           CPU_COST                                           NUMBER(38),
           IO_COST                                            NUMBER(38),
           TEMP_SPACE                                         NUMBER(38),
           ACCESS_PREDICATES                                  VARCHAR2(4000),
           FILTER_PREDICATES                                  VARCHAR2(4000),
           PROJECTION                                         VARCHAR2(4000),
           TIME                                               NUMBER(38),
           QBLOCK_NAME                                        VARCHAR2(30)
          )
          /
          insert into dds_test_tab values ( '1', 1, sysdate, '1-4', '1-OP', '1-OPS', '1-OBJ-NODE', '1-OBJ-OWN',
            '1-OBJ-NAM', '1-OBJ-ALIAS', 1,'1-OBJ-INST', '1-OBJ-TYP', 1, 1, 1,1,1,1,1,1,'OTHER-arg',
            '1-PARTITION_START', '1-PARTITION_STOP', 1, '1-LONGLONGLONG', '1-LOB-LOB-LOB', '1-DISTRIBUTION',
            1,1,1,'1-ACCESS_PREDI', '1-FILTER_PREDICATES', '1-PROJECTION', 1, '1-QBLOCK_NAME' )
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          insert into dds_test_tab select * from dds_test_tab
          /
          drop table dds_test_tab
          /
	
	tgt_sql:
			select count(*) from user_tables where table_name='DDS_TEST_TAB'
			/


 case 806 "外键参照到主键, 建立表及其外键" 0
      src_sql:
          drop table dds_tab2
          /
          drop table dds_tab3
          /
          drop table dds_tab4
          /
		  drop table dds_tab
          /
          create table dds_tab ( f1 int, f2 int, f3 int, f4 int, 
                 constraint pk_dds_1 primary key (f1),
                 constraint uk_dds_1 unique (f2),
                 constraint uk_f3_f4 unique (f3,f4) )
          /
          create table dds_tab2 ( fx int,
                       constraint t2_fk foreign key (fx) references dds_tab )
          /
          create table dds_tab3 ( fa int, fb int,
                       constraint t3_fk foreign key (fb) references dds_tab (f2) )
          /
          create table dds_tab4 ( fa int, fb int,
                       constraint t4_fk foreign key (fa,fb) references dds_tab (f3,f4) )
          /
		  
	tgt_sql:
			select table_name,constraint_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('DDS_TAB','DDS_TAB2','DDS_TAB3','DDS_TAB4') order by table_name,constraint_name
			/


 case 807 "外键参照到主键, 删除表" 0
      src_sql:
          drop table dds_tab2
          /
          drop table dds_tab3
          /
          drop table dds_tab4
          /
		  drop table dds_tab
          /
          create table dds_tab ( f1 int, f2 int, f3 int, f4 int, 
                 constraint pk_dds_1 primary key (f1),
                 constraint uk_dds_1 unique (f2),
                 constraint uk_f3_f4 unique (f3,f4) )
          /
          create table dds_tab2 ( fx int,
                       constraint t2_fk foreign key (fx) references dds_tab )
          /
          create table dds_tab3 ( fa int, fb int,
                       constraint t3_fk foreign key (fb) references dds_tab (f2) )
          /
          create table dds_tab4 ( fa int, fb int,
                       constraint t4_fk foreign key (fa,fb) references dds_tab (f3,f4) )
          /
          drop table dds_tab4
          /
          drop table dds_tab3
          /
          drop table dds_tab2
          /
          drop table dds_tab
          /
		  
	tgt_sql:
		select count(*) from user_tables where table_name in ('DDS_TAB','DDS_TAB2','DDS_TAB3','DDS_TAB4')
		/


 case 808 "LOB测试，建表" 0
      src_sql:
          drop table dds_lob1
          /
          create table dds_lob1 ( no int, nm varchar2(20), resume clob, photo blob )
          /
		  
	tgt_sql:
		select count(*) from user_tables where table_name='DDS_LOB1'
		/


 case 809 "LOB测试，INSERT CLOB" 0
      src_sql:
			drop table dds_lob1
			/
			create table dds_lob1 ( no int, nm varchar2(20), resume clob, photo blob )
			/
			declare
				a_clob          CLOB;
				Buffer          VARCHAR2(32767);
				Amount          BINARY_INTEGER := 32;
				Position        INTEGER := 1;
				i               INTEGER;
			begin
				insert into dds_lob1 values ( 1, 'cheng', empty_clob(), null ) returning resume into a_clob;
				dbms_lob.open (a_clob, dbms_lob.lob_readwrite);
				Buffer := 'A中国1234567890abcdefghijklmnopqrstuvwxyz';
				for i in 1..300 loop
					dbms_lob.write (a_clob, Amount, Position, Buffer);
					Position := Position + Amount;
				end loop;
				dbms_lob.close (a_clob);
			end;
			/
			commit
			/
		
	tgt_sql:
		select no,dbms_lob.getLength(resume) from dds_lob1
		/


 case 810 "连续DDL测试1" 0
      src_sql:
          drop table t03
          /
          drop table t04
          /
          drop table t03_bak
          /
          create table t03 as select * from dba_users
          /
          create table t04 as select * from dba_users
          /
          update t04 set user_id=100+rownum, username='Ux'||rownum
          /
          alter table t04 rename to t03_bak
          /
          truncate table t03
          /
          insert into t03 select * from t03_bak
          /
          drop table t03_bak
          /
		  
	tgt_sql:
		select count(*) from t03
		/
		select sum(user_id) from t03
		/
		select count(*) from user_tables where table_name in ('T03','T03_BAK','T04')
		/

 case 811 "连续DDL测试1: UPDATE" 0
      src_sql:
		  drop table t03
          /
          drop table t04
          /
          drop table t03_bak
          /
          create table t03 as select * from dba_users
          /
          create table t04 as select * from dba_users
          /
          update t04 set user_id=100+rownum, username='Ux'||rownum
          /
          alter table t04 rename to t03_bak
          /
          truncate table t03
          /
          insert into t03 select * from t03_bak
          /
          drop table t03_bak
          /
          update t03 set user_id=10000-rownum
          /
		  commit
		  /
		  
	tgt_sql:
		select count(*) from t03
		/
		select sum(user_id) from t03
		/
		select count(*) from user_tables where table_name in ('T03','T03_BAK','T04')
		/

 case 812 "连续DDL测试2" 0
      src_sql:
          drop table t03
          /
          drop table p_swap
          /
          drop table p_swap_t
          /
          create table p_swap (
                id        number,
                year      number(4) not null
          ) partition by range ( year ) (
            partition p1 values less than (2001),
            partition p2 values less than (2051),
            partition p3 values less than (2101),
            partition p4 values less than (maxvalue)
          )
          /
          declare
              i int;
              k int;
              z varchar2(512);
          begin
              z:='insert into p_swap values(:1,:2)';
              for i in 1..200
              loop
                  k:= i+1950;
                  execute immediate z using i, k;
              end loop;
          end;
          /
          create table p_swap_t as select * from p_swap partition (p2)
          /
          update p_swap_t set id=1+rownum
          /
          alter table p_swap exchange partition p2 with table p_swap_t
          /
          drop table p_swap_t
          /
	
	tgt_sql:
		select count(*) from p_swap
		/
		select sum(id) from p_swap
		/
		select count(*) from user_tables where table_name in ('P_SWAP','P_SWAP_T')
		/

 case 813 "连续DDL测试3" 0
  src_sql:
      drop table p_swap
      /
      drop table p_swap_t
      /
      create table p_swap (
            id        number primary key,
            year      number(4) not null,
            sno       number unique,
            tno       int
      ) partition by range ( year ) (
        partition p1 values less than (2001),
        partition p2 values less than (2051),
        partition p3 values less than (2101),
        partition p4 values less than (maxvalue)
      )
      /
      declare
          i int;
          k int;
          z varchar2(512);
      begin
          z:='insert into p_swap values(:1,:2,:3,:4)';
          for i in 1..200
          loop
              k:= i+1950;
              execute immediate z using i, k, i, i;
          end loop;
      end;
      /
      create table p_swap_t as select * from p_swap partition (p4)
      /
      create unique index p_swap_t_i1 on p_swap_t ( id )
      /
      update p_swap_t set tno=10000-rownum
      /
      alter table p_swap drop primary key cascade drop index
      /
      alter table p_swap drop unique ( sno )
      /
      drop index p_swap_t_i1
      /
      alter table p_swap exchange partition p4 with table p_swap_t
      /
      drop table p_swap_t
      /
      alter table p_swap add constraint p_swap_pk primary key (id)
      /
      alter table p_swap add constraint p_swap_uk unique ( sno )
      /
      update p_swap partition(p4) set tno=tno+1
      /
	  commit
	  /
	  
	tgt_sql:
		select count(*) from p_swap
		/
		select sum(id) from p_swap
		/
		select count(*) from user_tables where table_name in ('P_SWAP','P_SWAP_T')
		/


 case 814 "连续DDL测试4" 0
      src_sql:
          drop table p_swap
          /
          drop table p_swap_t
          /
          drop table t03_11
          /
          drop table t03
          /
          create table t03 as select * from dba_users
          /
          alter table t03 rename to t03_11
          /
          insert into t03_11 select * from dba_users
          /
          update t03_11 set user_id=1+rownum
          /
		  commit
		  /
		  
	tgt_sql:
		select count(*) from t03_11
		/
		select sum(user_id) from t03_11
		/
		select count(*) from user_tables where table_name in ('T03','T03_11')
		/

 case 815 "连续DDL测试5" 0
      src_sql:
          drop table t04
          /
          drop table t03_11
          /
          drop table t03
          /
          create table t03 as select * from dba_users
          /
          create table t04 as select * from dba_users
          /
          drop table t03
          /
          truncate table t04
          /
          insert into t04 select * from dba_users
          /
          create table t03 as select * from t04
          /
          drop table t04
          /
          insert into t03 select * from dba_users
          /
          update t03 set user_id=1+rownum
          /
		  commit
		  /

	tgt_sql:
		select count(*) from t03
		/
		select sum(user_id) from t03
		/
		select count(*) from user_tables where table_name in ('T03','T04')
		/


 case 821 "建立大型TRIGGER" 0
      src_sql:
          drop table t1
          /
          drop trigger dds_test_tri1
          /
          create table t1 ( f1 int, f2 int )
          /
          CREATE OR REPLACE TRIGGER dds_test_tri1 BEFORE INSERT ON t1 FOR EACH ROW
          declare
            i123456789012345678901234567            NUMBER;
          begin
            i123456789012345678901234567 := 123456789;  ---------- set variable value   1
            i123456789012345678901234567 := 123456789;  ---------- set variable value   2
            i123456789012345678901234567 := 123456789;  ---------- set variable value   3
            i123456789012345678901234567 := 123456789;  ---------- set variable value   4
            i123456789012345678901234567 := 123456789;  ---------- set variable value   6
            i123456789012345678901234567 := 123456789;  ---------- set variable value   7
            i123456789012345678901234567 := 123456789;  ---------- set variable value   8
            i123456789012345678901234567 := 123456789;  ---------- set variable value   9
            i123456789012345678901234567 := 123456789;  ---------- set variable value  10
            i123456789012345678901234567 := 123456789;  ---------- set variable value  11
            i123456789012345678901234567 := 123456789;  ---------- set variable value  12
            i123456789012345678901234567 := 123456789;  ---------- set variable value  13
            i123456789012345678901234567 := 123456789;  ---------- set variable value  14
            i123456789012345678901234567 := 123456789;  ---------- set variable value  15
            i123456789012345678901234567 := 123456789;  ---------- set variable value  16
            i123456789012345678901234567 := 123456789;  ---------- set variable value  17
            i123456789012345678901234567 := 123456789;  ---------- set variable value  18
            i123456789012345678901234567 := 123456789;  ---------- set variable value  19
            i123456789012345678901234567 := 123456789;  ---------- set variable value  2-
            i123456789012345678901234567 := 123456789;  ---------- set variable value  21
            i123456789012345678901234567 := 123456789;  ---------- set variable value  22
            i123456789012345678901234567 := 123456789;  ---------- set variable value  23
            i123456789012345678901234567 := 123456789;  ---------- set variable value  24
            i123456789012345678901234567 := 123456789;  ---------- set variable value  25
            i123456789012345678901234567 := 123456789;  ---------- set variable value  26
            i123456789012345678901234567 := 123456789;  ---------- set variable value  27
            i123456789012345678901234567 := 123456789;  ---------- set variable value  28
            i123456789012345678901234567 := 123456789;  ---------- set variable value  29
            i123456789012345678901234567 := 123456789;  ---------- set variable value  30
            i123456789012345678901234567 := 123456789;  ---------- set variable value  31
            i123456789012345678901234567 := 123456789;  ---------- set variable value  32
            i123456789012345678901234567 := 123456789;  ---------- set variable value  33
            i123456789012345678901234567 := 123456789;  ---------- set variable value  34
            i123456789012345678901234567 := 123456789;  ---------- set variable value  35
            i123456789012345678901234567 := 123456789;  ---------- set variable value  36
            i123456789012345678901234567 := 123456789;  ---------- set variable value  37
            i123456789012345678901234567 := 123456789;  ---------- set variable value  38
            i123456789012345678901234567 := 123456789;  ---------- set variable value  39
            i123456789012345678901234567 := 123456789;  ---------- set variable value  40
            i123456789012345678901234567 := 123456789;  ---------- set variable value  41
            i123456789012345678901234567 := 123456789;  ---------- set variable value  42
            i123456789012345678901234567 := 123456789;  ---------- set variable value  43
            i123456789012345678901234567 := 123456789;  ---------- set variable value  44
            i123456789012345678901234567 := 123456789;  ---------- set variable value  45
            i123456789012345678901234567 := 123456789;  ---------- set variable value  46
            i123456789012345678901234567 := 123456789;  ---------- set variable value  47
            i123456789012345678901234567 := 123456789;  ---------- set variable value  48
            i123456789012345678901234567 := 123456789;  ---------- set variable value  49
            i123456789012345678901234567 := 123456789;  ---------- set variable value  50
            i123456789012345678901234567 := 123456789;  ---------- set variable value  51
            i123456789012345678901234567 := 123456789;  ---------- set variable value  52
            i123456789012345678901234567 := 123456789;  ---------- set variable value  53
            i123456789012345678901234567 := 123456789;  ---------- set variable value  54
            i123456789012345678901234567 := 123456789;  ---------- set variable value  55
            i123456789012345678901234567 := 123456789;  ---------- set variable value  56
            i123456789012345678901234567 := 123456789;  ---------- set variable value  57
            i123456789012345678901234567 := 123456789;  ---------- set variable value  58
            i123456789012345678901234567 := 123456789;  ---------- set variable value  59
            i123456789012345678901234567 := 123456789;  ---------- set variable value  60
            i123456789012345678901234567 := 123456789;  ---------- set variable value  61
            i123456789012345678901234567 := 123456789;  ---------- set variable value  62
            i123456789012345678901234567 := 123456789;  ---------- set variable value  63
            i123456789012345678901234567 := 123456789;  ---------- set variable value  64
            i123456789012345678901234567 := 123456789;  ---------- set variable value  65
            i123456789012345678901234567 := 123456789;  ---------- set variable value  66
            i123456789012345678901234567 := 123456789;  ---------- set variable value  67
            i123456789012345678901234567 := 123456789;  ---------- set variable value  68
            i123456789012345678901234567 := 123456789;  ---------- set variable value  69
            i123456789012345678901234567 := 123456789;  ---------- set variable value  70
            i123456789012345678901234567 := 123456789;  ---------- set variable value  71
            i123456789012345678901234567 := 123456789;  ---------- set variable value  72
            i123456789012345678901234567 := 123456789;  ---------- set variable value  73
            i123456789012345678901234567 := 123456789;  ---------- set variable value  74
            i123456789012345678901234567 := 123456789;  ---------- set variable value  75
            i123456789012345678901234567 := 123456789;  ---------- set variable value  76
            i123456789012345678901234567 := 123456789;  ---------- set variable value  77
            i123456789012345678901234567 := 123456789;  ---------- set variable value  78
            i123456789012345678901234567 := 123456789;  ---------- set variable value  79
            i123456789012345678901234567 := 123456789;  ---------- set variable value  80
            i123456789012345678901234567 := 123456789;  ---------- set variable value  81
            i123456789012345678901234567 := 123456789;  ---------- set variable value  82
            i123456789012345678901234567 := 123456789;  ---------- set variable value  83
            i123456789012345678901234567 := 123456789;  ---------- set variable value  84
            i123456789012345678901234567 := 123456789;  ---------- set variable value  85
            i123456789012345678901234567 := 123456789;  ---------- set variable value  86
            i123456789012345678901234567 := 123456789;  ---------- set variable value  87
            i123456789012345678901234567 := 123456789;  ---------- set variable value  88
            i123456789012345678901234567 := 123456789;  ---------- set variable value  89
            i123456789012345678901234567 := 123456789;  ---------- set variable value  90
            i123456789012345678901234567 := 123456789;  ---------- set variable value  91
            i123456789012345678901234567 := 123456789;  ---------- set variable value  92
            i123456789012345678901234567 := 123456789;  ---------- set variable value  93
            i123456789012345678901234567 := 123456789;  ---------- set variable value  94
            i123456789012345678901234567 := 123456789;  ---------- set variable value  95
            i123456789012345678901234567 := 123456789;  ---------- set variable value  96
            i123456789012345678901234567 := 123456789;  ---------- set variable value  97
            i123456789012345678901234567 := 123456789;  ---------- set variable value  98
            i123456789012345678901234567 := 123456789;  ---------- set variable value  99
            i123456789012345678901234567 := 123456789;  ---------- set variable value 100
            i123456789012345678901234567 := 123456789;  ---------- set variable value 101
            i123456789012345678901234567 := 123456789;  ---------- set variable value 102
            i123456789012345678901234567 := 123456789;  ---------- set variable value 103
            i123456789012345678901234567 := 123456789;  ---------- set variable value 104
            i123456789012345678901234567 := 123456789;  ---------- set variable value 105
            i123456789012345678901234567 := 123456789;  ---------- set variable value 106
            i123456789012345678901234567 := 123456789;  ---------- set variable value 107
            i123456789012345678901234567 := 123456789;  ---------- set variable value 108
            i123456789012345678901234567 := 123456789;  ---------- set variable value 109
            i123456789012345678901234567 := 123456789;  ---------- set variable value 110
            i123456789012345678901234567 := 123456789;  ---------- set variable value 111
            i123456789012345678901234567 := 123456789;  ---------- set variable value 112
            i123456789012345678901234567 := 123456789;  ---------- set variable value 113
            i123456789012345678901234567 := 123456789;  ---------- set variable value 114
            i123456789012345678901234567 := 123456789;  ---------- set variable value 115
            i123456789012345678901234567 := 123456789;  ---------- set variable value 116
            i123456789012345678901234567 := 123456789;  ---------- set variable value 117
            i123456789012345678901234567 := 123456789;  ---------- set variable value 118
            i123456789012345678901234567 := 123456789;  ---------- set variable value 119
            i123456789012345678901234567 := 123456789;  ---------- set variable value 120
            i123456789012345678901234567 := 123456789;  ---------- set variable value 121
            i123456789012345678901234567 := 123456789;  ---------- set variable value 122
            i123456789012345678901234567 := 123456789;  ---------- set variable value 123
          end;
          /
		  
	tgt_sql:
		select object_name,object_type,status from user_objects where object_name in ('T1','DDS_TEST_TRI1') order by object_name
		/


 case 822 "建立大型Procedure" 0
      src_sql:
          drop table t1
          /
          drop trigger dds_test_tri1
          /
          drop procedure dds_test_proc
          /
          CREATE OR REPLACE PROCEDURE dds_test_proc as
          begin
          declare
            i123456789012345678901234567            NUMBER;
          begin
            i123456789012345678901234567 := 123456789;  ---------- set variable value   1
            i123456789012345678901234567 := 123456789;  ---------- set variable value   2
            i123456789012345678901234567 := 123456789;  ---------- set variable value   3
            i123456789012345678901234567 := 123456789;  ---------- set variable value   4
            i123456789012345678901234567 := 123456789;  ---------- set variable value   6
            i123456789012345678901234567 := 123456789;  ---------- set variable value   7
            i123456789012345678901234567 := 123456789;  ---------- set variable value   8
            i123456789012345678901234567 := 123456789;  ---------- set variable value   9
            i123456789012345678901234567 := 123456789;  ---------- set variable value  10
            i123456789012345678901234567 := 123456789;  ---------- set variable value  11
            i123456789012345678901234567 := 123456789;  ---------- set variable value  12
            i123456789012345678901234567 := 123456789;  ---------- set variable value  13
            i123456789012345678901234567 := 123456789;  ---------- set variable value  14
            i123456789012345678901234567 := 123456789;  ---------- set variable value  15
            i123456789012345678901234567 := 123456789;  ---------- set variable value  16
            i123456789012345678901234567 := 123456789;  ---------- set variable value  17
            i123456789012345678901234567 := 123456789;  ---------- set variable value  18
            i123456789012345678901234567 := 123456789;  ---------- set variable value  19
            i123456789012345678901234567 := 123456789;  ---------- set variable value  2-
            i123456789012345678901234567 := 123456789;  ---------- set variable value  21
            i123456789012345678901234567 := 123456789;  ---------- set variable value  22
            i123456789012345678901234567 := 123456789;  ---------- set variable value  23
            i123456789012345678901234567 := 123456789;  ---------- set variable value  24
            i123456789012345678901234567 := 123456789;  ---------- set variable value  25
            i123456789012345678901234567 := 123456789;  ---------- set variable value  26
            i123456789012345678901234567 := 123456789;  ---------- set variable value  27
            i123456789012345678901234567 := 123456789;  ---------- set variable value  28
            i123456789012345678901234567 := 123456789;  ---------- set variable value  29
            i123456789012345678901234567 := 123456789;  ---------- set variable value  30
            i123456789012345678901234567 := 123456789;  ---------- set variable value  31
            i123456789012345678901234567 := 123456789;  ---------- set variable value  32
            i123456789012345678901234567 := 123456789;  ---------- set variable value  33
            i123456789012345678901234567 := 123456789;  ---------- set variable value  34
            i123456789012345678901234567 := 123456789;  ---------- set variable value  35
            i123456789012345678901234567 := 123456789;  ---------- set variable value  36
            i123456789012345678901234567 := 123456789;  ---------- set variable value  37
            i123456789012345678901234567 := 123456789;  ---------- set variable value  38
            i123456789012345678901234567 := 123456789;  ---------- set variable value  39
            i123456789012345678901234567 := 123456789;  ---------- set variable value  40
            i123456789012345678901234567 := 123456789;  ---------- set variable value  41
            i123456789012345678901234567 := 123456789;  ---------- set variable value  42
            i123456789012345678901234567 := 123456789;  ---------- set variable value  43
            i123456789012345678901234567 := 123456789;  ---------- set variable value  44
            i123456789012345678901234567 := 123456789;  ---------- set variable value  45
            i123456789012345678901234567 := 123456789;  ---------- set variable value  46
            i123456789012345678901234567 := 123456789;  ---------- set variable value  47
            i123456789012345678901234567 := 123456789;  ---------- set variable value  48
            i123456789012345678901234567 := 123456789;  ---------- set variable value  49
            i123456789012345678901234567 := 123456789;  ---------- set variable value  50
            i123456789012345678901234567 := 123456789;  ---------- set variable value  51
            i123456789012345678901234567 := 123456789;  ---------- set variable value  52
            i123456789012345678901234567 := 123456789;  ---------- set variable value  53
            i123456789012345678901234567 := 123456789;  ---------- set variable value  54
            i123456789012345678901234567 := 123456789;  ---------- set variable value  55
            i123456789012345678901234567 := 123456789;  ---------- set variable value  56
            i123456789012345678901234567 := 123456789;  ---------- set variable value  57
            i123456789012345678901234567 := 123456789;  ---------- set variable value  58
            i123456789012345678901234567 := 123456789;  ---------- set variable value  59
            i123456789012345678901234567 := 123456789;  ---------- set variable value  60
            i123456789012345678901234567 := 123456789;  ---------- set variable value  61
            i123456789012345678901234567 := 123456789;  ---------- set variable value  62
            i123456789012345678901234567 := 123456789;  ---------- set variable value  63
            i123456789012345678901234567 := 123456789;  ---------- set variable value  64
            i123456789012345678901234567 := 123456789;  ---------- set variable value  65
            i123456789012345678901234567 := 123456789;  ---------- set variable value  66
            i123456789012345678901234567 := 123456789;  ---------- set variable value  67
            i123456789012345678901234567 := 123456789;  ---------- set variable value  68
            i123456789012345678901234567 := 123456789;  ---------- set variable value  69
            i123456789012345678901234567 := 123456789;  ---------- set variable value  70
            i123456789012345678901234567 := 123456789;  ---------- set variable value  71
            i123456789012345678901234567 := 123456789;  ---------- set variable value  72
            i123456789012345678901234567 := 123456789;  ---------- set variable value  73
            i123456789012345678901234567 := 123456789;  ---------- set variable value  74
            i123456789012345678901234567 := 123456789;  ---------- set variable value  75
            i123456789012345678901234567 := 123456789;  ---------- set variable value  76
            i123456789012345678901234567 := 123456789;  ---------- set variable value  77
            i123456789012345678901234567 := 123456789;  ---------- set variable value  78
            i123456789012345678901234567 := 123456789;  ---------- set variable value  79
            i123456789012345678901234567 := 123456789;  ---------- set variable value  80
            i123456789012345678901234567 := 123456789;  ---------- set variable value  81
            i123456789012345678901234567 := 123456789;  ---------- set variable value  82
            i123456789012345678901234567 := 123456789;  ---------- set variable value  83
            i123456789012345678901234567 := 123456789;  ---------- set variable value  84
            i123456789012345678901234567 := 123456789;  ---------- set variable value  85
            i123456789012345678901234567 := 123456789;  ---------- set variable value  86
            i123456789012345678901234567 := 123456789;  ---------- set variable value  87
            i123456789012345678901234567 := 123456789;  ---------- set variable value  88
            i123456789012345678901234567 := 123456789;  ---------- set variable value  89
            i123456789012345678901234567 := 123456789;  ---------- set variable value  90
            i123456789012345678901234567 := 123456789;  ---------- set variable value  91
            i123456789012345678901234567 := 123456789;  ---------- set variable value  92
            i123456789012345678901234567 := 123456789;  ---------- set variable value  93
            i123456789012345678901234567 := 123456789;  ---------- set variable value  94
            i123456789012345678901234567 := 123456789;  ---------- set variable value  95
            i123456789012345678901234567 := 123456789;  ---------- set variable value  96
            i123456789012345678901234567 := 123456789;  ---------- set variable value  97
            i123456789012345678901234567 := 123456789;  ---------- set variable value  98
            i123456789012345678901234567 := 123456789;  ---------- set variable value  99
            i123456789012345678901234567 := 123456789;  ---------- set variable value 100
            i123456789012345678901234567 := 123456789;  ---------- set variable value 101
            i123456789012345678901234567 := 123456789;  ---------- set variable value 102
            i123456789012345678901234567 := 123456789;  ---------- set variable value 103
            i123456789012345678901234567 := 123456789;  ---------- set variable value 104
            i123456789012345678901234567 := 123456789;  ---------- set variable value 105
            i123456789012345678901234567 := 123456789;  ---------- set variable value 106
            i123456789012345678901234567 := 123456789;  ---------- set variable value 107
            i123456789012345678901234567 := 123456789;  ---------- set variable value 108
            i123456789012345678901234567 := 123456789;  ---------- set variable value 109
            i123456789012345678901234567 := 123456789;  ---------- set variable value 110
            i123456789012345678901234567 := 123456789;  ---------- set variable value 111
            i123456789012345678901234567 := 123456789;  ---------- set variable value 112
            i123456789012345678901234567 := 123456789;  ---------- set variable value 113
            i123456789012345678901234567 := 123456789;  ---------- set variable value 114
            i123456789012345678901234567 := 123456789;  ---------- set variable value 115
            i123456789012345678901234567 := 123456789;  ---------- set variable value 116
            i123456789012345678901234567 := 123456789;  ---------- set variable value 117
            i123456789012345678901234567 := 123456789;  ---------- set variable value 118
            i123456789012345678901234567 := 123456789;  ---------- set variable value 119
            i123456789012345678901234567 := 123456789;  ---------- set variable value 120
          end;
          end;
          /
		  
	tgt_sql:
		select object_name,object_type,status from user_objects where object_name='DDS_TEST_PROC' order by object_name
		/


 case 823 "建立含 XML 字段的表" 0
      src_sql:
          drop procedure dds_test_proc
          /
          drop table t1
          /
          create table t1 ( f1 int, f2 sys.xmltype, f3 int, f4 int, f5 int )
          /
          insert into t1 values ( 1, '<xml1>Hello</xml1>', 3,4,5 )
          /
		  commit
		  /
		  
	tgt_sql:
		select column_name,data_type,data_length,nullable from user_tab_cols where table_name='T1' order by column_name
		/
		select * from t1
		/


 case 824 "参照到本表，建立表，插入记录" 0
      src_sql:
          drop table t1
          /
          create table t1 (
        ID_               NUMBER(19) not null,
        CLASS_            CHAR(2) not null,
        DATE_             TIMESTAMP(6),
        PARENT_           NUMBER(19)
        ) partition by range (DATE_) (
        partition YEAR2007 values less than (TIMESTAMP'2007-12-31 23:59:59'),
        partition YEAR2008 values less than (TIMESTAMP'2008-12-31 23:59:59'),
        partition YEAR2009 values less than (TIMESTAMP'2009-12-31 23:59:59'),
        partition YEAR2010 values less than (TIMESTAMP'2010-12-31 23:59:59'),
        partition YEAR2011 values less than (TIMESTAMP'2011-12-31 23:59:59'),
        partition YEAR2012 values less than (TIMESTAMP'2012-12-31 23:59:59'),
        partition YEAR2013 values less than (TIMESTAMP'2013-12-31 23:59:59')  )
          /
          alter table t1 add primary key (ID_) using index
          /
          alter table t1 add constraint FK_LOG_PARENT foreign key (PARENT_) references t1 (ID_)
          /
          insert into t1 values (1,'1',TO_TIMESTAMP('10-Sep-02 14:10:10.123000','DD-Mon-RR HH24:MI:SS.FF'),null)
          /
          insert into t1 values (101,'1', TO_TIMESTAMP('10-Sep-02 14:10:10.123000','DD-Mon-RR HH24:MI:SS.FF'),1)
          /
          insert into t1 values (102,'1', TO_TIMESTAMP('10-Sep-02 14:10:10.123000','DD-Mon-RR HH24:MI:SS.FF'),1)
          /
		  commit
		  /
		  
	tgt_sql:
		select constraint_name,constraint_type,status,deferrable,validated from user_constraints where table_name='T1' and constraint_name='FK_LOG_PARENT'
		/
		select count(*) from user_constraints where table_name='T1' and constraint_type='P'
		/
		select count(*) from user_constraints where table_name='T1' and constraint_type='C'
		/
		select * from t1 order by id_
		/


 case 825 "参照到本表，删除记录（一次全部删除）" 0
      src_sql:
          drop table t1
          /
          create table t1 (
        ID_               NUMBER(19) not null,
        CLASS_            CHAR(2) not null,
        DATE_             TIMESTAMP(6),
        PARENT_           NUMBER(19)
        ) partition by range (DATE_) (
        partition YEAR2007 values less than (TIMESTAMP'2007-12-31 23:59:59'),
        partition YEAR2008 values less than (TIMESTAMP'2008-12-31 23:59:59'),
        partition YEAR2009 values less than (TIMESTAMP'2009-12-31 23:59:59'),
        partition YEAR2010 values less than (TIMESTAMP'2010-12-31 23:59:59'),
        partition YEAR2011 values less than (TIMESTAMP'2011-12-31 23:59:59'),
        partition YEAR2012 values less than (TIMESTAMP'2012-12-31 23:59:59'),
        partition YEAR2013 values less than (TIMESTAMP'2013-12-31 23:59:59')  )
          /
          alter table t1 add primary key (ID_) using index
          /
          alter table t1 add constraint FK_LOG_PARENT foreign key (PARENT_) references t1 (ID_)
          /
          insert into t1 values (1,'1',TO_TIMESTAMP('10-Sep-02 14:10:10.123000','DD-Mon-RR HH24:MI:SS.FF'),null)
          /
          insert into t1 values (101,'1', TO_TIMESTAMP('10-Sep-02 14:10:10.123000','DD-Mon-RR HH24:MI:SS.FF'),1)
          /
          insert into t1 values (102,'1', TO_TIMESTAMP('10-Sep-02 14:10:10.123000','DD-Mon-RR HH24:MI:SS.FF'),1)
          /
          delete from t1
          /
		  commit
		  /
	
	tgt_sql:
		select constraint_name,constraint_type,status,deferrable,validated from user_constraints where table_name='T1' and constraint_name='FK_LOG_PARENT'
		/
		select count(*) from user_constraints where table_name='T1' and constraint_type='P'
		/
		select count(*) from user_constraints where table_name='T1' and constraint_type='C'
		/
		select count(*) from t1
		/
		



