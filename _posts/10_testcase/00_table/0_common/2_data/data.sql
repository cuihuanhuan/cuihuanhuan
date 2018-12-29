case 47 "数据：字符类型建表(char、varchar2等）" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_char       char,
                c_char5      char(5),
                c_charbyte   char( 2 byte ),
                c_charchar   char( 2 char ),
                c_varchar2   varchar2(10),
                c_nvarchar2  nvarchar2(10)
            )
            /
                    tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/



case 48 "数据：字符类型插入数据" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_char       char,
                c_char5      char(5),
                c_charbyte   char( 2 byte ),
                c_charchar   char( 2 char ),
                c_varchar2   varchar2(10),
                c_nvarchar2  nvarchar2(10)
            )
            /
            insert into dds_table_test values ( 'A', '23456','XY','软1', '0123456789', '英方软件' )
            /
            commit
            /
                    tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select lengthb(c_char),lengthb(c_char5),lengthb(c_charbyte),lengthb(c_charchar),lengthb(c_varchar2),lengthb(c_nvarchar2) from dds_table_test
/
select * from dds_table_test
/

 case 49 "数据：字符类型修改数据" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_char       char,
                c_char5      char(5),
                c_charbyte   char( 2 byte ),
                c_charchar   char( 2 char ),
                c_varchar2   varchar2(10),
                c_nvarchar2  nvarchar2(10)
            )
            /
            insert into dds_table_test values ( 'A', '23456','XY','软1', '0123456789', '英方软件' )
            /
            update dds_table_test set c_varchar2='abcdefg', c_nvarchar2='' where c_char='A'
            /
            commit
            /
                    tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select lengthb(c_char),lengthb(c_char5),lengthb(c_charbyte),lengthb(c_charchar),lengthb(c_varchar2),lengthb(c_nvarchar2) from dds_table_test
/
select * from dds_table_test
/



 case 50 "数据：字符类型删除数据" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_char       char,
                c_char5      char(5),
                c_charbyte   char( 2 byte ),
                c_charchar   char( 2 char ),
                c_varchar2   varchar2(10),
                c_nvarchar2  nvarchar2(10)
            )
            /
            insert into dds_table_test values ( 'A', '23456','XY','软1', '0123456789', '英方软件' )
            /
            insert into dds_table_test values ( 'B', '78900','AA','软1', '0123456789', '英方软件' )
            /
            delete from dds_table_test where c_char = 'A'
            /
            commit
            /
                    tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select * from dds_table_test
/


 case 51 "数据：数字类型建表（number、integer、float等）" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_number       number,
                c_number5      number(5),
                c_number5_2    number(5,2),
                c_int          int,
                c_float        float,
                c_double       double precision,
                c_real         real,
                c_binary_float BINARY_FLOAT,
                c_BINARY_DOUBLE BINARY_DOUBLE
            )
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/


 case 52 "数据：数字类型插入数据" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_number       number,
                c_number5      number(5),
                c_number5_2    number(5,2),
                c_int          int,
                c_float        float,
                c_double       double precision,
                c_real         real,
                c_binary_float BINARY_FLOAT,
                c_BINARY_DOUBLE BINARY_DOUBLE
            )
            /
            insert into dds_table_test values ( 100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select lengthb(c_number),lengthb(c_number5),lengthb(c_number5_2),lengthb(c_int),lengthb(c_float),lengthb(c_double),lengthb(c_real),lengthb(c_binary_float),lengthb(c_BINARY_DOUBLE) from dds_table_test
/
select * from dds_table_test
/
select count(*) from dds_table_test
/


 case 53 "数据：数字类型修改数据" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_number       number,
                c_number5      number(5),
                c_number5_2    number(5,2),
                c_int          int,
                c_float        float,
                c_double       double precision,
                c_real         real,
                c_binary_float BINARY_FLOAT,
                c_BINARY_DOUBLE BINARY_DOUBLE
            )
            /
            insert into dds_table_test values ( 100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45 )
            /
            update dds_table_test set c_float=987.654
            /
            update dds_table_test set c_BINARY_FLOAT=987.654, c_BINARY_DOUBLE=123.456
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select lengthb(c_number),lengthb(c_number5),lengthb(c_number5_2),lengthb(c_int),lengthb(c_float),lengthb(c_double),lengthb(c_real),lengthb(c_binary_float),lengthb(c_BINARY_DOUBLE) from dds_table_test
/
select * from dds_table_test
/
select count(*) from dds_table_test
/

 case 54 "数据：数字类型删除数据" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_number       number,
                c_number5      number(5),
                c_number5_2    number(5,2),
                c_int          int,
                c_float        float,
                c_double       double precision,
                c_real         real,
                c_binary_float BINARY_FLOAT,
                c_BINARY_DOUBLE BINARY_DOUBLE
            )
            /
            insert into dds_table_test values ( 100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45 )
            /
            insert into dds_table_test values ( 110, 220, 343.67, 7, 109.23, 380.45, 504.6789, 170.23, 390.45 )
            /
            delete from dds_table_test where c_number = '100'
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 55 "数据：日期类型建表（date、timestamp等）" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                c_date               date,
                c_timestamp          timestamp,
                c_timestamp5         timestamp(5),
                c_timestampzone      timestamp with time zone,
                c_timestamp5zone     timestamp(5) with time zone,
                c_ts_lzone           timestamp with local time zone,
                c_ts5_lzone          timestamp(5) with local time zone,
                c_ym                 interval year to month,
                c_ym3                interval year (3) to month,
                c_ds                 interval day to second,
                c_ds_3               interval day (3) to second,
                c_ds_3_4             interval day (3) to second ( 4 )
            )
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/



