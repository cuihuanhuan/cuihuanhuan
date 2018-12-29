 case 100 "建立依赖于表的FUNCTION后重建表,之后不编译function" 0
        src_sql:
            drop table fun_test_table purge
            /
            drop function fun_test
            /
            create table fun_test_table ( f1 int, f2 varchar2(20) )
            /
            insert into fun_test_table values ( 101, 'DDS_TEST_SYSTEM' )
            /
            insert into fun_test_table values ( 102, 'ORACLE_TEST_SYSTEM' )
            /
			commit
			/
            create function fun_test (p_id in number) return varchar2
            is
                lc_name varchar2(100);
            begin
                select f2 into lc_name from fun_test_table where f1=p_id;
                return( lc_name );
            end;
            /
			
			drop table fun_test_table purge
            /
            create table fun_test_table ( f1 int, f2 varchar2(20), f3 varchar2(20) )
            /
            insert into fun_test_table values ( 101, 'func_tab_1','DDS_TEST_SYSTEM_1')
            /
            insert into fun_test_table values ( 102, 'func_tab_2','ORACLE_TEST_SYSTEM_2')
            /
            insert into fun_test_table values ( 103, 'func_tab_3','ORACLE_TEST_SYSTEM_3')
            /
			commit
			/

        tgt_sql:
            select object_name,object_type,status from user_objects where object_type='FUNCTION' and object_name='FUN_TEST'
            /


 case 101 "建立依赖于表的FUNCTION后重建表,之后重新编译function" 0
        src_sql:
            drop table fun_test_table purge
            /
            drop function fun_test
            /
            create table fun_test_table ( f1 int, f2 varchar2(20) )
            /
            insert into fun_test_table values ( 101, 'DDS_TEST_SYSTEM' )
            /
            insert into fun_test_table values ( 102, 'ORACLE_TEST_SYSTEM' )
            /
			commit
			/
            create function fun_test (p_id in number) return varchar2
            is
                lc_name varchar2(100);
            begin
                select f2 into lc_name from fun_test_table where f1=p_id;
                return( lc_name );
            end;
            /
			
			drop table fun_test_table purge
            /
            create table fun_test_table ( f1 int, f2 varchar2(20), f3 varchar2(20) )
            /
            insert into fun_test_table values ( 101, 'func_tab_1','DDS_TEST_SYSTEM_1')
            /
            insert into fun_test_table values ( 102, 'func_tab_2','ORACLE_TEST_SYSTEM_2')
            /
            insert into fun_test_table values ( 103, 'func_tab_3','ORACLE_TEST_SYSTEM_3')
            /
			commit
			/
			alter function fun_test compile
			/

        tgt_sql:
            select object_name,object_type,status from user_objects where object_type='FUNCTION' and object_name='FUN_TEST'
            /
            select fun_test(102) from dual
            /			

			
			
 case 102 "建立依赖于表的PROCEDURE后重建表,之后不编译PROCEURE" 0
        src_sql:
			drop procedure dds_proc_test
			/
			drop table proc_tab purge
            /
            create table proc_tab (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
            /
            create or replace procedure dds_proc_test
            is
            begin
                 insert into proc_tab values(100,'an',sysdate,11,'ann');
                 commit;
            end dds_proc_test;
            /
			exec dds_proc_test
			/
			
			drop table proc_tab purge
            /
            create table proc_tab (b1 number(9,3) not null,b2 varchar2(20),b3 date,b4 int,b5 varchar2(30))
            /
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /
			select count(*) from proc_tab
			/


 case 103 "建立依赖于表的PROCEDURE后重建表,之后重新编译PROCEURE" 0
        src_sql:
			drop procedure dds_proc_test
			/
			drop table proc_tab purge
            /
            create table proc_tab (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
            /
            create or replace procedure dds_proc_test
            is
            begin
                 insert into proc_tab values(100,'an',sysdate,11,'ann');
                 commit;
            end dds_proc_test;
            /
			exec dds_proc_test
			/
			
			drop table proc_tab purge
            /
            create table proc_tab (b1 number(9,3) not null,b2 varchar2(20),b3 date,b4 int,b5 varchar2(30))
            /
			alter procedure dds_proc_test compile
			/
			exec dds_proc_test
			/
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /
			select * from proc_tab
			/

			
			
 case 104 "建立依赖于表的PACKAGE后重建表,之后不编译PACKAGE" 0
        src_sql:
			drop package dds_pack_test
			/
			drop table pack_tab purge
            /
            create table pack_tab (
                   a1 number(9,3) not null,
                   a2 varchar2(20),
                   a3 date,
                   a4 int,
                   a5 varchar2(30) )
            /
            create package dds_pack_test as procedure pk_proc;
            end dds_pack_test;
            /
            create package body dds_pack_test
            as
              procedure pk_proc
              as
              begin
                    insert into pack_tab values(100,'an',sysdate,11,'ann');
					commit;
              end pk_proc;
            end dds_pack_test;
            /
            begin dds_pack_test.pk_proc; 
            end;
            /
			
			drop table pack_tab purge
            /
			create table pack_tab (
                   b1 number(9,3) not null,
                   b2 varchar2(20),
                   b3 date,
                   b4 int,
                   b5 varchar2(30) )
            /
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('PACK_TAB','DDS_PACK_TEST') order by object_name,object_type
            /
            select * from pack_tab
            /
			
			
 case 105 "建立依赖于表的PACKAGE后重建表,之后重新编译PACKAGE" 0
        src_sql:
			drop package dds_pack_test
			/
			drop table pack_tab purge
            /
            create table pack_tab (
                   a1 number(9,3) not null,
                   a2 varchar2(20),
                   a3 date,
                   a4 int,
                   a5 varchar2(30) )
            /
            create package dds_pack_test as procedure pk_proc;
            end dds_pack_test;
            /
            create package body dds_pack_test
            as
              procedure pk_proc
              as
              begin
                    insert into pack_tab values(100,'an',sysdate,11,'ann');
					commit;
              end pk_proc;
            end dds_pack_test;
            /
            begin dds_pack_test.pk_proc; 
            end;
            /
			
			drop table pack_tab purge
            /
			create table pack_tab (
                   b1 number(9,3) not null,
                   b2 varchar2(20),
                   b3 date,
                   b4 int,
                   b5 varchar2(30) )
            /
            alter package dds_pack_test compile
            /
            begin dds_pack_test.pk_proc; 
            end;
            /
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('PACK_TAB','DDS_PACK_TEST') order by object_name,object_type
            /
            select * from pack_tab
            /
			
			
 case 106 "建立依赖于表的TRIGGER后重建表，之后不编译TRIGGER" 0
      src_sql:
            drop trigger test_log_trig1
            /
			drop table test_log purge
            /
            drop table test_log1 purge
            /
            create table test_log ( a1 varchar2(20), a2 varchar2(20) )
            /
            create table test_log1 ( a1 varchar2(20), a2 varchar2(20) )
            /
            create or replace trigger test_log_trig1 before insert on test_log
            for each row
            begin
                insert into test_log1 values ( :new.a1, :new.a2 );
                null;
            end log_trig1;
            /
			insert into test_log values('haha','xixi')
			/
			commit
			/
			
			drop table test_log1 purge
            /
            create table test_log1 ( b1 varchar2(20), b2 varchar2(20) )
            /

      tgt_sql:
			select TNAME,CNAME,COLTYPE from col where tname='TEST_LOG1' order by cname
			/
			select object_name,object_type,status from user_objects where object_name in('TEST_LOG_TRIG1') order by object_name,object_type
			/
			select * from test_log
			/
			select * from test_log1
			/
		  
		  
 case 107 "建立依赖于表的TRIGGER后重建表，之后重新编译TRIGGER" 0
      src_sql:
            drop trigger test_log_trig1
            /
			drop table test_log purge
            /
            drop table test_log1 purge
            /
            create table test_log ( a1 varchar2(20), a2 varchar2(20) )
            /
            create table test_log1 ( a1 varchar2(20), a2 varchar2(20) )
            /
            create or replace trigger test_log_trig1 before insert on test_log
            for each row
            begin
                insert into test_log1 values ( :new.a1, :new.a2 );
                null;
            end log_trig1;
            /
			
			drop table test_log1 purge
            /
            create table test_log1 ( b1 varchar2(20), b2 varchar2(20) )
            /
			alter trigger test_log_trig1 compile
			/
			insert into test_log values('haha','xixi')
			/
			commit
			/
      tgt_sql:
			select TNAME,CNAME,COLTYPE from col where tname='TEST_LOG1' order by cname
			/
			select object_name,object_type,status from user_objects where object_name in('TEST_LOG_TRIG1') order by object_name,object_type
			/
			select * from test_log
			/
			select * from test_log1
			/
			
 case 108 "建立依赖于表的VIEW后重建表，之后不更新VIEW" 0
      src_sql:
            drop view dds_view_test
            /
            drop table view_tab purge
            /
            create table view_tab (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            )
            /
            insert into view_tab values (1,'qwer',sysdate,123,'asdf')
            /
			commit
			/
            create view dds_view_test as SELECT * from view_tab
            /
			
			alter table view_tab drop column a5
            /
            insert into view_tab values (111,'ddd',sysdate,222)
            /
			commit
			/
      tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('VIEW_TAB') order by object_name,object_type
			/
			select * from view_tab order by a1
			/			
			

 case 109 "建立依赖于表的VIEW后重建表，之后更新VIEW" 0
      src_sql:
            drop view dds_view_test
            /
            drop table view_tab purge
            /
            create table view_tab (
            a1 number(9,3) not null,
            a2 varchar2(20),
            a3 date,
            a4 int,
            a5 varchar2(30)
            )
            /
            insert into view_tab values (1,'qwer',sysdate,123,'asdf')
            /
			commit
			/
            create view dds_view_test as SELECT * from view_tab
            /
			
			alter table view_tab drop column a5
            /
            insert into view_tab values (111,'ddd',sysdate,222)
            /
			commit
			/
			create or replace view dds_view_test as SELECT * from view_tab
            /
      tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('VIEW_TAB','DDS_VIEW_TEST') order by object_name,object_type
			/
			select * from dds_view_test order by a1
			/


 case 110 "建立依赖于表的SYNONYMS后重建表" 0
      src_sql:
            src_sql:
            drop synonym dtt1
			/
			drop table syn_tab purge
            /
            create table syn_tab(a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int)
            /
            insert into syn_tab values (1,'sad',sysdate,4)
            /
            commit
            /
            create synonym dtt1 for syn_tab
            /
            insert into dtt1 values (2,'xi',sysdate,5)
            /
            commit
            /
			 
			drop table syn_tab purge
            /
            create table syn_tab(a1 number(9,3) not null,b2 varchar2(20),b3 date,b4 int)
            /
            insert into dtt1 values(333,'happy',sysdate,666)
            /
            commit
            /
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('SYN_TAB','DTT1') order by object_name,object_type
            /
            select * from dtt1 order by a1
            /
			

 case 111 "建立有外键的表，后重建外键所依赖的表" 0
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
			insert into dds_tab values(1,11,111,1111)
			/
			insert into dds_tab values(2,22,222,2222)
			/
			insert into dds_tab values(3,33,333,3333)
			/
			commit
			/
			create table dds_tab2 ( fx int,fb int,
                       constraint t2_fk foreign key (fx) references dds_tab )
			/
			insert into dds_tab2 values(1,123)
			/
			insert into dds_tab2 values(2,1234)
			/
			commit
			/
			create table dds_tab3 ( fa int, fb int,
                       constraint t3_fk foreign key (fb) references dds_tab (f2) )
			/
			insert into dds_tab3 values(991,11)
			/
			insert into dds_tab3 values(992,22)
			/
			commit
			/
			create table dds_tab4 ( fa int, fb int,
                       constraint t4_fk foreign key (fa,fb) references dds_tab (f3,f4) )
			/
            insert into dds_tab4 values(111,1111)
			/
			insert into dds_tab4 values(222,2222)
			/
			commit
			/			
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('DDS_TAB','DDS_TAB2','DDS_TAB3','DDS_TAB4') order by object_name,object_type
            /
            select table_name,constraint_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('DDS_TAB','DDS_TAB2','DDS_TAB3','DDS_TAB4') order by table_name,constraint_name
			/
			select * from dds_tab order by f1
			/
			select * from dds_tab2 order by fx
			/
			select * from dds_tab3 order by fa
			/
			select * from dds_tab4 order by fa
			/