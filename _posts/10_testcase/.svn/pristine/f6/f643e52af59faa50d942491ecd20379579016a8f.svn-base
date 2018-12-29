
 case 1 "存储过程：create procedure" 0
        src_sql:
            drop table proc_tab purge
            /
			drop procedure dds_proc_test
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
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /
			select * from proc_tab
			/
            
 case 2 "存储过程：replace procedure" 0
        src_sql:
            drop table proc_tab purge
            /
			drop procedure dds_proc_test
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
            create or replace procedure dds_proc_test
            is
            begin
                 delete proc_tab;
				 commit;
            end;
            /
			exec dds_proc_test
			/
        tgt_sql:
			select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /
            select count(*) from  proc_tab
            /

 case 3 "存储过程：alter procedure compile" 0
        src_sql:
            drop table proc_tab purge
            /
			drop procedure dds_proc_test
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
            create or replace procedure dds_proc_test
            is
            begin
                 delete proc_tab;
				 commit;
            end;
            /
            alter procedure dds_proc_test compile
            /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /
            
 case 4 "存储过程：drop procedure " 0
        src_sql:
            drop table proc_tab purge
            /
			drop procedure dds_proc_test
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
            drop procedure dds_proc_test
            /
            drop table proc_tab purge
            /

        tgt_sql:
            select count(*) from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /

 case 5 "存储过程：create wrapped procedure" 0
        src_sql:
            drop PROCEDURE wrap_it
            /

CREATE or REPLACE PROCEDURE wrap_it wrapped
a000000
352
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
103 fb
AjIGhjn4RB4+XHhDGNaPNFThCNkwgy7w154VfC9GAPiOEvae0y+KY5WE4DzCUOTIT56Hm2ZC
MAujbZnZZdpqeP8FW+Vd84eHU1nzVGfDWHR1GmyS+XQyFqAdS8mWX+Fl8xfSXvjybvqKvPF7
oOM9bnTp05ntCKkz60ESoyjDf7hDz6mVo8T9nUAIy4PFG5FwtUfN0pwFuA5h3BNRDPex15mI
kcPyeObql9TaJVQxmkXoCnXcLMMZAMA=
/

        tgt_sql:
            select object_name,object_type,status from user_objects where object_name='WRAP_IT' and object_type='PROCEDURE'
            /

 case 6 "存储过程：drop wrapped procedure" 0
        src_sql:
            drop PROCEDURE wrap_it
            /
CREATE or REPLACE PROCEDURE wrap_it wrapped
a000000
352
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
103 fb
AjIGhjn4RB4+XHhDGNaPNFThCNkwgy7w154VfC9GAPiOEvae0y+KY5WE4DzCUOTIT56Hm2ZC
MAujbZnZZdpqeP8FW+Vd84eHU1nzVGfDWHR1GmyS+XQyFqAdS8mWX+Fl8xfSXvjybvqKvPF7
oOM9bnTp05ntCKkz60ESoyjDf7hDz6mVo8T9nUAIy4PFG5FwtUfN0pwFuA5h3BNRDPex15mI
kcPyeObql9TaJVQxmkXoCnXcLMMZAMA=
/
            drop PROCEDURE wrap_it
            /

        tgt_sql:
            select count(*) from user_objects where object_name='WRAP_IT' and object_type='PROCEDURE'
            /
            
 case 7 "游标 if for" 0
        src_sql:
            drop table proc_tab purge
            /
			drop PROCEDURE dds_proc_test
            /
            create table proc_tab as select * from scott.emp
            / 
            create or replace procedure dds_proc_test 
            is
                cursor csr_Update is select * from proc_tab for update OF SAL;
                empInfo csr_Update%rowtype;
                saleInfo  proc_tab.SAL%TYPE;
            begin
                FOR empInfo IN csr_Update LOOP
                    IF empInfo.SAL<1500 THEN
                        saleInfo:=empInfo.SAL*1.2;
                    elsif empInfo.SAL<2000 THEN
                        saleInfo:=empInfo.SAL*1.5;
                    elsif empInfo.SAL<3000 THEN
                        saleInfo:=empInfo.SAL*2;
                    END IF;
                    UPDATE proc_tab SET SAL=saleInfo WHERE CURRENT OF csr_Update;
                END LOOP;
            END;
            /
            
        tgt_sql:
            --检查 procedure 是否被建立
            select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /

 case 8 "for循环" 0
        src_sql:
			drop table proc_tab purge
            /
			drop PROCEDURE dds_proc_test
            /
            create or replace procedure dds_proc_test
            is
            sum1 number :=0; 
            temp varchar2(500); 
            begin
                for i in 1..9 loop 
                    temp := ''; 
                for j in 1 .. i loop 
                    sum1 := i * j; 
                    temp := temp||to_char(i) || ' * ' ||to_char(j) ||' = ' ||to_char(sum1) ||' '; 
                end loop; 
                dbms_output.put_line(temp ); 
                end loop; 
            end; 
            /

        tgt_sql:
            --检查 procedure 是否被建立
            select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /
            
 case 9 "loop循环" 0
        src_sql:
            drop PROCEDURE dds_proc_test
            /
			create or replace procedure dds_proc_test
            is
            sum1 number :=0; 
            temp number :=0; 
            begin
                loop
                    exit when temp >= 10 ;
                    sum1 := sum1+temp;
                    temp := temp +1; 
                end loop; 
                dbms_output.put_line(sum1); 
            end; 
            /

        tgt_sql:
            --检查 procedure 是否被建立
            select object_name,object_type,status from user_objects where object_name='DDS_PROC_TEST' and object_type='PROCEDURE'
            /