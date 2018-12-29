    case 30 "往表中添加一列" 0
        src_sql:
        drop table dds_table_test
        /
        create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
        /
        alter table dds_table_test add(a6 number(8))
        /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/



    case 31 "往表中添加一列: NOT NULL, 带有 DEFAULT 值" 0
        src_sql:
        drop table dds_table_test
        /
        create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
        /
        insert into dds_table_test ( a1 ) values ( 10 )
        /
        insert into dds_table_test ( a1 ) values ( 20 )
        /
		commit
		/
        alter table dds_table_test add(x6 number(8) default 200 not null )
        /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
select * from dds_table_test order by a1
/



    case 32 "往表中添加多列" 0
        src_sql:
        drop table dds_table_test
        /
        create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
        /
        alter table dds_table_test add(a7 varchar2(20),a8 varchar2(18),a9 varchar2(30))
        /

tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/

        
    case 33 "删除一列" 0
        src_sql:
        drop table dds_table_test
        /
        create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
        /
        alter table dds_table_test drop column a5
        /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/



    case 34 "删除多列" 0
        src_sql:
        drop table dds_table_test
        /
        create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
        /
        alter table  dds_table_test drop (a4,a5)
        /
       tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/
 
    case 35 "修改一列数据类型" 0
        src_sql:
        drop table dds_table_test
        /
        create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
        /
        alter table dds_table_test  modify (a3 varchar2(10))
        /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/


    case 36 "修改多列数据类型" 0
        src_sql:
        drop table dds_table_test
        /
        create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
        /
        alter table dds_table_test  modify (a2 number,a3 number,a4 number)
		/
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/



 case 37 "字段更名：普通字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f1 to fa
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/




 case 38 "字段更名：带有缺省值的字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f2 to fb
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/




 case 39 "字段更名：带有CONSTRAINT（NOT NULL）的字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f3 to fc
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/




 case 40 "字段更名：带有CONSTRAINT（check clause）的字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f4 to fd
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/




 case 41 "字段更名：主键第一个字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f5 to fe
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/




 case 42 "字段更名：主键第二个字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f6 to ff
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/




 case 43 "字段更名：唯一键第一个字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f7 to fg
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/



 case 44 "字段更名：唯一键第二个字段更名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (
                f1 int,
                f2 NUMBER(8) DEFAULT to_number(to_char(sysdate,'yyyymmdd')),
                f3 varchar2(20) not null,
                f4 int check ( f4>1 and f4<1000 ),
                f5 int not null,
                f6 int,
                f7 int,
                f8 date default sysdate,
                constraint dds_pk1 primary key ( f5, f6 ),
                constraint dds_uk1 unique ( f7, f8 )
            )
            /
            alter table dds_table_test rename column f8 to fh
            /
tgt_sql:
select table_name,column_name,data_type from user_tab_columns where table_name='DDS_TABLE_TEST' order by column_name
/



