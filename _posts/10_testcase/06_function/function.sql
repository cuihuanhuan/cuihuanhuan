 case 1 "FUNCTION: 不带参数：建立" 0
         src_sql:
			drop function fun_test
			/
            create or replace function fun_test
            return varchar2
            as
            begin
                 return 'hello world';
            end;
            /

        tgt_sql:
			select object_name,object_type,status from user_objects where object_name='FUN_TEST' and object_type='FUNCTION'
            /
            select fun_test() from dual
            /

 case 2 "FUNCTION: 不带参数：替换 REPLACE" 0
        src_sql:
			drop function fun_test
			/
            create or replace function fun_test
            return varchar2
            as
            begin
                 return 'hello world';
            end;
            /
            create or replace function fun_test
            return varchar2
            as
            begin
                 return 'hello world1';
            end;
            /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_name='FUN_TEST' and object_type='FUNCTION'
            /
            select fun_test() from dual
            /
            
 case 3 "FUNCTION: 不带参数：编译" 0
        src_sql:
			drop function fun_test
			/
            create or replace function fun_test
            return varchar2
            as
            begin
                 return 'hello world1';
            end;
            /
            alter function  fun_test compile
            /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_name='FUN_TEST' and object_type='FUNCTION'
            /
            select fun_test() from dual
            /
            
 case 4 "FUNCTION: 不带参数：删除" 0
        src_sql:
			drop function fun_test
			/
            create or replace function fun_test
            return varchar2
            as
            begin
                 return 'hello world1';
            end;
            /
            drop function fun_test
            /

        tgt_sql:
            select count(*) from user_objects where object_type='FUNCTION' and object_name='FUN_TEST'
            /
            
 case 5 "FUNCTION：带参数：建立" 0
        src_sql:
            drop table "fun_test_table" purge
            /
            drop function "fun_test"
            /
            create table "fun_test_table" ( f1 int, f2 varchar2(20) )
            /
            insert into "fun_test_table" values ( 101, 'DDS_TEST_SYSTEM' )
            /
            insert into "fun_test_table" values ( 102, 'ORACLE_TEST_SYSTEM' )
            /
			commit
			/
            create function "fun_test" (p_id in number, p_name in varchar2 ) return varchar2
            is
                lc_name varchar2(100);
            begin
                select f2 into lc_name from "fun_test_table" where f1=p_id;
                --p_name:=lc_name;
                return( lc_name );
            end;
            /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_type='FUNCTION' and object_name='fun_test'
            /
            select "fun_test"(102,'ABC') from dual
            /
            
 case 6 "FUNCTION：带参数：删除" 0
        src_sql:
            drop table "fun_test_table" purge
            /
            drop function "fun_test"
            /
            create table "fun_test_table" ( f1 int, f2 varchar2(20) )
            /
            insert into "fun_test_table" values ( 101, 'DDS_TEST_SYSTEM' )
            /
            insert into "fun_test_table" values ( 102, 'ORACLE_TEST_SYSTEM' )
            /
			commit
			/
            create function "fun_test" (p_id in number, p_name in varchar2 ) return varchar2
            is
                lc_name varchar2(100);
            begin
                select f2 into lc_name from "fun_test_table" where f1=p_id;
                --p_name:=lc_name;
                return( lc_name );
            end;
            /
            drop function "fun_test"
            /
			drop table "fun_test_table" purge
            /
        tgt_sql:
            select count(*) from user_objects where object_type='FUNCTION' and object_name='fun_test'
            /
            
 case 7 "FUNCTION：带 definer/caller previleges：建立" 0
        src_sql:
            drop table "fun_test_table" purge
            /
            drop function "fun_test"
            /
            create table "fun_test_table" ( f1 int, f2 varchar2(20) )
            /
            insert into "fun_test_table" values ( 101, 'DDS_TEST_SYSTEM' )
            /
            insert into "fun_test_table" values ( 102, 'ORACLE_TEST_SYSTEM' )
            /
			commit
			/
            create function "fun_test" (p_id in number, p_name in varchar2 ) return varchar2 authid current_user
            is
                lc_name varchar2(100);
            begin
                select f2 into lc_name from "fun_test_table" where f1=p_id;
                --p_name:=lc_name;
                return( lc_name );
            end;
            /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_type='FUNCTION' and object_name='fun_test'
            /
			select "fun_test"(102,'ABC') from dual
            /
            
 case 8 "FUNCTION：带 definer/caller previleges：删除" 0
        src_sql:
            drop table "fun_test_table" purge
            /
            drop function "fun_test"
            /
            create table "fun_test_table" ( f1 int, f2 varchar2(20) )
            /
            insert into "fun_test_table" values ( 101, 'DDS_TEST_SYSTEM' )
            /
            insert into "fun_test_table" values ( 102, 'ORACLE_TEST_SYSTEM' )
            /
			commit
			/
			create function "fun_test" (p_id in number, p_name in varchar2 ) return varchar2 authid current_user
            is
                lc_name varchar2(100);
            begin
                select f2 into lc_name from "fun_test_table" where f1=p_id;
                --p_name:=lc_name;
                return( lc_name );
            end;
            /
            drop function "fun_test"
            /
			drop table "fun_test_table" purge
            /

        tgt_sql:
            select count(*) from user_objects where object_type='FUNCTION' and object_name='fun_test'
            /