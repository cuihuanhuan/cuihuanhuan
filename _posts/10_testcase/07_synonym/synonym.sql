
 case 1 "同义词：create synonym " 0
        src_sql:
             drop table dds_table_test1 purge
             /
             create table dds_table_test1(
                    a1 number(9,3) not null,
                    a2 varchar2(20),
                    a3 date,a4 int,a5 varchar2(30))
             /
             create synonym dtt1 for dds_table_test1
             /

        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('DDS_TABLE_TEST1','DTT1') order by object_name,object_type
            /
            select count(*) from dtt1
            /

 case 2 "同义词：insert " 0
        src_sql:
             drop synonym dtt1
			 /
			 drop table dds_table_test1 purge
             /
             create table dds_table_test1(
                    a1 number(9,3) not null,
                    a2 varchar2(20),
                    a3 date,a4 int,a5 varchar2(30))
             /
             insert into dds_table_test1 values ('1','sad','','4','as')
             /
             commit
             /
             create synonym dtt1 for dds_table_test1
             /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('DDS_TABLE_TEST1','DTT1') order by object_name,object_type
            /
            select * from dtt1
            /
			
 case 3 "同义词：update " 0
        src_sql:
             drop synonym dtt1
			 /
			 drop table dds_table_test1 purge
             /
             create table dds_table_test1(
                    a1 number(9,3) not null,
                    a2 varchar2(20),
                    a3 date,a4 int,a5 varchar2(30))
             /
             insert into dds_table_test1 values ('1','sad','','4','as')
             /
             commit
             /
             create synonym dtt1 for dds_table_test1
             /
             update dtt1 set a2='happy' where a1='1'
             /
             commit
             /

        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('DDS_TABLE_TEST1','DTT1') order by object_name,object_type
            /
            select * from dtt1
            /

 case 4 "同义词：drop synonym " 0
        src_sql:
             drop synonym dtt1
             /
             drop table dds_table_test1 purge
             /
             create table dds_table_test1(
                    a1 number(9,3) not null,
                    a2 varchar2(20),
                    a3 date,a4 int,a5 varchar2(30))
             /
             create synonym dtt1 for dds_table_test1
             /
            drop synonym dtt1
            /
            drop table dds_table_test1 purge
            /
            
        tgt_sql:
            select count(*) from user_objects where object_name in('DDS_TABLE_TEST1','DTT1') order by object_name,object_type
            /