case 56 "数据：日期类型插入数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_date               date,
                c_timestamp          timestamp,
                c_timestamp5         timestamp(5),
                c_timestampzone      timestamp with time zone,
                c_timestamp5zone     timestamp(5) with time zone,
                c_ts_lzone           timestamp with local time zone,
                c_ts5_lzone          timestamp(5) with local time zone,
                c_ym                 interval year to month,
                c_ym3                interval year (3) to month,
                c_ds                 interval day to second,
                c_ds_3               interval day (3) to second,
                c_ds_3_4             interval day (3) to second ( 4 )
            )
            /
            insert into dds_table_test values (
                to_date( '08/12/21 12:34:56','YY/MM/DD HH24:MI:SS' ),
                TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_YMINTERVAL('01-02'),
                TO_YMINTERVAL('03-04'),
                TO_DSINTERVAL('001 10:00:00'),
                TO_DSINTERVAL('002 12:34:56'),
                TO_DSINTERVAL('003 10:20:30')
            )
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 57 "数据：日期类型修改数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_date               date,
                c_timestamp          timestamp,
                c_timestamp5         timestamp(5),
                c_timestampzone      timestamp with time zone,
                c_timestamp5zone     timestamp(5) with time zone,
                c_ts_lzone           timestamp with local time zone,
                c_ts5_lzone          timestamp(5) with local time zone,
                c_ym                 interval year to month,
                c_ym3                interval year (3) to month,
                c_ds                 interval day to second,
                c_ds_3               interval day (3) to second,
                c_ds_3_4             interval day (3) to second ( 4 )
            )
            /
            insert into dds_table_test values (
                to_date( '08/12/21 12:34:56','YY/MM/DD HH24:MI:SS' ),
                TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_YMINTERVAL('01-02'),
                TO_YMINTERVAL('03-04'),
                TO_DSINTERVAL('001 10:00:00'),
                TO_DSINTERVAL('002 12:34:56'),
                TO_DSINTERVAL('003 10:20:30')
            )
            /
            update dds_table_test set c_timestamp=sysdate
            /
            update dds_table_test set c_ym=TO_YMINTERVAL('02-01')
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 58 "数据：日期类型删除数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_date               date,
                c_timestamp          timestamp,
                c_timestamp5         timestamp(5),
                c_timestampzone      timestamp with time zone,
                c_timestamp5zone     timestamp(5) with time zone,
                c_ts_lzone           timestamp with local time zone,
                c_ts5_lzone          timestamp(5) with local time zone,
                c_ym                 interval year to month,
                c_ym3                interval year (3) to month,
                c_ds                 interval day to second,
                c_ds_3               interval day (3) to second,
                c_ds_3_4             interval day (3) to second ( 4 )
            )
            /
            insert into dds_table_test values (
                to_date( '08/12/21 12:34:56','YY/MM/DD HH24:MI:SS' ),
                TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_YMINTERVAL('01-02'),
                TO_YMINTERVAL('03-04'),
                TO_DSINTERVAL('001 10:00:00'),
                TO_DSINTERVAL('002 12:34:56'),
                TO_DSINTERVAL('003 10:20:30')
            )
			/
            insert into dds_table_test values (
                to_date( '09/12/21 12:34:56','YY/MM/DD HH24:MI:SS' ),
                TO_TIMESTAMP ('11-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP ('21-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
                TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_TIMESTAMP_TZ('2008-12-09 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
                TO_YMINTERVAL('01-05'),
                TO_YMINTERVAL('02-04'),
                TO_DSINTERVAL('006 10:00:00'),
                TO_DSINTERVAL('005 12:34:56'),
                TO_DSINTERVAL('004 10:20:30')
            )
			/
            delete from dds_table_test where c_ym=TO_YMINTERVAL('01-05')
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select * from dds_table_test
/

 case 59 "数据：LOB类型建表（clob、blob 等)" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_blob              blob,
                c_clob              clob,
                c_web_page          bfile
            )
            /
 tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/

 case 60 "数据：LOB类型插入数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_blob              blob,
                c_clob              clob
            )
            /
            insert into dds_table_test values ( 'AABBCCDDEEFF00112233', 'DDS By 上海英方软件股份有限公司' )
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 61 "数据：LOB类型修改数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_blob              blob,
                c_clob              clob
            )
            /
            insert into dds_table_test values ( 'AABBCCDDEEFF00112233', 'DDS By 上海英方软件股份有限公司' )
            /
			update dds_table_test set c_blob='ABCDEF',c_clob='DDS开发商:上海英方软件股份有限公司'
			/
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 63 "字段类型测试：插入记录：RAW, LONG RAW" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_int               int,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/



 case 64 "数据：RAW类型插入数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_int               int,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            insert into dds_table_test values ( 1, 'ABCDEF', '00112233445566778899aabbccddeeff' )
			/
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 65 "数据：RAW类型修改数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_int               int,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            insert into dds_table_test values ( 1, 'ABCDEF', '00112233445566778899aabbccddeeff' )
			/
            update dds_table_test set c_raw6='FFEEDD', c_lraw='ffeeddccbbaa9988776655'
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 71 "数据：建表(ROWID, UROWID)" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_rid               rowid,
                c_urid              urowid
            )
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/


 case 72 "数据：插入数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_rid               rowid,
                c_urid              urowid
            )
            /
            insert into dds_table_test values ( 'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select count(*) from dds_table_test
/
select * from dds_table_test
/

 case 73 "数据：修改数据：" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_rid               rowid,
                c_urid              urowid
            )
            /
            insert into dds_table_test values ( 'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
            /
            update dds_table_test set c_rid='AAAYj3AAEAAADT8ABC', c_urid='*BAEANzQCwQMKyRcXFxcXFxcXF/4'
            /
            commit
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select * from dds_table_test
/
select count(*) from dds_table_test
/

 case 74 "数据：删除数据" 0
        src_sql:
            drop table dds_table_test purge
            /
            create table dds_table_test (
                c_rid               rowid,
                c_urid              urowid
            )
            /
            insert into dds_table_test values ( 'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
            /
            update dds_table_test set c_rid='AAAYj3AAEAAADT8ABC', c_urid='*BAEANzQCwQMKyRcXFxcXFxcXF/4'
            /
            delete from dds_table_test
            /
			COMMIT
			/
tgt_sql:
select count(*) from dds_table_test
<<<<<<< .mine
/



 case 75 "数据：删除数据" 0
        src_sql:
            create table t1(id number(2),x interval year to month,y interval day to second)
            /
  insert into t1 values (1,interval '5' year,interval '2' day)
  /
  commit
  /
tgt_sql:
select count(*) from t1
||||||| .r177
=======
/


case 75 "数据：update数据为null" 0
    src_sql:
        drop table test purge
		/
		create table test (f1 number primary key,f2 varchar2(100),f3 number)
		/
		begin
			for i in 1..5 loop
				insert into test values(i,rpad('b',i,'a'),i);
				commit;
			end loop;
		end;
		/
		update test set f2=null where f1=2
		/
		update test set f3=null where f1=2
		/
		commit
		/

 case 75 "interval时间" 0
        src_sql:
            create table t1(id number(2),x interval year to month,y interval day to second)
            /
  insert into t1 values (1,interval '5' year,interval '2' day)
  /
  commit
  /
tgt_sql:
select count(*) from t1
/