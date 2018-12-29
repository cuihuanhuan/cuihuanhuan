
 case 1 "LIST分区表(1普通1LOCAL索引)：建立列表分区表" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='OBJECTS'
            /
            select count(*) from user_objects where object_name='OBJECTS' and object_type='TABLE PARTITION'
            /
            select column_name from user_part_key_columns where name='OBJECTS'
            /
            select PARTITIONING_TYPE from USER_PART_TABLES where TABLE_NAME='OBJECTS'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select logging from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_VIEW'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_NULL'
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_VIEW'
            /

 case 2 "LIST分区表(1普通1LOCAL索引)：增加分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            ALTER TABLE objects ADD PARTITION type_package VALUES ( 'PACKAGE', 'PACKAGE BODY' )
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /

        tgt_sql:
            select count(*) from user_objects where object_name='OBJECTS' and object_type='TABLE PARTITION'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_PACKAGE'
            /


 case 3 "LIST分区表(1普通1LOCAL索引)：删除分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            ALTER TABLE objects DROP PARTITION type_null
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /

        tgt_sql:
            select count(*) from user_objects where object_name='OBJECTS' and object_type='TABLE PARTITION'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_NULL'
            /

 case 4 "LIST分区表(1普通1LOCAL索引)：插入记录" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            commit
            /
            
        tgt_sql:
            select count(*) from objects
            /
            select count(*) from objects partition ( type_table )
            /


 case 5 "LIST分区表(1普通1LOCAL索引)：交换分区" 0
        src_sql:
            drop table objects
            /
            drop table swap_t
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
			commit
			/
            CREATE TABLE swap_t AS SELECT object_id-10000 as object_id, object_type FROM objects WHERE object_type='TABLE'
            /
            ALTER TABLE objects EXCHANGE PARTITION type_table WITH TABLE swap_t
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /

        tgt_sql:
            select count(*) from objects partition ( type_table )
            /
            select count(*) from swap_t
            /
            select to_char(sum(object_id)) from objects partition ( type_table )
            /
            select to_char(sum(object_id)) from swap_t
            /
            
 case 6 "LIST分区表(1普通1LOCAL索引)：合并分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            commit
            /
            ALTER TABLE objects MERGE PARTITIONS type_table, type_index INTO PARTITION type_tab_ind
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /

        tgt_sql:
            select count(*) from user_objects where object_name='OBJECTS' and object_type='TABLE PARTITION'
            /
            select count(*) from objects
            /
            select count(*) from objects partition ( type_tab_ind )
            /


 case 7 "LIST分区表(1普通1LOCAL索引)：在分区中增加键值" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1, 'TABLE' )
            /
            insert into objects values ( 2, 'INDEX' )
            /
            commit
            /
            ALTER TABLE objects MODIFY PARTITION type_view ADD VALUES ('JAVA','C++')
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values (11,'JAVA')
            /
            commit
            /
            
        tgt_sql:
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_VIEW'
            /
            select count(*) from objects
            /
            select count(*) from objects partition ( type_view )
            /


 case 8 "LIST分区表(1普通1LOCAL索引)：在分区中删除键值" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW','JAVA','C++') TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1, 'TABLE' )
            /
            insert into objects values ( 2, 'INDEX' )
            /
            insert into objects values (11,'JAVA')
            /
            commit
            /
            ALTER TABLE objects MODIFY PARTITION type_view DROP VALUES ('C++')
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /

        tgt_sql:
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_VIEW'
            /
            select count(*) from objects
            /
            select count(*) from objects partition ( type_view )
            /


 case 9 "LIST分区表(1普通1LOCAL索引)：移动分区（移动到相同表空间）：移动" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            commit
            /
            ALTER TABLE objects MOVE PARTITION type_index
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            
        tgt_sql:
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select count(*) from objects
            /
            select count(*) from objects partition ( TYPE_INDEX )
            /

 case 10 "LIST分区表(1普通1LOCAL索引)：移动分区（移动到相同表空间）：验证移动后的数据是否正确" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            commit
            /
            ALTER TABLE objects MOVE PARTITION type_index
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            update objects partition ( type_index ) set object_id=1000000+object_id
            /
            commit
            /

        tgt_sql:
			select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select to_char(sum(object_id)) from objects partition ( TYPE_INDEX )
            /

 case 11 "LIST分区表(1普通1LOCAL索引)：移动分区（移动到其它表空间）：移动" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            commit
            /
            ALTER TABLE objects MOVE PARTITION type_index TABLESPACE system
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /

        tgt_sql:
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
			select count(*) from objects
			/
            select to_char(sum(object_id)) from objects partition ( TYPE_INDEX )
            /


 case 12 "LIST分区表(1普通1LOCAL索引)：更名分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
			commit
			/
            alter table objects rename partition type_table to type_tab
            /
            
        tgt_sql:
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TAB'
            /
			select to_char(sum(object_id)) from objects
            /
			select to_char(sum(object_id)) from objects partition ( TYPE_TAB )
            /


 case 13 "LIST分区表(1普通1LOCAL索引)：分裂分区：第一个分裂出来的分区包含数据：建立分区表" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1005, 'TABLE' )
            /
            commit
            /

        tgt_sql:
            select count(*) from user_tables where table_name='OBJECTS'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name is not null
            /
            select * from objects order by object_id
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_VIEW'
            /

 case 14 "LIST分区表(1普通1LOCAL索引)：分裂分区：第一个分裂出来的分区包含数据：分裂分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1005, 'TABLE' )
            /
			commit
			/
            ALTER TABLE objects SPLIT PARTITION type_tab_idx VALUES ('TABLE') INTO (
                  PARTITION type_table TABLESPACE users,
                  PARTITION type_index TABLESPACE system  )
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            update objects set object_id=object_id+1
            /
            commit
            /

        tgt_sql:
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name is not null
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TAB_IDX'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select count(*) from objects partition ( type_table )
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select count(*) from objects partition ( type_index )
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select * from objects order by object_id
            /


 case 15 "LIST分区表(1普通1LOCAL索引)：分裂分区：第二个分裂出来的分区包含数据：建立分区表" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'INDEX' )
            /
            insert into objects values ( 1003, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
            commit
            /

        tgt_sql:
            select count(*) from user_tables where table_name='OBJECTS'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name is not null
            /
            select * from objects order by object_id
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_VIEW'
            /
            
 case 16 "LIST分区表(1普通1LOCAL索引)：分裂分区：第二个分裂出来的分区包含数据：分裂分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'INDEX' )
            /
            insert into objects values ( 1003, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            ALTER TABLE objects SPLIT PARTITION type_tab_idx VALUES ('TABLE') INTO (
                  PARTITION type_table TABLESPACE users,
                  PARTITION type_index TABLESPACE system  )
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            update objects set object_id=object_id+1
            /
            commit
            /

        tgt_sql:
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name is not null
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TAB_IDX'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select count(*) from objects partition ( type_table )
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select count(*) from objects partition ( type_index )
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select * from objects order by object_id
            /


 case 17 "LIST分区表(1普通1LOCAL索引)：分裂分区：分裂出来的2个分区均包含数据：建立分区表" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='OBJECTS'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name is not null
            /
            select * from objects order by object_id
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_VIEW'
            /  


 case 18 "LIST分区表(1普通1LOCAL索引)：分裂分区：分裂出来的2个分区均包含数据：分裂分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            ALTER TABLE objects SPLIT PARTITION type_tab_idx VALUES ('TABLE') INTO (
                  PARTITION type_table TABLESPACE users,
                  PARTITION type_index TABLESPACE system  )
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            update objects set object_id=object_id+1
            /
            commit
            /
            
        tgt_sql:
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name is not null
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TAB_IDX'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select count(*) from objects partition ( type_table )
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_TABLE'
            /
            select count(*) from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select high_value from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select count(*) from objects partition ( type_index )
            /
            select tablespace_name from user_tab_partitions where table_name='OBJECTS' and partition_name='TYPE_INDEX'
            /
            select * from objects order by object_id
            /
    


 case 19 "LIST分区表(1普通1LOCAL索引)：TRUNCATE 分区" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            alter table objects truncate partition type_tab_idx
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001000, 'TABLE' )
            /
            insert into objects values ( 1002000, 'INDEX' )
            /
            insert into objects values ( 1003000, 'TABLE' )
            /
            commit
            /
            
        tgt_sql:
            select count(*) from objects
            /
            select to_char(sum(object_id)) from objects
            /


 case 20 "LIST分区表(1普通1LOCAL索引)：TRUNCATE 分区：TRUNCATE后执行UPDATE" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            alter table objects truncate partition type_tab_idx
            /
            alter index "objects_idx001" rebuild
            /
            drop index "objects_idx002"
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001000, 'TABLE' )
            /
            insert into objects values ( 1002000, 'INDEX' )
            /
            insert into objects values ( 1003000, 'TABLE' )
            /
            update objects set object_id=object_id+10000000
            /
            commit
            /
            
        tgt_sql:
			select count(*) from objects
            /
            select to_char(sum(object_id)) from objects
            /


 case 21 "LIST分区表：建立普通索引 create index .. on .. (..)" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id )
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_OBJECT_ID'
            /

			
 case 22 "LIST分区表：删除普通索引" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id )
            /
            drop index idx_object_id
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_OBJECT_ID'
            /


 case 23 "LIST分区表：建立 non-prefix-local 索引 create index .. on .. (..) LOCAL" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id ) local
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_OBJECT_ID'
            /
            select count(*) from user_ind_partitions where INDEX_NAME='IDX_OBJECT_ID'
            /
            select high_value from user_ind_partitions where INDEX_NAME='IDX_OBJECT_ID' and partition_name='TYPE_VIEW'
            /


 case 24 "LIST分区表：删除 non-prefix-local 索引" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id ) local
            /
            drop index idx_object_id
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_OBJECT_ID'
            /


 case 25 "LIST分区表：建立 prefix-local 索引 create index .. on .. (..) LOCAL" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id ) local
            /
            create index idx_type_local on objects ( object_type ) LOCAL
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_TYPE_LOCAL'
            /
            select index_name||','||partitioning_type||','||partition_count from user_part_indexes where table_name='OBJECTS' and index_name='IDX_TYPE_LOCAL'
            /


 case 26 "LIST分区表：删除 prefix-local 索引" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
            drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id ) local
            /
            create index idx_type_local on objects ( object_type ) LOCAL
            /
            drop index idx_type_local
            /

        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_TYPE_LOCAL'
            /


 case 27 "LIST分区表：建立 GLOBAL RANGE-PARTITIONED INDEX" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
			drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id ) local
            /
            create index idx_type_local on objects ( object_type ) LOCAL
            /
            drop index idx_type_local
            /
            create index idx_type_global_range ON objects(object_type)
            global partition by range ( object_type ) (
               partition pm1_ix values less than ( 'INDEX' ),
               partition pm2_ix values less than ( 'TABLE' ),
               partition pmm_ix values less than ( MAXVALUE)
            )
            /

        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_TYPE_GLOBAL_RANGE'
            /
            select count(*) from user_ind_partitions where INDEX_NAME='IDX_TYPE_GLOBAL_RANGE'
            /
            select high_value from user_ind_partitions where INDEX_NAME='IDX_TYPE_GLOBAL_RANGE' and partition_name='PM2_IX'
            /

 case 28 "LIST分区表：删除 GLOBAL RANGE-PARTITIONED INDEX" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
			drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_object_id on objects ( object_id ) local
            /
            create index idx_type_local on objects ( object_type ) LOCAL
            /
            drop index idx_type_local
            /
            create index idx_type_global_range ON objects(object_type)
            global partition by range ( object_type ) (
               partition pm1_ix values less than ( 'INDEX' ),
               partition pm2_ix values less than ( 'TABLE' ),
               partition pmm_ix values less than ( MAXVALUE)
            )
            /
            drop index idx_type_global_range
            /

        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_TYPE_GLOBAL_RANGE'
            /


 case 29 "LIST分区表：建立 GLOBAL Hash-PARTITIONED INDEX (9i不支持)" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
			drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_type_global_hash ON objects(object_type)
              global partition by hash ( object_type ) (
                partition pm1_ix,
                partition pm2_ix,
                partition pm3_ix,
                partition pm4_ix
              )
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_TYPE_GLOBAL_HASH'
            /
            select count(*) from user_ind_partitions where INDEX_NAME='IDX_TYPE_GLOBAL_HASH'
            /


 case 30 "LIST分区表：删除 GLOBAL Hash-PARTITIONED INDEX (9i不支持)" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
			/
			drop index "objects_idx001"
            /
            drop index "objects_idx002"
            /
            create index idx_type_global_hash ON objects(object_type)
              global partition by hash ( object_type ) (
                partition pm1_ix,
                partition pm2_ix,
                partition pm3_ix,
                partition pm4_ix
              )
            /
            drop index idx_type_global_hash
            /
            
        tgt_sql:
            select count(*) from user_indexes where table_name='OBJECTS' and index_name='IDX_TYPE_GLOBAL_HASH'
            /

 case 31 "LIST分区表：删除LIST分区表" 0
        src_sql:
            drop table objects
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            create index "objects_idx001" on objects ( object_id, object_type )
            /
            create index "objects_idx002" on objects ( object_type ) local
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1004, 'INDEX' )
            /
            insert into objects values ( 1005, 'INDEX' )
            /
			commit
            /
            drop table objects
            /
            
        tgt_sql:
            select count(*) from user_tables where table_name='OBJECTS'
            /
