case 1 "禁用单列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10))
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a4)
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/

case 2 "禁用多列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10) not null)
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a2,a4)
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/

case 3 "禁用主键的列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10),constraint PK_unu primary key(a2) )
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a2,a4)
/ 
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/

case 4 "禁用有约束的列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10) not null)
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a4)
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/


case 5 "删除禁用列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10))
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a4)
/
alter table unu drop unused columns
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/

case 6 "删除禁用列,后添加同名列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10))
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a4)
/
alter table unu drop unused columns
/
alter table unu add a4 int
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/

case 7 "删除禁用列,后改名同名列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10))
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a4)
/
alter table unu drop unused columns
/
alter table unu rename column a3 to a4
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/


case 8 "禁用列DML" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10))
/
insert into unu values (1,2,'qwer','qaz')
/
insert into unu values (2,3,'qwer','qaz')
/
insert into unu values (3,4,'qwer','qaz')
/
insert into unu values (4,5,'qwer','qaz')
/
insert into unu values (5,6,'qwer','qaz')
/
commit
/
alter table unu set unused (a4)
/
alter table unu drop unused columns
/
insert into unu values (12,1,'qaz')
/
insert into unu values (13,2,'qaz')
/
commit
/
update unu set a3='hehe' where a1<=7
/
commit
/
update unu set a2=666 where a1>=7
/
commit
/
alter table unu set unused (a2)
/
insert into unu values (21,'hehe')
/
insert into unu values (22,'hehe')
/
commit
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/

case 9 "checkpoint删除禁用列" 0
src_sql:
drop table unu cascade constraints
/
create table unu (a1 int,a2 int,a3 varchar2(10),a4 varchar2(10),a5 int,a6 int,a7 int)
/
insert into unu values (1,2,'qwer','qaz',1,2,3)
/
insert into unu values (2,3,'qwer','qaz',1,2,3)
/
insert into unu values (3,4,'qwer','qaz',1,2,3)
/
insert into unu values (4,5,'qwer','qaz',1,2,3)
/
insert into unu values (5,6,'qwer','qaz',1,2,3)
/
commit
/
alter table unu set unused (a4,a5,a6,a7)
/
alter table unu drop unused columns checkpoint 1
/
		tgt_sql:
SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'UNU') order by name
/
select * from unu order by a1
/
