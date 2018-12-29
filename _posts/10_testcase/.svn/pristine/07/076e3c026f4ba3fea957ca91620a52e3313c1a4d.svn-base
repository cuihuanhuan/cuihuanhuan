case 1 "数据：字符类型建表(char、varchar2等）" 0
src_sql:
drop table dds_char_test
/
create table dds_char (
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/



case 2 "数据：字符类型插入数据" 0
src_sql:
drop table dds_char
/
create table dds_char (
    no           int primary key,
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
insert into dds_char values ( 1,'A', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 2,'B', '45678','ED','CV', '0123456789', 'INFO' )
/
insert into dds_char values ( 3,'C', '45678','JK','DH', '0123456789', 'INFO' )
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/
select * from dds_char
/

case 3 "数据：字符类型修改数据" 0
src_sql:
drop table dds_char
/
create table dds_char (
    no           int primary key,
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
insert into dds_char values ( 1,'A', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 2,'B', '45678','ED','CV', '0123456789', 'INFO' )
/
insert into dds_char values ( 3,'C', '45678','JK','DH', '0123456789', 'INFO' )
/
insert into dds_char values ( 4,'D', '56789','JK','DH', '0123456789', 'INFO' )
/
commit
/
update dds_char set c_char='X' where no=2
/
commit
/
delete from dds_char where  no=3
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/
select * from dds_char
/


case 4 "数据：字符类型 增加列" 0
src_sql:
drop table dds_char
/
create table dds_char (
    no           int primary key,
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
insert into dds_char values ( 1,'A', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 2,'B', '45678','ED','CV', '0123456789', 'INFO' )
/
commit
/
alter table dds_char add v1 char
/
insert into dds_char values ( 10,'C', '56789','GH','BN', '0123456789', 'INFO','x' )
/
insert into dds_char values ( 11,'D' ,'45678','ED','CV', '0123456789', 'INFO','x' )
/
insert into dds_char values ( 12,'E' , '45678','JK','DH','0123456789', 'INFO','x' )
/
commit
/
update dds_char set c_char='X' where no=10
/
commit
/
delete from dds_char where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/
select * from dds_char
/


case 5 "数据：字符类型 重命名列" 0
src_sql:
drop table dds_char
/
create table dds_char (
    no           int primary key,
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
insert into dds_char values ( 1,'A', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 2,'B', '45678','ED','CV', '0123456789', 'INFO' )
/
commit
/
alter table dds_char rename column c_char to v1 
/
insert into dds_char values ( 10,'C', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 11,'D' ,'45678','ED','CV', '0123456789', 'INFO' )
/
insert into dds_char values ( 12,'E' , '45678','JK','DH','0123456789', 'INFO' )
/
commit
/
update dds_char set c_char5='X' where no=10
/
commit
/
delete from dds_char where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/
select * from dds_char
/

case 6 "数据：字符类型 修改列属性" 0
src_sql:
drop table dds_char
/
create table dds_char (
    no           int primary key,
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
insert into dds_char values ( 1,'A', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 2,'B', '45678','ED','CV', '0123456789', 'INFO' )
/
commit
/
alter table dds_char modify (c_char varchar2(2)) 
/
insert into dds_char values ( 10,'C', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 11,'D' ,'45678','ED','CV', '0123456789', 'INFO' )
/
insert into dds_char values ( 12,'E' , '45678','JK','DH','0123456789', 'INFO' )
/
commit
/
update dds_char set c_char5='X' where no=10
/
commit
/
delete from dds_char where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/
select * from dds_char
/

case 7 "数据：字符类型 删除列" 0
src_sql:
drop table dds_char
/
create table dds_char (
    no           int primary key,
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
insert into dds_char values ( 1,'A', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 2,'B', '45678','ED','CV', '0123456789', 'INFO' )
/
commit
/
alter table dds_char drop column c_char 
/
insert into dds_char values ( 10, '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 11, '45678','ED','CV', '0123456789', 'INFO' )
/
insert into dds_char values ( 12, '45678','JK','DH', '0123456789', 'INFO' )
/
commit
/
update dds_char set c_char5='X' where no=10
/
commit
/
delete from dds_char where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/
select * from dds_char
/

case 8 "数据：字符类型 truncate表" 0
src_sql:
drop table dds_char
/
create table dds_char (
    no           int primary key,
    c_char       char,
    c_char5      char(5),
    c_charbyte   char( 2 byte ),
    c_charchar   char( 2 char ),
    c_varchar2   varchar2(10),
    c_nvarchar2  nvarchar2(10)
)
/
insert into dds_char values ( 1,'A', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 2,'B', '45678','ED','CV', '0123456789', 'INFO' )
/
commit
/
truncate table dds_char 
/
insert into dds_char values ( 10,'C', '56789','GH','BN', '0123456789', 'INFO' )
/
insert into dds_char values ( 11,'D', '45678','ED','CV', '0123456789', 'INFO' )
/
insert into dds_char values ( 12,'E', '45678','JK','DH', '0123456789', 'INFO' )
/
commit
/
update dds_char set c_char5='X' where no=10
/
commit
/
delete from dds_char where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_CHAR' order by table_name 
/
select * from dds_char
/


case 9 "数据：数字类型建表（number、integer、float等）" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
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
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/


case 10 "数据：数字类型插入数据" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
    c_number       number,
    c_number5      number(5),
    c_number5_2    number(5,2),
    c_int          int,
    c_float        float,
    c_double       double precision,
    c_real         real
)
/
insert into dds_no values ( 1,100, 400, 123.45, 1, 100.23, 300.45, 500.6789 )
/
insert into dds_no values ( 2,200, 400, 345.54, 1, 100.23, 300.45, 500.6789 )
/
insert into dds_no values ( 3,300, 400, 654.54, 1, 100.23, 300.45, 500.6789  )
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/
select * from dds_no
/


case 11 "数据：数字类型修改数据" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
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
insert into dds_no values ( 1,100, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 2,200, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 3,300, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 4,400, 400, 789.98, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
commit
/
update dds_no set c_number='12345' where no=2
/
commit
/
delete from dds_no where  no=3
/
commit
/

tgt_sql:
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/
select * from dds_no
/


case 12 "数据：数字类型 增加列" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
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
insert into dds_no values ( 1,100, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 2,200, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
commit
/
alter table dds_no add v1 number
/
insert into dds_no values ( 10,1000, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
/
insert into dds_no values ( 11,1100, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
/
insert into dds_no values ( 12,1200, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
/
commit
/       
update dds_no set c_number='12345' where no=10
/
commit
/
delete from dds_no where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/
select * from dds_no
/


case 13 "数据：数字类型 重命名列" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
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
insert into dds_no values ( 1,100, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 2,200, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
commit
/
alter table dds_no rename column c_number to v1 
/
insert into dds_no values ( 10,1000, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 11,1100, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 12,1200, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
/
commit
/       
update dds_no set c_number5='12345' where no=10
/
commit
/
delete from dds_no where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/
select * from dds_no
/


case 14 "数据：数字类型 修改列属性" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
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
alter table dds_no modify (c_number int)
/
insert into dds_no values ( 10,1000, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 11,1100, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
/
insert into dds_no values ( 12,1200, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
/
commit
/       
update dds_no set c_number5='12345' where no=10
/
commit
/
delete from dds_no where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/
select * from dds_no
/

case 15 "数据：数字类型 删除列" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
    c_number       number,
    c_number5      number(5),
    c_number5_2    number(5,2),
    c_int          int,
    c_float        float,
    c_double       double precision,
    c_real         real
)
/
insert into dds_no values ( 1,100, 400, 123.45, 1, 100.23, 300.45, 500.6789 )
/
insert into dds_no values ( 2,200, 400, 345.54, 1, 100.23, 300.45, 500.6789  )
/
commit
/
alter table dds_no drop column c_number 
/
insert into dds_no values ( 10, 400, 123.45, 2, 100.23, 300.45, 500.6789  )
/
insert into dds_no values ( 11, 400, 345.54, 2, 100.23, 300.45, 500.6789 )
/
insert into dds_no values ( 12, 400, 654.54, 2, 100.23, 300.45, 500.6789 )
/
commit
/       
update dds_no set c_number5='12345' where no=10
/
commit
/
delete from dds_no where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/
select * from dds_no
/


case 16 "数据：数字类型 truncate表" 0
src_sql:
drop table dds_no
/
create table dds_no (
    no             int primary key,
    c_number       number,
    c_number5      number(5),
    c_number5_2    number(5,2),
    c_int          int,
    c_float        float,
    c_double       double precision,
    c_real         real
)
/
insert into dds_no values ( 1,100, 400, 123.45, 1, 100.23, 300.45, 500.6789 )
/
insert into dds_no values ( 2,200, 400, 345.54, 1, 100.23, 300.45, 500.6789  )
/
commit
/
truncate table dds_no
/
insert into dds_no values ( 10,300, 400, 123.45, 2, 100.23, 300.45, 500.6789  )
/
insert into dds_no values ( 11,400, 400, 345.54, 2, 100.23, 300.45, 500.6789 )
/
insert into dds_no values ( 12,500, 400, 654.54, 2, 100.23, 300.45, 500.6789 )
/
commit
/       
update dds_no set c_number5='12345' where no=10
/
commit
/
delete from dds_no where  no=11
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_precision from user_tab_columns where table_name = 'DDS_NO' order by table_name 
/
select * from dds_no
/


case 17 "数据：日期类型建表（date、timestamp等）" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/



case 18 "数据：日期类型插入数据" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
insert into dds_time values (4,
to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_YMINTERVAL('01-02'),
TO_YMINTERVAL('03-04'),
TO_DSINTERVAL('001 10:00:00'),
TO_DSINTERVAL('002 12:34:56'),
TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (5,
to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_YMINTERVAL('01-02'),
TO_YMINTERVAL('03-04'),
TO_DSINTERVAL('001 10:00:00'),
TO_DSINTERVAL('002 12:34:56'),
TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (6,
to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
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
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/
select * from dds_time
/


case 19 "数据：日期类型修改数据" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
insert into dds_time values (1,
to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_YMINTERVAL('01-02'),
TO_YMINTERVAL('03-04'),
TO_DSINTERVAL('001 10:00:00'),
TO_DSINTERVAL('002 12:34:56'),
TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (2,
to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_YMINTERVAL('01-02'),
TO_YMINTERVAL('03-04'),
TO_DSINTERVAL('001 10:00:00'),
TO_DSINTERVAL('002 12:34:56'),
TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (3,
to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
TO_YMINTERVAL('01-02'),
TO_YMINTERVAL('03-04'),
TO_DSINTERVAL('001 10:00:00'),
TO_DSINTERVAL('002 12:34:56'),
TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
update dds_time set c_date=to_date( '17/11/16 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=2
/
commit
/
delete from dds_time where  no=3
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/
select * from dds_time
/

case 20 "数据：日期类型 增加列" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
insert into dds_time values (1,
    to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
alter table dds_time add v1 date
/
insert into dds_time values (2,
    to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30'),
    to_date( '17/10/02 12:34:56','YY/MM/DD HH24:MI:SS' )
)
/
insert into dds_time values (3,
    to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30'),
    to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
)
/       
insert into dds_time values (4,
    to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30'),
    to_date( '17/10/04 12:34:56','YY/MM/DD HH24:MI:SS' )
)
/
commit
/
update dds_time set c_date=to_date( '17/11/16 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=3
/
commit
/
delete from dds_time where  no=4
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/
select no,c_date from dds_time
/

case 21 "数据：日期类型 重命名列" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
insert into dds_time values (1,
    to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
alter table dds_time rename column c_date to v1 
/
insert into dds_time values (2,
    to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (3,
    to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/       
insert into dds_time values (4,
    to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
update dds_time set v1=to_date( '17/11/16 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=3
/
commit
/
delete from dds_time where  no=4
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/
select no,v1 from dds_time
/

case 22 "数据：日期类型 修改列属性" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
insert into dds_time values (1,
    to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
alter table dds_time modify (c_date timestamp) 
/
insert into dds_time values (2,
    to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (3,
    to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/       
insert into dds_time values (4,
    to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
update dds_time set c_date=to_date( '17/11/16 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=3
/
commit
/
delete from dds_time where  no=4
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/
select no,c_date from dds_time
/

case 23 "数据：日期类型 删除列" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
insert into dds_time values (1,
    to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
alter table dds_time drop column c_date
/
insert into dds_time values (2,
    TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (3,
    TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/       
insert into dds_time values (4,
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
update dds_time set c_timestamp=TO_TIMESTAMP ('11-11-11 11:11:11.123000', 'DD-MM-RR HH24:MI:SS.FF') where no=3
/
commit
/
delete from dds_time where  no=4
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/
select no,c_timestamp from dds_time
/


case 24 "数据：日期类型 truncate表" 0
src_sql:
drop table dds_time
/
create table dds_time (
    no                   int primary key,
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
insert into dds_time values (1,
    to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
truncate table dds_time
/
insert into dds_time values (2,
    to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
insert into dds_time values (3,
    to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/       
insert into dds_time values (4,
    to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
    TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
    TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
    TO_YMINTERVAL('01-02'),
    TO_YMINTERVAL('03-04'),
    TO_DSINTERVAL('001 10:00:00'),
    TO_DSINTERVAL('002 12:34:56'),
    TO_DSINTERVAL('003 10:20:30')
)
/
commit
/
update dds_time set c_timestamp=TO_TIMESTAMP ('11-11-11 11:11:11.123000', 'DD-MM-RR HH24:MI:SS.FF') where no=3
/
commit
/
delete from dds_time where  no=4
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_TIME' order by table_name 
/
select no,c_timestamp from dds_time
/



case 25 "数据：LOB类型建表（clob、blob 等)" 0
src_sql:
drop table dds_lob
/
create table dds_lob (
    no                  int primary key,
    c_blob              blob,
    c_clob              clob,
    c_web_page          bfile
)
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_LOB' order by table_name 
/

case 26 "数据：LOB类型插入数据" 0
src_sql:
drop table dds_lob
/
create table dds_lob (
    no                  int primary key,
    c_blob              blob,
    c_clob              clob
)
/
insert into dds_lob values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft') )
/
insert into dds_lob values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft') )
/
insert into dds_lob values ( 3,rawtohex('cccccc'), rawtohex('info2soft') )
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_LOB' order by table_name 
/
select * from dds_lob
/

case 27 "数据：LOB类型修改数据" 0
src_sql:
drop table dds_lob
/
create table dds_lob (
    no                  int primary key,
    c_blob              blob,
    c_clob              clob
)
/
insert into dds_lob values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft') )
/
insert into dds_lob values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft') )
/
insert into dds_lob values ( 3,rawtohex('cccccc'), rawtohex('info2soft') )
/
commit
/
update dds_lob set c_blob=rawtohex('abcdefg') where no=2
/
commit
/
delete from dds_lob where  no=3
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_LOB' order by table_name 
/
select * from dds_lob
/

case 28 "数据：LOB类型 增加列" 0
src_sql:
drop table dds_lob
/
create table dds_lob (
    no                  int primary key,
    c_blob              blob,
    c_clob              clob
)
/
insert into dds_lob values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft') )
/
insert into dds_lob values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft') )
/
insert into dds_lob values ( 3,rawtohex('cccccc'), rawtohex('info2soft') )
/
commit
/
alter table dds_lob add v1 blob
/
insert into dds_lob values ( 7,rawtohex('gggggg'), rawtohex('info2soft'),rawtohex('ggggg'))
/
insert into dds_lob values ( 8,rawtohex('hhhhhh'), rawtohex('info2soft'),rawtohex('hhhhh'))
/
insert into dds_lob values ( 9,rawtohex('iiiiii'), rawtohex('info2soft'),rawtohex('iiiii'))
/
update dds_lob set c_blob=rawtohex('abcdefg') where no=7
/
commit
/
delete from dds_lob where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_LOB' order by table_name 
/
select * from dds_lob
/

case 29 "数据：LOB类型 重命名列" 0
src_sql:
drop table dds_lob
/
create table dds_lob (
    no                  int primary key,
    c_blob              blob,
    c_clob              clob
)
/
insert into dds_lob values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft') )
/
insert into dds_lob values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft') )
/
insert into dds_lob values ( 3,rawtohex('cccccc'), rawtohex('info2soft') )
/
commit
/
alter table dds_lob rename column c_blob to v1
/
insert into dds_lob values ( 7,rawtohex('gggggg'), rawtohex('info2soft'))
/
insert into dds_lob values ( 8,rawtohex('hhhhhh'), rawtohex('info2soft'))
/
insert into dds_lob values ( 9,rawtohex('iiiiii'), rawtohex('info2soft'))
/
update dds_lob set v1=rawtohex('abcdefg') where no=7
/
commit
/
delete from dds_lob where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_LOB' order by table_name 
/
select * from dds_lob
/

case 30 "数据：LOB类型 删除列" 0
src_sql:
drop table dds_lob
/
create table dds_lob (
    no                  int primary key,
    c_blob              blob,
    c_clob              clob
)
/
insert into dds_lob values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft') )
/
insert into dds_lob values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft') )
/
insert into dds_lob values ( 3,rawtohex('cccccc'), rawtohex('info2soft') )
/
commit
/
alter table dds_lob drop column c_blob 
/
insert into dds_lob values ( 7, rawtohex('info2soft'))
/
insert into dds_lob values ( 8, rawtohex('info2soft'))
/
insert into dds_lob values ( 9, rawtohex('info2soft'))
/
update dds_lob set c_clob=rawtohex('abcdefg') where no=7
/
commit
/
delete from dds_lob where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_LOB' order by table_name 
/
select * from dds_lob
/


case 31 "数据：LOB类型 truncate表" 0
src_sql:
drop table dds_lob
/
create table dds_lob (
    no                  int primary key,
    c_blob              blob,
    c_clob              clob
)
/
insert into dds_lob values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft') )
/
insert into dds_lob values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft') )
/
insert into dds_lob values ( 3,rawtohex('cccccc'), rawtohex('info2soft') )
/
commit
/
truncate table dds_lob
/
insert into dds_lob values ( 7,rawtohex('dddddd'), rawtohex('info2soft'))
/
insert into dds_lob values ( 8,rawtohex('eeeeee'), rawtohex('info2soft'))
/
insert into dds_lob values ( 9,rawtohex('ffffff'), rawtohex('info2soft'))
/
update dds_lob set c_clob=rawtohex('abcdefg') where no=7
/
commit
/
delete from dds_lob where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_LOB' order by table_name 
/
select * from dds_lob
/


case 32 "字段类型测试：插入记录：RAW, LONG RAW" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/


case 33 "数据：RAW类型插入数据" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/

case 34 "数据：RAW类型修改数据" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
update dds_raw set c_raw6=rawtohex('INFOFO') where no=2
/
commit
/
delete from dds_raw where  no=3
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/


case 35 "数据：RAW类型修改数据" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
update dds_raw set c_raw6=rawtohex('INFOFO') where no=2
/
commit
/
delete from dds_raw where  no=3
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/


case 36 "数据：RAW类型 增加列" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
alter table dds_raw add v1 raw(10)
/
insert into dds_raw values ( 7, 70,'ABCDEF','00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
/
insert into dds_raw values ( 8, 80,'ABCDEF','00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
/
insert into dds_raw values ( 9, 90,'ABCDEF','00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
/
commit
/
update dds_raw set c_raw6=rawtohex('INFOFO') where no=7
/
commit
/
delete from dds_raw where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/

case 37 "数据：RAW类型 重命名列" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
alter table dds_raw rename column c_int to v1 
/
insert into dds_raw values ( 7, 70,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 8, 80,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 9, 90,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
update dds_raw set c_raw6=rawtohex('INFOFO') where no=7
/
commit
/
delete from dds_raw where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/


case 38 "数据：RAW类型 修改列属性" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
alter table dds_raw modify (c_int number) 
/
insert into dds_raw values ( 7, 70,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 8, 80,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 9, 90,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
update dds_raw set c_raw6=rawtohex('INFOFO') where no=7
/
commit
/
delete from dds_raw where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/

case 39 "数据：RAW类型 删除列" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
alter table dds_raw drop column c_int 
/
insert into dds_raw values ( 7, 'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 8, 'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 9, 'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
update dds_raw set c_raw6=rawtohex('INFOFO') where no=7
/
commit
/
delete from dds_raw where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/


case 40 "数据：RAW类型 truncate表" 0
src_sql:
drop table dds_raw
/
create table dds_raw (
    no                  int primary key,
    c_int               int,
    c_raw6              raw(6),
    c_lraw              long raw
)
/
insert into dds_raw values ( 1, 10,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 2, 20,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 3, 30,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
truncate table dds_raw 
/
insert into dds_raw values ( 7, 40,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 8, 50,'ABCDEF','00112233445566778899aabbccddeeff' )
/
insert into dds_raw values ( 9, 60,'ABCDEF','00112233445566778899aabbccddeeff' )
/
commit
/
update dds_raw set c_raw6=rawtohex('INFOFO') where no=7
/
commit
/
delete from dds_raw where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_RAW' order by table_name 
/
select * from dds_raw
/


case 41 "数据：rowid类型 建表(ROWID, UROWID)" 0
src_sql:
drop table dds_rowid
/
create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/

case 42 "数据：rowid类型 插入数据" 0
src_sql:
drop table dds_rowid
/
 create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
insert into dds_rowid values ( 1,'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 2,'AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 3,'AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/
select * from dds_rowid
/

case 43 "数据：rowid类型 修改数据：" 0
src_sql:
drop table dds_rowid
/
 create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
insert into dds_rowid values ( 1,'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 2,'AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 3,'AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
/
commit
/
update dds_rowid set c_rid='QQQQ+QQQQQQQQQvQQQ' where no=2
/
commit
/
delete from dds_rowid where  no=3
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/
select * from dds_rowid
/

case 44 "数据：rowid类型 增加列" 0
src_sql:
drop table dds_rowid
/
 create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
insert into dds_rowid values ( 1,'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 2,'AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 3,'AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
/
commit
/
alter table dds_rowid add v1 rowid 
/
insert into dds_rowid values ( 7,'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvAAA' )
/
insert into dds_rowid values ( 8,'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvBBB' )
/
insert into dds_rowid values ( 9,'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvCCC' )
/
commit
/
update dds_rowid set c_rid='QQQQ+QQQQQQQQQvQQQ' where no=7
/
commit
/
delete from dds_rowid where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/
select * from dds_rowid
/

case 45 "数据：rowid类型 重命名列" 0
src_sql:
drop table dds_rowid
/
 create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
insert into dds_rowid values ( 1,'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 2,'AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 3,'AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
/
commit
/
alter table dds_rowid rename column c_rid to v1 
/
insert into dds_rowid values ( 7,'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 8,'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 9,'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
/
commit
/
update dds_rowid set v1='QQQQ+QQQQQQQQQvQQQ' where no=7
/
commit
/
delete from dds_rowid where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/
select * from dds_rowid
/

case 46 "数据：rowid类型 修改列属性" 0
src_sql:
drop table dds_rowid
/
 create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
alter table dds_rowid modify (c_rid char(20))
/
insert into dds_rowid values ( 7,'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 8,'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 9,'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
/
commit
/
update dds_rowid set c_rid='QQQQ+QQQQQQQQQvQQQ' where no=7
/
commit
/
delete from dds_rowid where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/
select * from dds_rowid
/

case 47 "数据：rowid类型 删除列" 0
src_sql:
drop table dds_rowid
/
 create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
insert into dds_rowid values ( 1,'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 2,'AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 3,'AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
/
commit
/
alter table dds_rowid drop column c_rid
/
insert into dds_rowid values ( 7,'*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 8,'*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 9,'*BAEANzQCwQICwQL+' )
/
commit
/
update dds_rowid set c_urid='QQQQ+QQQQQQQQQvQQQ' where no=7
/
commit
/
delete from dds_rowid where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/
select * from dds_rowid
/


case 48 "数据：rowid类型 truncate表" 0
src_sql:
drop table dds_rowid
/
 create table dds_rowid (
    no                  int primary key,
    c_rid               rowid,
    c_urid              urowid
)
/
insert into dds_rowid values ( 1,'AAAQ+UAAEAAADAvAAA', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 2,'AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 3,'AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
/
commit
/
truncate table dds_rowid
/
insert into dds_rowid values ( 7,'AAAQ+UAAEAAADAvDDD', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 8,'AAAQ+UAAEAAADAvEEE', '*BAEANzQCwQICwQL+' )
/
insert into dds_rowid values ( 9,'AAAQ+UAAEAAADAvFFF', '*BAEANzQCwQICwQL+' )
/
commit
/
update dds_rowid set c_urid='QQQQ+QQQQQQQQQvQQQ' where no=7
/
commit
/
delete from dds_rowid where  no=8
/
commit
/
tgt_sql:
select table_name||','||column_name||','||data_type||','||data_length from user_tab_columns where table_name = 'DDS_ROWID' order by table_name 
/
select * from dds_rowid
/
