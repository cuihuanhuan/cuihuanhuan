case 1 "包：创建package " 0
        src_sql:
            drop table pk_test_tab purge
            /
			drop package dds_pack_test
			/
            create table pk_test_tab (
                   a1 number(9,3) not null,
                   a2 varchar2(20),
                   a3 date,
                   a4 int,
                   a5 varchar2(30) )
            /
            create package dds_pack_test
            as
            procedure pk_proc;
            end dds_pack_test;
            /
            create package body dds_pack_test
            as
              procedure pk_proc
              as
              begin
                    insert into pk_test_tab values(100,'an',sysdate,11,'ann');
					commit;
              end pk_proc;
            end dds_pack_test;
            /
            begin dds_pack_test.pk_proc; 
            end;
            /
            
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('PK_TEST_TAB','DDS_PACK_TEST') order by object_name,object_type
            /
            select * from pk_test_tab
            /
			
 case 2 "包：replace package " 0
        src_sql:
			drop table pk_test_tab purge
            /
			drop package dds_pack_test
			/
            create table pk_test_tab (
                   a1 number(9,3) not null,
                   a2 varchar2(20),
                   a3 date,
                   a4 int,
                   a5 varchar2(30) )
            /
            create package dds_pack_test
            as
            procedure pk_proc;
            end dds_pack_test;
            /
            create package body dds_pack_test
            as
              procedure pk_proc
              as
              begin
                    insert into pk_test_tab values(100,'an',sysdate,11,'ann');
					commit;
              end pk_proc;
            end dds_pack_test;
            /
            begin dds_pack_test.pk_proc; 
            end;
            /
            create or replace package dds_pack_test
            as
            procedure pk_pr;
            end dds_pack_test;
            /
            create or replace package body dds_pack_test
            as
              procedure pk_pr
              as
              begin
                    delete from pk_test_tab;
					commit;
              end pk_pr;
            end dds_pack_test;
            /
            begin dds_pack_test.pk_pr; end;
            /
            
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('PK_TEST_TAB','DDS_PACK_TEST') order by object_name,object_type
            /
            select count(*) from pk_test_tab
            /
            
 case 3 "包：compile package " 0
        src_sql:
			drop table pk_test_tab purge
            /
			drop package dds_pack_test
			/
            create table pk_test_tab (
                   a1 number(9,3) not null,
                   a2 varchar2(20),
                   a3 date,
                   a4 int,
                   a5 varchar2(30) )
            /
            create or replace package dds_pack_test
            as
            procedure pk_pr;
            end dds_pack_test;
            /
            create or replace package body dds_pack_test
            as
              procedure pk_pr
              as
              begin
                    delete from pk_test_tab;
					commit;
              end pk_pr;
            end dds_pack_test;
            /
            begin dds_pack_test.pk_pr; end;
            /
            alter package dds_pack_test compile
            /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('PK_TEST_TAB','DDS_PACK_TEST') order by object_name,object_type
            /
            select count(*) from pk_test_tab
            /
            
 case 4 "包：drop package " 0
        src_sql:
			drop table pk_test_tab purge
            /
			drop package dds_pack_test
			/
            create table pk_test_tab (
                   a1 number(9,3) not null,
                   a2 varchar2(20),
                   a3 date,
                   a4 int,
                   a5 varchar2(30) )
            /
            create or replace package dds_pack_test
            as
            procedure pk_pr;
            end dds_pack_test;
            /
            create or replace package body dds_pack_test
            as
              procedure pk_pr
              as
              begin
                    delete from pk_test_tab;
              end pk_pr;
            end dds_pack_test;
            /
            begin dds_pack_test.pk_pr; end;
            /
            drop package dds_pack_test
            /
            drop table pk_test_tab purge
            /  
        tgt_sql:
            select count(*) from user_objects where object_name ='DDS_PACK_TEST'
            /