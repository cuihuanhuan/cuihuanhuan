 case 1 "临时表：建立表(会话级)" 0
        src_sql:
            drop table TMP_TEST
            /
            CREATE GLOBAL TEMPORARY TABLE TMP_TEST(ID NUMBER ,NAME VARCHAR2(32)
                        ) ON COMMIT PRESERVE ROWS
                        /
            INSERT INTO TMP_TEST SELECT 1, 'kerry' FROM DUAL
            /
            COMMIT
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='TMP_TEST' order by column_name
/
select temporary from user_tables where table_name='TMP_TEST'
/

 case 2 "临时表：删除表(会话级)" 0
         src_sql:
            TRUNCATE TABLE TMP_TEST
            /
			drop table TMP_TEST
            /
            CREATE GLOBAL TEMPORARY TABLE TMP_TEST(ID NUMBER ,NAME VARCHAR2(32)
                        ) ON COMMIT PRESERVE ROWS
            /
            INSERT INTO TMP_TEST SELECT 1, 'kerry' FROM DUAL
            /
            COMMIT
            /
            TRUNCATE TABLE TMP_TEST
            /
            DROP TABLE TMP_TEST PURGE
            /
tgt_sql:
select COUNT(*) from user_tables where table_name='TMP_TEST'
/

 case 3 "临时表：建立表(事务级)" 0
        src_sql:
            drop table TMP_TEST
            /
            CREATE GLOBAL TEMPORARY TABLE TMP_TEST(ID NUMBER ,NAME VARCHAR2(32)
                        ) ON COMMIT DELETE ROWS
            /
            INSERT INTO TMP_TEST SELECT 1, 'kerry' FROM DUAL
            /
            COMMIT
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='TMP_TEST' order by column_name
/
select temporary from user_tables where table_name='TMP_TEST'
/
            
            
 case 4 "临时表：删除表(事务级)" 0
         src_sql:
             drop table TMP_TEST
             /
             CREATE GLOBAL TEMPORARY TABLE TMP_TEST(ID NUMBER ,NAME VARCHAR2(32)
                        ) ON COMMIT DELETE ROWS
            /
            INSERT INTO TMP_TEST SELECT 1, 'kerry' FROM DUAL
            /
            COMMIT
            /
            DROP TABLE TMP_TEST PURGE
            /
tgt_sql:
select COUNT(*) from user_tables where table_name='TMP_TEST'
/