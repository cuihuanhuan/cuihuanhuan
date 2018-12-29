case 338 "LIST分区表：建立列表分区表" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER primary key, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name='OBJECTS' order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/

 case 339 "LIST分区表：增加分区" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER primary key, object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            ALTER TABLE objects ADD PARTITION type_package VALUES ( 'PACKAGE', 'PACKAGE BODY' ) TABLESPACE system
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name='OBJECTS' order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/

 case 340 "LIST分区表：删除分区" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER,
             object_type VARCHAR2(19) )
                   PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
            ALTER TABLE objects DROP PARTITION type_table
            /
            alter index PK_L rebuild
            /
            update objects set object_id=object_id+100 where object_type='INDEX'
            /
            COMMIT
            /
            update objects set object_id=object_id+100 where object_type='VIEW'
            /
            COMMIT
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 341 "LIST分区表：插入记录" 0
        src_sql:
            drop table objects purge
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
             alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/

 case 342 "LIST分区表：交换分区" 0
        src_sql:
            drop table objects purge
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
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
			commit
			/
            drop table swap_t purge
            /
            CREATE TABLE swap_t AS SELECT object_id-10000 as object_id, object_type FROM objects WHERE object_type='TABLE'
            /
            ALTER TABLE objects EXCHANGE PARTITION type_table WITH TABLE swap_t
            /
            update objects set object_id=object_id+100 where object_type='TABLE'
            /
            commit
            /
            update objects set object_id=object_id+100 where object_type='INDEX'
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','SWAP_T') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/
select * from swap_t order by object_id
/

 case 343 "LIST分区表：合并分区" 0
        src_sql:
            drop table objects purge
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
            alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
            commit
            /
            ALTER TABLE objects MERGE PARTITIONS type_table, type_index INTO PARTITION type_tab_ind
            /
            alter index PK_L rebuild
            /
            update objects set object_id=object_id+100 where object_type='INDEX'
            /
            commit
            /
            update objects set object_id=object_id+100 where object_type='VIEW'
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/



 case 344 "LIST分区表：在分区中增加键值" 0
        src_sql:
            drop table objects purge
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
            alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
            commit
            /
            ALTER TABLE objects MODIFY PARTITION type_view ADD VALUES ('JAVA','C++')
            /
            insert into objects values (11,'JAVA')
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 345 "LIST分区表：在分区中删除键值" 0
        src_sql:
            drop table objects purge
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
            alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            insert into objects values ( 1, 'TABLE' )
            /
            insert into objects values ( 2, 'INDEX' )
            /
            commit
            /
            ALTER TABLE objects MERGE PARTITIONS type_table, type_index INTO PARTITION type_tab_ind
            /
            ALTER TABLE objects MODIFY PARTITION type_other DROP VALUES ('PROCEDURE')
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/



 case 346 "LIST分区表：移动分区（移动到相同表空间）：移动" 0
        src_sql:
            drop table objects purge
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
            alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
            commit
            /
            ALTER TABLE objects MERGE PARTITIONS type_table, type_index INTO PARTITION type_tab_ind
            /
            alter index PK_L rebuild
            /
            ALTER TABLE objects MOVE PARTITION type_tab_ind tablespace users
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 347 "LIST分区表：移动分区（移动到相同表空间）：验证移动后的数据是否正确" 0
        src_sql:
            drop table objects purge
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
			alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            insert into objects values ( 1, 'TABLE' )
            /
            insert into objects values ( 2, 'INDEX' )
            /
            commit
            /
            ALTER TABLE objects MERGE PARTITIONS type_table, type_index INTO PARTITION type_tab_ind 
            /
            ALTER TABLE objects MOVE PARTITION type_tab_ind tablespace users
            /
			alter index PK_L rebuild
            /
            update objects partition ( type_tab_ind ) set object_id=1000000+object_id
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 348 "LIST分区表：移动分区（移动到其它表空间）：移动" 0
        src_sql:
            drop table objects purge
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
			alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            insert into objects values ( 1, 'TABLE' )
            /
            insert into objects values ( 2, 'INDEX' )
            /
            commit
            /
            ALTER TABLE objects MERGE PARTITIONS type_table, type_index INTO PARTITION type_tab_ind
            /
            ALTER TABLE objects MOVE PARTITION type_tab_ind TABLESPACE system
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 349 "LIST分区表：更名分区" 0
        src_sql:
            drop table objects purge
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
            alter table objects add constraint PK_L primary key (object_id)
            /
            INSERT INTO objects SELECT object_id, object_type FROM user_objects WHERE object_type IN ( 'TABLE','INDEX' )
            /
            INSERT INTO objects VALUES (1,'VIEW')
            /
            INSERT INTO objects VALUES (2,'TABLE')
            /
            INSERT INTO objects VALUES (3,'INDEX')
            /
            commit
            /
            ALTER TABLE objects MERGE PARTITIONS type_table, type_index INTO PARTITION type_tab_ind
            /
            alter index PK_L rebuild
            /
            alter table objects rename partition type_tab_ind to type_table_index
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/



 case 350 "LIST分区表：分裂分区：第一个分裂出来的分区包含数据：建立分区表" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            alter table objects add constraint PK_L primary key (object_id)
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
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 351 "LIST分区表：分裂分区：第一个分裂出来的分区包含数据：分裂分区" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            alter table objects add constraint PK_L primary key (object_id)
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1003, 'TABLE' )
            /
            insert into objects values ( 1009, 'INDEX' )
            /
            ALTER TABLE objects SPLIT PARTITION type_tab_idx VALUES ('TABLE') INTO (
                  PARTITION type_table TABLESPACE users,
                  PARTITION type_index TABLESPACE system  )
            /
            alter index PK_L rebuild
            /
            update objects set object_id=object_id+10000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/

 case 352 "LIST分区表：分裂分区：第二个分裂出来的分区包含数据：建立分区表" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
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
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 353 "LIST分区表：分裂分区：第二个分裂出来的分区包含数据：分裂分区" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
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
            update objects set object_id=object_id+10000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 354 "LIST分区表：分裂分区：分裂出来的2个分区均包含数据：建立分区表" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            alter table objects add constraint PK_L primary key (object_id)
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
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 355 "LIST分区表：分裂分区：分裂出来的2个分区均包含数据：分裂分区" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
               partition type_tab_idx VALUES ('TABLE', 'INDEX' ) TABLESPACE users,
               partition type_view    VALUES ('VIEW'           ) TABLESPACE system,
               partition type_other   VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
               partition type_null  VALUES (NULL)
            )
            /
            alter table objects add constraint PK_L primary key (object_id)
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
            alter index PK_L rebuild
            /
            update objects set object_id=object_id+10000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/


 case 356 "LIST分区表：TRUNCATE 分区" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            alter table objects add constraint PK_L primary key (object_id)
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'VIEW' )
            /
            insert into objects values ( 1004, 'FUNCTION' )
            /
            insert into objects values ( 1005, 'TRIGGER' )
            /
            commit
            /
            update objects set object_id=object_id+10000
            /
			commit
            /
            alter table objects truncate partition type_view
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/

 case 357 "LIST分区表：TRUNCATE 分区：TRUNCATE后执行UPDATE" 0
        src_sql:
            drop table objects purge
            /
            create table objects ( object_id NUMBER, object_type VARCHAR2(19) ) PARTITION BY LIST ( object_type ) (
                       PARTITION type_table VALUES ('TABLE' ) TABLESPACE users,
                       PARTITION type_index VALUES ('INDEX' ) NOLOGGING,
                       PARTITION type_view  VALUES ('VIEW'  ) TABLESPACE system,
                       PARTITION type_other VALUES ('FUNCTION','TRIGGER','PROCEDURE'),
                       PARTITION type_null  VALUES (NULL)
                   )
            /
            alter table objects add constraint PK_L primary key (object_id)
            /
            insert into objects values ( 1001, 'TABLE' )
            /
            insert into objects values ( 1002, 'INDEX' )
            /
            insert into objects values ( 1003, 'VIEW' )
            /
            insert into objects values ( 1004, 'FUNCTION' )
            /
            insert into objects values ( 1005, 'TRIGGER' )
            /
            update objects set object_id=object_id+10000
            /
			commit
            /
            alter table objects truncate partition type_table
            /
			alter index PK_L rebuild
			/
            insert into objects values ( 1001000, 'TABLE' )
            /
            insert into objects values ( 1002000, 'INDEX' )
            /
            insert into objects values ( 1003000, 'TABLE' )
            /
            commit
            /
            update objects set object_id=object_id+10000000
            /
            commit
            /
        tgt_sql:
select object_name,object_type from user_objects where object_name in('OBJECTS','PK_L') order by object_name,object_type
/
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECTS' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECTS'
/
select table_name,partition_name,tablespace_name,high_value from user_tab_partitions where table_name='OBJECTS' order by partition_name
/
select * from objects order by object_id
/