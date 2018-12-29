
 case 1 "视图：简单视图create" 0
        src_sql:
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            )
            /
            insert into dds_t1 values (
            '1','qwer','','123','asdf'
            )
            /
			commit
			/
            create view dds_view_test 
            as 
            SELECT * from dds_t1
            /

        tgt_sql:
            select count(*) from user_views where view_name = 'DDS_VIEW_TEST'
            /
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /
            
 case 2 "视图：创建简单只读视图" 0
        src_sql:
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            )
            /
            insert into dds_t1 values (
            '1','qwer','','123','asdf'
            )
            /
			commit
			/
            create view dds_view_test 
            as 
            SELECT * from dds_t1
            with read only
            /

        tgt_sql:
            select count(*) from user_views where view_name = 'DDS_VIEW_TEST'
            /
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /

 case 3 "视图：创建简单视图用户授权" 0
        src_sql:
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            )
            /
            insert into dds_t1 values (
            '1','qwer','','123','asdf'
            )
            /
            create view dds_view_test 
            as 
            SELECT * from dds_t1
            /
            grant create view to sys
			/
        tgt_sql:
            select count(*) from user_views where view_name = 'DDS_VIEW_TEST'
            /
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /

 case 4 "视图：简单视图replace" 0
        src_sql:
			drop view dds_view_test
            /
            drop table dds_t1 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            )
            /
            insert into dds_t1 values (
            '1','qwer','','123','asdf'
            )
            /
			commit
			/
            create view dds_view_test 
            as 
            SELECT * from dds_t1
            /
            create or replace view dds_view_test 
            as 
            SELECT a1,a2,a3,a4 from dds_t1
            /
            
        tgt_sql:
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /
            select a1,a2,a3,a4 from dds_t1
            /

 case 5 "视图：简单视图insert" 0
        src_sql:
			drop view dds_view_test
            /
            drop table dds_t1 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            )
            /
            insert into dds_t1 values (
            '1','qwer','','123','asdf'
            )
            /
			commit
			/
            create view dds_view_test 
            as 
            SELECT * from dds_t1
            /
            insert into dds_view_test values (
            '12','qwder','','1223','adsdf'
            )
            /
            commit
            /

        tgt_sql:
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /
            SELECT * from dds_t1
            /
            
 case 6 "视图：简单视图drop" 0
        src_sql:
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            ) 
            tablespace users
            /
            insert into dds_t1 values (
            '1','qwer','','123','asdf'
            )
            /
            create view dds_view_test 
            as 
            SELECT * from dds_t1
            /
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /

        tgt_sql:
            select count(*) from user_views where view_name = 'DDS_T1'
            /

 case 7 "视图：复杂视图create" 0
		src_sql:
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /
			drop table dds_t2 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20)
            )
            /
            create table dds_t2 (
            a1 number(9,3) not null,
            b2 varchar2(20)
            )
            /
            insert into dds_t1 values ('1','qwer')
            /
            insert into dds_t1 values ('2','asdf')
            /
            insert into dds_t2 values ('1','asdf')
            /
            insert into dds_t2 values ('2','qwer')
            /
			commit
			/
            create view dds_view_test 
            as 
            SELECT dds_t1.a1,dds_t1.a2
            from dds_t1
            union
            SELECT dds_t2.a1,dds_t2.b2 
            from dds_t2
            /

        tgt_sql:
            select count(*) from user_views where view_name = 'DDS_VIEW_TEST'
            /
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /
            
 case 8 "视图：创建复杂只读视图" 0
        src_sql:
			drop view dds_view_test
            /
            drop table dds_t1 purge
            /
			drop table dds_t2 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20)
            )
			/
            create table dds_t2 (
            a1 number(9,3) not null,
            b2 varchar2(20)
            )
			/
            insert into dds_t1 values (1,'qwer')
            /
            insert into dds_t1 values (2,'asdf')
            /
            insert into dds_t2 values (1,'asdf')
            /
            insert into dds_t2 values (2,'qwer')
            /
			commit
			/
            create view dds_view_test 
            as 
            SELECT dds_t1.a1,dds_t1.a2
            from dds_t1
            union
            SELECT dds_t2.a1,dds_t2.b2 
            from dds_t2
            with read only
            /

        tgt_sql:
			select object_name,object_type,status from user_objects where object_name='DDS_VIEW_TEST' and object_type='VIEW'
            /
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /
            SELECT dds_t1.a1,dds_t1.a2 from dds_t1 union SELECT dds_t2.a1,dds_t2.b2 from dds_t2
            /

 case 9 "视图：创建复杂视图用户授权" 0
		src_sql:
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /
			drop table dds_t2 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20)
            )
            /
            create table dds_t2 (
            a1 number(9,3) not null,
            b2 varchar2(20)
            )
            /
            insert into dds_t1 values ('1','qwer')
            /
            insert into dds_t1 values ('2','asdf')
            /
            insert into dds_t2 values ('1','asdf')
            /
            insert into dds_t2 values ('2','qwer')
            /
            create view dds_view_test 
            as 
            SELECT dds_t1.a1,dds_t1.a2
            from dds_t1
            union
            SELECT dds_t2.a1,dds_t2.b2 
            from dds_t2
            /
            grant create view to sys 
            /
		tgt_sql:
			select object_name,object_type,status from user_objects where object_name='DDS_VIEW_TEST' and object_type='VIEW'
            /
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /
            SELECT dds_t1.a1,dds_t1.a2 from dds_t1 union SELECT dds_t2.a1,dds_t2.b2 from dds_t2
            /

 case 10 "视图：复杂视图replace" 0
		src_sql:
            drop view dds_view_test
            /
            drop table dds_t1 purge
            /
			drop table dds_t2 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20)
            )
            /
            create table dds_t2 (
            b1 number(9,3) not null,
            b2 varchar2(20)
            )
            /
            insert into dds_t1 values ('1','qwer')
            /
            insert into dds_t1 values ('2','asdf')
            /
            insert into dds_t2 values ('1','asdf')
            /
            insert into dds_t2 values ('2','qwer')
            /
            create or replace view dds_view_test 
            as 
            SELECT dds_t1.a1,dds_t1.a2
            from dds_t1
            /

        tgt_sql:
            select  text from user_views where view_name='DDS_VIEW_TEST'
            /
            SELECT dds_t1.a1,dds_t1.a2 from dds_t1
            /
            
 case 11 "视图：复杂视图drop" 0
		src_sql:
           drop view dds_view_test
            /
            drop table dds_t1 purge
            /
			drop table dds_t2 purge
            /
            create table dds_t1 (
            a1 number(9,3) not null,
            a2 varchar2(20)
            )
            /
            create table dds_t2 (
            a1 number(9,3) not null,
            b2 varchar2(20)
            )
            /
            insert into dds_t1 values ('1','qwer')
            /
            insert into dds_t1 values ('2','asdf')
            /
            insert into dds_t2 values ('1','asdf')
            /
            insert into dds_t2 values ('2','qwer')
            /
			commit
			/
            create view dds_view_test 
            as 
            SELECT dds_t1.a1,dds_t1.a2
            from dds_t1
            union
            SELECT dds_t2.a1,dds_t2.b2 
            from dds_t2
            /
            drop view dds_view_test
            /
			drop table dds_t1 purge
            /
			drop table dds_t2 purge
            /
        tgt_sql:
            select count(*) from user_views where view_name = 'DDS_VIEW_TEST'
            /