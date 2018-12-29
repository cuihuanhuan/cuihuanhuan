 case 1 "物化视图：建表" 0
 drop table mv_t_test1
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
COMMIT
/
tgt_sql:
select no,name from mv_v_test1
/


 case 2 "物化视图：快速刷新日志" 0
 drop table mv_t_test1
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test1
WITH PRIMARY KEY
INCLUDING NEW VALUES
/
tgt_sql:
select no,name from mv_v_test1
/
select master,log_table,rowids,primary_key from user_mview_logs
/



case 3 "物化视图：立即建立;快速刷新;ON DEMAND" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test1
WITH PRIMARY KEY
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test2
WITH ROWID
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD IMMEDIATE  
REFRESH FAST WITH PRIMARY KEY  
ON DEMAND  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD IMMEDIATE  
REFRESH FAST WITH ROWID 
ON DEMAND  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/
BEGIN
DBMS_MVIEW.REFRESH (
list => 'MV_V_TEST1,MV_V_TEST2',
Method =>'F',
refresh_after_errors => True);
END;
/
tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/
select master,log_table,rowids,primary_key from user_mview_logs
/




case 4 "物化视图：需求建立;快速刷新;ON DEMAND" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test1
WITH PRIMARY KEY
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test2
WITH ROWID
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD DEFERRED  
REFRESH FAST WITH PRIMARY KEY  
ON DEMAND  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD DEFERRED  
REFRESH FAST WITH ROWID  
ON DEMAND  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/
select master,log_table,rowids,primary_key from user_mview_logs
/



case 5 "物化视图：立即建立;快速刷新;ON COMMIT" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test1
WITH PRIMARY KEY
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test2
WITH ROWID
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD IMMEDIATE  
REFRESH FAST WITH PRIMARY KEY  
ON COMMIT  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD IMMEDIATE  
REFRESH FAST WITH ROWID  
ON COMMIT 
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/
tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/
select master,log_table,rowids,primary_key from user_mview_logs
/




case 6 "物化视图：需求建立;快速刷新;ON COMMIT" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test1
WITH PRIMARY KEY
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW LOG ON  mv_t_test2
WITH ROWID
INCLUDING NEW VALUES
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD DEFERRED  
REFRESH FAST WITH PRIMARY KEY  
ON COMMIT  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD DEFERRED 
REFRESH FAST WITH ROWID  
ON COMMIT 
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/
tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/
select master,log_table,rowids,primary_key from user_mview_logs
/





case 7 "物化视图：立即建立;完全刷新;ON DEMAND" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD IMMEDIATE  
REFRESH COMPLETE WITH PRIMARY KEY  
ON DEMAND  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD IMMEDIATE  
REFRESH COMPLETE WITH ROWID  
ON DEMAND  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/



case 8 "物化视图：需求建立;完全刷新;ON DEMAND" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD DEFERRED 
REFRESH COMPLETE WITH PRIMARY KEY  
ON DEMAND  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD DEFERRED  
REFRESH COMPLETE WITH ROWID  
ON DEMAND  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/




case 9 "物化视图：立即建立;完全刷新;ON COMMIT" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD IMMEDIATE  
REFRESH COMPLETE WITH PRIMARY KEY  
ON COMMIT  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD IMMEDIATE  
REFRESH COMPLETE WITH ROWID  
ON COMMIT  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/





case 10 "物化视图：需求建立;完全刷新;ON COMMIT" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD DEFERRED  
REFRESH COMPLETE WITH PRIMARY KEY  
ON COMMIT  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD DEFERRED 
REFRESH COMPLETE WITH ROWID  
ON COMMIT  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/





case 11 "物化视图：立即建立;强制刷新;ON DEMAND" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD IMMEDIATE  
REFRESH FORCE WITH PRIMARY KEY  
ON DEMAND  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD IMMEDIATE  
REFRESH COMPLETE WITH ROWID  
ON DEMAND  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/


case 12 "物化视图：需求建立;强制刷新;ON DEMAND" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD DEFERRED 
REFRESH FORCE WITH PRIMARY KEY  
ON DEMAND  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD DEFERRED  
REFRESH FORCE WITH ROWID  
ON DEMAND  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/



case 13 "物化视图：立即建立;强制刷新;ON COMMIT" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD IMMEDIATE  
REFRESH FORCE WITH PRIMARY KEY  
ON COMMIT  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD IMMEDIATE  
REFRESH FORCE WITH ROWID  
ON COMMIT  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/




case 14 "物化视图：需求建立;强制刷新;ON COMMIT" 0
drop table mv_t_test1
/
drop table mv_t_test2
/
drop materialized view mv_v_test1
/
drop materialized view mv_v_test2
/
create table mv_t_test1 (no int primary key,name varchar2(10))
/
insert into mv_t_test1 values ('1','info2soft')
/
commit
/
create table mv_t_test2 (no int,name varchar2(10))
/
insert into mv_t_test2 values ('1','software.')
/
commit
/
CREATE MATERIALIZED VIEW mv_v_test1 
BUILD DEFERRED  
REFRESH FORCE WITH PRIMARY KEY  
ON COMMIT  
ENABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test1
/
CREATE MATERIALIZED VIEW mv_v_test2 
BUILD DEFERRED 
REFRESH FORCE WITH ROWID  
ON COMMIT  
DISABLE QUERY REWRITE  
AS  
SELECT no,name FROM  mv_t_test2
/

tgt_sql:
select no,name from mv_v_test1
/
select no,name from mv_v_test2
/
select owner||','||mview_name||','||rewrite_enabled||','||refresh_mode||','||refresh_method||','||build_mode  from user_mviews
/


