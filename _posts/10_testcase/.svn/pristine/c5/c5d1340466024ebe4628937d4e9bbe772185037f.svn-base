 case 1 "压缩表: 建表" 0
drop table com6 purge 
/
drop table com purge 
/
create table com (no int,name varchar2(100))
/
insert into com values (1,'info2softcompanyi2activeproduct')
/
insert into com values (2,'info2softcompanyi2activeproduct')
/
insert into com values (3,'info2softcompanyi2activeproduct')
/
insert into com values (4,'info2softcompanyi2activeproduct')
/
insert into com values (5,'info2softcompanyi2activeproduct')
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
commit
/
create table com6 compress as select * from com where 1=2
/
tgt_sql:
SELECT table_name, compression, compress_for FROM user_tables where table_name in('COM','COM6') order by table_name 
/
select count(*) from com
/
select count(*) from com6
/


 case 2 "压缩表: 插入数据" 0
drop table com6 purge 
/
drop table com purge 
/
create table com (no int,name varchar2(100))
/
insert into com values (1,'info2softcompanyi2activeproduct')
/
insert into com values (2,'info2softcompanyi2activeproduct')
/
insert into com values (3,'info2softcompanyi2activeproduct')
/
insert into com values (4,'info2softcompanyi2activeproduct')
/
insert into com values (5,'info2softcompanyi2activeproduct')
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
insert into com select * from com
/
commit
/
create table com6 compress as select * from com where 1=2
/
insert /*+ append */ into com6 select * from com
/
commit
/
tgt_sql:
SELECT table_name, compression, compress_for FROM user_tables where table_name in('COM','COM6') order by table_name 
/
SELECT count(*) from com
/
SELECT count(*) from com6
/
select segment_name,bytes/1024 from dba_segments where segment_name = 'COM6' and owner = USER
/

 case 3 "压缩表: 客户现场的表" 0
 
 drop table "TJ_BB_BLOCK"
 /
 drop table c1 purge 
 /
 drop table c2 purge 
 /
create table "TJ_BB_BLOCK" (EXPRESS clob,BLOCKSTRUCT clob,CHEXPRESS clob,QEXPRESS clob);
begin 
    for i in 1..10000
    loop
insert into TJ_BB_BLOCK values(
rpad('aaaa',4000,'aaaa'),rpad('bbbb',4000,'bbbb'),rpad('cccc',4000,'cccc'),rpad('dddd',4000,'dddd'));
    end loop;   
commit;
end;
/
create table c1
tablespace "USERS" nologging 
lob (EXPRESS,BLOCKSTRUCT,CHEXPRESS,QEXPRESS) 
store as (tablespace "USERS" enable storage in row nocache nologging) 
as select /*+ DYNAMIC_SAMPLING(0) FULL("TJ_BB_BLOCK") */ *  
from "TJ_BB_BLOCK"  sample block( 91.91) mytab
/
create table c2 organization heap  
tablespace "USERS" lob (EXPRESS,BLOCKSTRUCT,CHEXPRESS,QEXPRESS) 
store as (tablespace "USERS" enable storage in row nocache nologging) 
compress for all operations nologging 
as select /*+ DYNAMIC_SAMPLING(0) */ * from c1 mytab
/
tgt_sql:
SELECT table_name, compression, compress_for FROM user_tables where table_name in('TJ_BB_BLOCK','C1','C2') order by table_name 
/
SELECT count(*) from c2
/
select segment_name,bytes/1024 from dba_segments where segment_name = 'C1' and owner = USER
/
