case 100 "隐藏列：字符类型隐藏char单列 建表" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
				
		
case 101 "隐藏列：字符类型隐藏char单列 DML" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		update visible set c_char='X' where no=2
        /
		update visible set c_char5='1' where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
				
case 102 "隐藏列：字符类型隐藏char单列 增加单列" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible add v1 char
		/
		alter table visible add v2 char invisible
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO','1','2' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO','3','4' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO','5','6' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO','7' )
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO','8' )
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO','9' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 103 "隐藏列：字符类型隐藏char单列 增加单列DML" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible add v1 char
		/
		alter table visible add v2 char invisible
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO','1','2' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO','3','4' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO','5','6' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO','7' )
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO','8' )
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO','9' )
		/
		commit
		/
		update visible set c_char='X' where no=8
        /
		update visible set c_char5='1' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 104 "隐藏列：字符类型隐藏char单列 增加多列" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible add (v1 char,v3 char)
		/
		alter table visible add (v2 char invisible,v4 char invisible)
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2,v3,v4) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO','1','2','3','4' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2,v3,v4) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO','2','3','4','5' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2,v3,v4) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO','3','4','5','6' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO','6' ,'7')
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO','7' ,'8')
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO','8' ,'9')
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 105 "隐藏列：字符类型隐藏char单列 增加多列DML" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible add (v1 char,v3 char)
		/
		alter table visible add (v2 char invisible,v4 char invisible)
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2,v3,v4) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO','1','2','3','4' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2,v3,v4) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO','2','3','4','5' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2,v1,v2,v3,v4) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO','3','4','5','6' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO','6' ,'7')
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO','7' ,'8')
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO','8' ,'9')
		/
		commit
		/
		update visible set c_char='X' where no=8
        /
		update visible set c_char5='1' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 106 "隐藏列：字符类型隐藏char单列 重命名列" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible rename column c_char to v1
		/
		alter table visible rename column c_char5 to v2
		/
		insert into visible(no,v1,v2,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,v1,v2,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,v1,v2,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO')
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO')
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO')
		/
		commit
		/		
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 107 "隐藏列：字符类型隐藏char单列 重命名列DML" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible rename column c_char to v1
		/
		alter table visible rename column c_char5 to v2
		/
		insert into visible(no,v1,v2,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,v1,v2,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,v1,v2,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO')
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO')
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO')
		/
		commit
		/
		update visible set v1='X' where no=8
        /
		update visible set v2='1' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 108 "隐藏列：字符类型隐藏char单列 修改列属性" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible modify (c_char varchar2(5))
		/
		alter table visible modify (c_char5 varchar2(5))
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO')
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO')
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO')
		/
		commit
		/		
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in ('C_CHAR','C_CHAR5')order by column_name
		/
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
		
case 109 "隐藏列：字符类型隐藏char单列 修改列属性DML" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible modify (c_char varchar2(5))
		/
		alter table visible modify (c_char5 varchar2(5))
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 7,'D', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 8,'E', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 9,'F', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 10, '56789','GH','BN', '0123456789', 'INFO')
		/
		insert into visible values ( 11, '45678','ED','CV', '0123456789', 'INFO')
		/
		insert into visible values ( 12, '45678','JK','DH', '0123456789', 'INFO')
		/
		commit
		/
		update visible set c_char='X' where no=8
        /
		update visible set c_char5='1' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in ('C_CHAR','C_CHAR5')order by column_name
		/
		select * from visible order by no
		/
		select no,c_char from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
		
		
case 110 "隐藏列：字符类型隐藏char单列 删除单列" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible drop column c_char
		/
		alter table visible drop column c_charbyte
		/
		insert into visible(no,c_char5,c_charchar,c_varchar2,c_nvarchar2) values ( 7, '23456','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char5,c_charchar,c_varchar2,c_nvarchar2) values ( 8, '34567','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char5,c_charchar,c_varchar2,c_nvarchar2) values ( 9, '45678','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 10, '56789','BN', '0123456789', 'INFO')
		/
		insert into visible values ( 11, '45678','CV', '0123456789', 'INFO')
		/
		insert into visible values ( 12, '45678','DH', '0123456789', 'INFO')
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char5 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 111 "隐藏列：字符类型隐藏char单列 删除单列DML" 0
src_sql:
		drop table visible purge
        /
        create table visible (
            no           int primary key,
            c_char       char invisible,
            c_char5      char(5),
            c_charbyte   char( 2 byte ),
            c_charchar   char( 2 char ),
            c_varchar2   varchar2(10),
            c_nvarchar2  nvarchar2(10)
        )
        /
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 1,'A', '23456','XY','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 2,'B', '34567','TY','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char,c_char5,c_charbyte,c_charchar,c_varchar2,c_nvarchar2) values ( 3,'C', '45678','RT','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 4, '56789','GH','BN', '0123456789', 'INFO' )
		/
		insert into visible values ( 5, '45678','ED','CV', '0123456789', 'INFO' )
		/
		insert into visible values ( 6, '45678','JK','DH', '0123456789', 'INFO' )
		/
		commit
		/
		alter table visible drop column c_char
		/
		alter table visible drop column c_charbyte
		/
		insert into visible(no,c_char5,c_charchar,c_varchar2,c_nvarchar2) values ( 7, '23456','ZW', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char5,c_charchar,c_varchar2,c_nvarchar2) values ( 8, '34567','UI', '0123456789', 'INFO' )
		/
		insert into visible(no,c_char5,c_charchar,c_varchar2,c_nvarchar2) values ( 9, '45678','DF', '0123456789', 'INFO' )
		/
		insert into visible values ( 10, '56789','BN', '0123456789', 'INFO')
		/
		insert into visible values ( 11, '45678','CV', '0123456789', 'INFO')
		/
		insert into visible values ( 12, '45678','DH', '0123456789', 'INFO')
		/
		commit
		/
		update visible set c_char5='X' where no=8
        /
		update visible set c_char5='1' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_char5 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
		
		
			
		
case 112 "隐藏列：数字类型隐藏number单列 建表" 0	
src_sql:	
		drop table visible purge
		/
        create table visible (
            no             int primary key,
            c_number       number invisible,
            c_number5      number(5),
            c_number5_2    number(5,2),
            c_int          int,
            c_float        float,
            c_double       double precision,
            c_real         real,
            c_binary_float BINARY_FLOAT,
            c_BINARY_DOUBLE BINARY_DOUBLE
        )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_number from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 113 "隐藏列：数字类型隐藏number单列 DML" 0
src_sql:		
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		update visible set c_number='123' where no=2
        /
		update visible set c_number5='800' where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_number from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 114 "隐藏列：数字类型隐藏number单列 增加单列" 0	
src_sql:	
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		alter table visible add v1 number
		/
		alter table visible add v2 number invisible
		/
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE,v1,v2) values ( 7,400, 200, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369,963  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE,v1,v2) values ( 8,500, 200, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369,963  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE,v1,v2) values ( 9,600, 200, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369,963  )
        /
		insert into visible values ( 10, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
        /
		insert into visible values ( 11, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
        /
		insert into visible values ( 12, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
        /
		commit
		/		
 tgt_sql:
		select * from visible order by no
		/
		select no,c_number from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 115 "隐藏列：数字类型隐藏number单列 增加单列DML" 0	
src_sql:	
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		alter table visible add v1 number
		/
		alter table visible add v2 number invisible
		/
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE,v1,v2) values ( 7,400, 200, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369,963  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE,v1,v2) values ( 8,500, 200, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369,963  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE,v1,v2) values ( 9,600, 200, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369,963  )
        /
		insert into visible values ( 10, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
        /
		insert into visible values ( 11, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
        /
		insert into visible values ( 12, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45,369  )
        /
		commit
		/
		update visible set c_number='123' where no=2
        /
		update visible set c_number5='800' where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_number from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 116 "隐藏列：数字类型隐藏number单列 重命名列" 0	
src_sql:	
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		alter table visible rename column c_number to v1
		/
		alter table visible rename column c_number5 to v2
		/
		insert into visible(no,v1,v2,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 7,400, 200, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,v1,v2,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 8,500, 200, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,v1,v2,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 9,600, 200, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 10, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 11, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 12, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		commit
		/		
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
		
case 117 "隐藏列：数字类型隐藏number单列 重命名列DML" 0	
src_sql:	
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		alter table visible rename column c_number to v1
		/
		alter table visible rename column c_number5 to v2
		/
		insert into visible(no,v1,v2,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 7,400, 200, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,v1,v2,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 8,500, 200, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,v1,v2,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 9,600, 200, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 10, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 11, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 12, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		commit
		/
		update visible set v1='123' where no=2
        /
		update visible set v2='800' where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 118 "隐藏列：数字类型隐藏number单列 修改列属性" 0	
src_sql:	
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		alter table visible modify (c_number number(5))
		/
		alter table visible modify (c_number5 float(5))
		/
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 7,400, 200, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 8,500, 200, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 9,600, 200, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 10, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 11, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 12, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/		
 tgt_sql:
		select column_name,data_type,data_length,data_precision from user_tab_cols where table_name='VISIBLE' and column_name in ('C_NUMBER','C_NUMBER5')order by column_name
		/
		select * from visible order by no
		/
		select no,c_number from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 119 "隐藏列：数字类型隐藏number单列 修改列属性DML" 0	
src_sql:	
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		alter table visible modify (c_number number(5))
		/
		alter table visible modify (c_number5 float(5))
		/
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,400, 200, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,500, 200, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,600, 200, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		update visible set c_number=123 where no=2
        /
		update visible set c_number5=800 where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length,data_precision from user_tab_cols where table_name='VISIBLE' and column_name in ('C_NUMBER','C_NUMBER5')order by column_name
		/
		select * from visible order by no
		/
		select no,c_number from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 120 "隐藏列：数字类型隐藏number单列 删除列DML" 0
src_sql:		
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		alter table visible drop column c_number 
		/
		alter table visible drop column c_number5
		/
		insert into visible(no,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 7, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 8, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 9, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 10,  123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 11,  345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 12,  654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		commit
		/		
 tgt_sql:
		select * from visible order by no
		/
		select no,c_int from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 121 "隐藏列：数字类型隐藏number单列 删除列DML" 0
src_sql:		
		drop table visible purge
		/
		create table visible (
			no			   int primary key,
			c_number       number invisible,
			c_number5      number(5),
			c_number5_2    number(5,2),
			c_int          int,
			c_float        float,
			c_double       double precision,
			c_real         real,
			c_binary_float BINARY_FLOAT,
			c_BINARY_DOUBLE BINARY_DOUBLE
		)
		/		
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 1,100, 200, 345.67, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 2,200, 200, 456.78, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number,c_number5,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 3,300, 200, 567.89, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 4, 400, 123.45, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 5, 400, 345.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 6, 400, 654.54, 1, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		commit
		/
		alter table visible drop column c_number 
		/
		alter table visible drop column c_number5
		/
		insert into visible(no,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 7, 345.67, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 8, 456.78, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible(no,c_number5_2,c_int,c_float,c_double,c_real,c_binary_float,c_BINARY_DOUBLE) values ( 9, 567.89, 2, 100.23, 300.45, 500.6789, 100.23, 300.45  )
        /
		insert into visible values ( 10,  123.45, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 11,  345.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		insert into visible values ( 12,  654.54, 2, 100.23, 300.45, 500.6789, 100.23, 300.45 )
        /
		commit
		/
		update visible set c_int='123' where no=8
        /
		update visible set c_int='800' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_int from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 122 "隐藏列：时间类型隐藏date单列 建表" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (2,
			to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (4,
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (5,
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_date from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
		
case 123 "隐藏列：时间类型隐藏date单列 DML" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (2,
			to_date( '08/12/02 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (4,
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (5,
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		update visible set c_date=to_date( '17/10/31 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=2
        /
		update visible set c_timestamp=TO_TIMESTAMP ('17-10-31 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF') where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_date from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/				
		
case 124 "隐藏列：时间类型隐藏date单列 增加列" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible add v1 date
		/
		alter table visible add v2 date invisible
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4,v1,v2) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4,v1,v2) values (4,
			to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4,v1,v2) values (5,
			to_date( '08/12/05 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('10-09-07 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('10-09-08 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_date from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			
		
case 125 "隐藏列：时间类型隐藏date单列 增加列DML" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible add v1 date
		/
		alter table visible add v2 date invisible
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4,v1,v2) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4,v1,v2) values (4,
			to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4,v1,v2) values (5,
			to_date( '08/12/05 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('10-09-07 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('10-09-08 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30'),
			to_date( '17/10/03 12:34:56','YY/MM/DD HH24:MI:SS' )
		)
		/
		commit
		/		
		update visible set c_date=to_date( '17/10/31 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=2
        /
		update visible set c_timestamp=TO_TIMESTAMP ('17-10-31 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF') where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_date from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/						

case 126 "隐藏列：时间类型隐藏date单列 重命名列" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible rename column c_date to v1 
		/
		alter table visible rename column c_timestamp to v2 
		/
		insert into visible(no,v1,v2,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,v1,v2,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (4,
			to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible(no,v1,v2,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (5,
			to_date( '08/12/05 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('10-09-07 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('10-09-08 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/						
				
case 127 "隐藏列：时间类型隐藏date单列 重命名列DML" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible rename column c_date to v1 
		/
		alter table visible rename column c_timestamp to v2 
		/
		insert into visible(no,v1,v2,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,v1,v2,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (4,
			to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible(no,v1,v2,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (5,
			to_date( '08/12/05 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('10-09-07 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('10-09-08 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/		
		update visible set v1=to_date( '17/10/31 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=2
        /
		update visible set v2=TO_TIMESTAMP ('17-10-31 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF') where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/						

case 128 "隐藏列：时间类型隐藏date单列 修改列属性" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible modify (c_date timestamp) 
		/
		alter table visible modify (c_timestamp date) 
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (4,
			to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (5,
			to_date( '08/12/05 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('10-09-07 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('10-09-08 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in('C_DATE','C_TIMESTAMP') order by column_name
		/
		select * from visible order by no
		/
		select no,c_date from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			
		
case 129 "隐藏列：时间类型隐藏date单列 修改列属性DML" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible modify (c_date timestamp) 
		/
		alter table visible modify (c_timestamp date) 
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			to_date( '08/12/03 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-03 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (4,
			to_date( '08/12/04 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-04 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (5,
			to_date( '08/12/05 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-05 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('10-09-06 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('10-09-07 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('10-09-08 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/		
		update visible set c_timestamp=to_date( '17/10/31 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=2
        /
		update visible set c_date=TO_TIMESTAMP ('17-10-31 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF') where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in('C_DATE','C_TIMESTAMP') order by column_name
		/
		select * from visible order by no
		/
		select no,c_date from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			

case 130 "隐藏列：时间类型隐藏date单列 删除单列" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible drop column c_date
		/
		alter table visible drop column c_timestamp
		/
		insert into visible(no,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (4,
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible(no,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (5,
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_timestamp5 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/	
		
case 131 "隐藏列：时间类型隐藏date单列 删除单列DML" 0
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_date               date invisible,
			c_timestamp          timestamp,
			c_timestamp5         timestamp(5),
			c_timestampzone      timestamp with time zone,
			c_timestamp5zone     timestamp(5) with time zone,
			c_ts_lzone           timestamp with local time zone,
			c_ts5_lzone          timestamp(5) with local time zone,
			c_ym                 interval year to month,
			c_ym3                interval year (3) to month,
			c_ds                 interval day to second,
			c_ds_3               interval day (3) to second,
			c_ds_3_4             interval day (3) to second ( 4 )
		)
		/
		insert into visible(no,c_date,c_timestamp,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (1,
			to_date( '08/12/01 12:34:56','YY/MM/DD HH24:MI:SS' ),
			TO_TIMESTAMP ('10-09-01 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-01 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-01 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-01 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-01 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-01 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible values (2,
			TO_TIMESTAMP ('10-09-02 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP ('23-09-02 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-02 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-02 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-02 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-02 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/
		alter table visible drop column c_date
		/
		alter table visible drop column c_timestamp
		/
		insert into visible(no,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (3,
			TO_TIMESTAMP ('23-09-03 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-03 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-03 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-03 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-03 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/		
		insert into visible(no,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (4,
			TO_TIMESTAMP ('23-09-04 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-04 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-04 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-04 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-04 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible(no,c_timestamp5,c_timestampzone,c_timestamp5zone,c_ts_lzone,c_ts5_lzone,c_ym,c_ym3,c_ds,c_ds_3,c_ds_3_4) values (5,
			TO_TIMESTAMP ('23-09-05 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-05 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-05 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-05 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-05 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/	
		insert into visible values (6,
			TO_TIMESTAMP ('23-09-06 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-06 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-06 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-06 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-06 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (7,
			TO_TIMESTAMP ('23-09-07 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-07 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-07 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-07 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-07 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		insert into visible values (8,
			TO_TIMESTAMP ('23-09-08 15:17:32.456000', 'DD-MM-RR HH24:MI:SS.FF'),
			TO_TIMESTAMP_TZ('1999-12-08 11:00:00-08:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2000-12-08 12:00:00-09:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2001-12-08 13:00:00-10:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_TIMESTAMP_TZ('2008-12-08 14:00:00-11:00','YYYY-MM-DD HH24:MI:SSTZH:TZM'),
			TO_YMINTERVAL('01-02'),
			TO_YMINTERVAL('03-04'),
			TO_DSINTERVAL('001 10:00:00'),
			TO_DSINTERVAL('002 12:34:56'),
			TO_DSINTERVAL('003 10:20:30')
		)
		/
		commit
		/		
		update visible set c_timestamp5=to_date( '17/10/31 12:34:56','YY/MM/DD HH24:MI:SS' ) where no=2
        /
		update visible set c_timestamp5=TO_TIMESTAMP ('17-10-31 14:10:10.123000', 'DD-MM-RR HH24:MI:SS.FF') where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_timestamp5 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
		
case 132 "隐藏列：LOB类型隐藏blob单列 建表" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob,
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','111111' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_blob1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			
		
case 133 "隐藏列：LOB类型隐藏blob单列 DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob,
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
		update visible set c_blob1=rawtohex('abcdefg') where no=2
        /
		update visible set c_clob1='1' where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_blob1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/					

case 134 "隐藏列：LOB类型隐藏blob单列 增加列" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob,
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
		alter table visible add v1 blob 
		/
		alter table visible add v2 clob invisible
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2,v1,v2) values ( 7,rawtohex('gggggg'), rawtohex('info2soft'),'ggggg','info2soft' ,rawtohex('ggggg'),'wechat')
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2,v1,v2) values ( 8,rawtohex('hhhhhh'), rawtohex('info2soft'),'hhhhh','info2soft' ,rawtohex('hhhhh'),'wechat')
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2,v1,v2) values ( 9,rawtohex('iiiiii'), rawtohex('info2soft'),'iiiii','info2soft' ,rawtohex('iiiii'),'wechat')
		/
		insert into visible values ( 10,rawtohex('info2soft'),'jjjjj','info2soft',rawtohex('jjjjj') )
		/
		insert into visible values ( 11,rawtohex('info2soft'),'jjjjj','info2soft',rawtohex('kkkkk') )
		/
		insert into visible values ( 12,rawtohex('info2soft'),'jjjjj','info2soft',rawtohex('lllll') )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_blob1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/	
		
case 135 "隐藏列：LOB类型隐藏blob单列 增加列DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob,
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
		alter table visible add v1 blob 
		/
		alter table visible add v2 clob invisible
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2,v1,v2) values ( 7,rawtohex('gggggg'), rawtohex('info2soft'),'ggggg','info2soft' ,rawtohex('ggggg'),'wechat')
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2,v1,v2) values ( 8,rawtohex('hhhhhh'), rawtohex('info2soft'),'hhhhh','info2soft' ,rawtohex('hhhhh'),'wechat')
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2,v1,v2) values ( 9,rawtohex('iiiiii'), rawtohex('info2soft'),'iiiii','info2soft' ,rawtohex('iiiii'),'wechat')
		/
		insert into visible values ( 10,rawtohex('info2soft'),'jjjjj','info2soft',rawtohex('jjjjj') )
		/
		insert into visible values ( 11,rawtohex('info2soft'),'jjjjj','info2soft',rawtohex('kkkkk') )
		/
		insert into visible values ( 12,rawtohex('info2soft'),'jjjjj','info2soft',rawtohex('lllll') )
		/
		commit
		/
		update visible set c_blob1=rawtohex('abcdefg') where no=8
        /
		update visible set c_clob1='1' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_blob1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/					

case 136 "隐藏列：LOB类型隐藏blob单列 重命名列" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob,
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
		alter table visible rename column c_blob1 to v1
		/
		alter table visible rename column c_clob1 to v2 
		/
		insert into visible(no,v1,c_blob2,v2,c_clob2) values ( 7,rawtohex('gggggg'), rawtohex('info2soft'),'ggggg','info2soft')
		/
		insert into visible(no,v1,c_blob2,v2,c_clob2) values ( 8,rawtohex('hhhhhh'), rawtohex('info2soft'),'hhhhh','info2soft')
		/
		insert into visible(no,v1,c_blob2,v2,c_clob2) values ( 9,rawtohex('iiiiii'), rawtohex('info2soft'),'iiiii','info2soft')
		/
		insert into visible values ( 10,rawtohex('info2soft'),'jjjjj','info2soft' )
		/
		insert into visible values ( 11,rawtohex('info2soft'),'jjjjj','info2soft' )
		/
		insert into visible values ( 12,rawtohex('info2soft'),'jjjjj','info2soft' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 137 "隐藏列：LOB类型隐藏blob单列 重命名列DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob,
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
		alter table visible rename column c_blob1 to v1
		/
		alter table visible rename column c_clob1 to v2 
		/
		insert into visible(no,v1,c_blob2,v2,c_clob2) values ( 7,rawtohex('gggggg'), rawtohex('info2soft'),'ggggg','info2soft')
		/
		insert into visible(no,v1,c_blob2,v2,c_clob2) values ( 8,rawtohex('hhhhhh'), rawtohex('info2soft'),'hhhhh','info2soft')
		/
		insert into visible(no,v1,c_blob2,v2,c_clob2) values ( 9,rawtohex('iiiiii'), rawtohex('info2soft'),'iiiii','info2soft')
		/
		insert into visible values ( 10,rawtohex('info2soft'),'jjjjj','info2soft' )
		/
		insert into visible values ( 11,rawtohex('info2soft'),'jjjjj','info2soft' )
		/
		insert into visible values ( 12,rawtohex('info2soft'),'jjjjj','info2soft' )
		/
		commit
		/
		update visible set v1=rawtohex('abcdefg') where no=8
        /
		update visible set v2='1' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/					


case 138 "隐藏列：LOB类型隐藏blob单列 删除列" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob, 
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
		alter table visible drop column c_blob1
		/
		alter table visible drop column c_clob1
		/
		insert into visible(no,c_blob2,c_clob2) values ( 7, rawtohex('info2soft'),'info2soft')
		/
		insert into visible(no,c_blob2,c_clob2) values ( 8, rawtohex('info2soft'),'info2soft')
		/
		insert into visible(no,c_blob2,c_clob2) values ( 9, rawtohex('info2soft'),'info2soft')
		/
		insert into visible values ( 10,rawtohex('info2soft'),'info2soft' )
		/
		insert into visible values ( 11,rawtohex('info2soft'),'info2soft' )
		/
		insert into visible values ( 12,rawtohex('info2soft'),'info2soft' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_blob2 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
		
case 139 "隐藏列：LOB类型隐藏blob单列 删除列DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no					 int primary key,
			c_blob1              blob invisible,
			c_blob2              blob,
			c_clob1              clob,
			c_clob2              clob
		)
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 1,rawtohex('aaaaaa'), rawtohex('info2soft'),'aaaaa','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 2,rawtohex('bbbbbb'), rawtohex('info2soft'),'bbbbb','info2soft' )
		/
		insert into visible(no,c_blob1,c_blob2,c_clob1,c_clob2) values ( 3,rawtohex('cccccc'), rawtohex('info2soft'),'ccccc','info2soft' )
		/
		insert into visible values ( 4,rawtohex('info2soft'),'ddddd','info2soft' )
		/
		insert into visible values ( 5,rawtohex('info2soft'),'eeeee','info2soft' )
		/
		insert into visible values ( 6,rawtohex('info2soft'),'fffff','info2soft' )
		/
		commit
		/
		alter table visible drop column c_blob1
		/
		alter table visible drop column c_clob1
		/
		insert into visible(no,c_blob2,c_clob2) values ( 7, rawtohex('info2soft'),'info2soft')
		/
		insert into visible(no,c_blob2,c_clob2) values ( 8, rawtohex('info2soft'),'info2soft')
		/
		insert into visible(no,c_blob2,c_clob2) values ( 9, rawtohex('info2soft'),'info2soft')
		/
		insert into visible values ( 10,rawtohex('info2soft'),'info2soft' )
		/
		insert into visible values ( 11,rawtohex('info2soft'),'info2soft' )
		/
		insert into visible values ( 12,rawtohex('info2soft'),'info2soft' )
		/
		commit
		/
		update visible set c_blob2=rawtohex('panama') where no=8
        /
		update visible set c_blob2=rawtohex('relax') where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_blob2 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/

case 140 "隐藏列：RAW类型隐藏raw单列 建表" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_raw6 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		

case 141 "隐藏列：RAW类型隐藏raw单列 DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		update visible set c_raw6=rawtohex('INFOFO') where no=2
        /
		update visible set c_raw7=rawtohex('INFOFO') where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_raw6 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		

case 142 "隐藏列：RAW类型隐藏raw单列 增加列" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible add v1 raw(10)
		/
		alter table visible add v2 raw(10) invisible
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1,v1,v2) values ( 7, 70,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT'),rawtohex('SOFTWARE') )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1,v1,v2) values ( 8, 80,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff', rawtohex('INFO2SOFT'),rawtohex('SOFTWARE') )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1,v1,v2) values ( 9, 90,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT'),rawtohex('SOFTWARE') )
		/
		insert into visible values ( 10, 100,'AAAAAA', '00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
		/
		insert into visible values ( 11, 110,'AAAAAA', '00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
		/
		insert into visible values ( 12, 120,'AAAAAA', '00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_raw6 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			
		
case 143 "隐藏列：RAW类型隐藏raw单列 增加列DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible add v1 raw(10)
		/
		alter table visible add v2 raw(10) invisible
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1,v1,v2) values ( 7, 70,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT'),rawtohex('SOFTWARE') )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1,v1,v2) values ( 8, 80,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff', rawtohex('INFO2SOFT'),rawtohex('SOFTWARE') )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1,v1,v2) values ( 9, 90,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT'),rawtohex('SOFTWARE') )
		/
		insert into visible values ( 10, 100,'AAAAAA', '00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
		/
		insert into visible values ( 11, 110,'AAAAAA', '00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
		/
		insert into visible values ( 12, 120,'AAAAAA', '00112233445566778899aabbccddeeff',rawtohex('INFO2SOFT') )
		/
		commit
		/
		update visible set c_raw6=rawtohex('INFOFO') where no=8
        /
		update visible set c_raw7=rawtohex('INFOFO') where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_raw6 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		

case 144 "隐藏列：RAW类型隐藏raw单列 重命名列" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible rename column c_raw6 to v1
		/
		alter table visible rename column c_raw7 to v2
		/
		insert into visible(no,c_int,v1,v2,c_lraw1) values ( 7, 70,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,v1,v2,c_lraw1) values ( 8, 80,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,v1,v2,c_lraw1) values ( 9, 90,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 10, 100,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 11, 110,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 12, 120,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		
				
		
case 145 "隐藏列：RAW类型隐藏raw单列 重命名列DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible rename column c_raw6 to v1
		/
		alter table visible rename column c_raw7 to v2
		/
		insert into visible(no,c_int,v1,v2,c_lraw1) values ( 7, 70,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,v1,v2,c_lraw1) values ( 8, 80,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,v1,v2,c_lraw1) values ( 9, 90,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 10, 100,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 11, 110,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 12, 120,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		update visible set v1=rawtohex('INFOFO') where no=8
        /
		update visible set v2=rawtohex('INFOFO') where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		

case 146 "隐藏列：RAW类型隐藏raw单列 修改列属性" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible modify (c_raw6 raw(10))
		/
		alter table visible modify (c_raw7 raw(10))
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 7, 70,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 8, 80,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 9, 90,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 10, 100,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 11, 110,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 12, 120,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in('C_RAW6','C_RAW7') order by column_name
		/
		select * from visible order by no
		/
		select no,c_raw6 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/				
		
		
case 147 "隐藏列：RAW类型隐藏raw单列 修改列属性DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible modify (c_raw6 raw(10))
		/
		alter table visible modify (c_raw7 raw(10))
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 7, 70,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 8, 80,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 9, 90,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 10, 100,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 11, 110,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 12, 120,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		update visible set c_raw6=rawtohex('INFOFO') where no=8
        /
		update visible set c_raw7=rawtohex('INFOFO') where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in('C_RAW6','C_RAW7') order by column_name
		/
		select * from visible order by no
		/
		select no,c_raw6 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/				

case 148 "隐藏列：RAW类型隐藏raw单列 删除列" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible drop column c_raw6
		/
		alter table visible drop column c_raw7
		/
		insert into visible(no,c_int,c_lraw1) values ( 7, 70,'00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_lraw1) values ( 8, 80,'00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_lraw1) values ( 9, 90,'00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 10, 100, '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 11, 110, '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 12, 120, '00112233445566778899aabbccddeeff' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_int from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/	
		
case 149 "隐藏列：RAW类型隐藏raw单列 删除列DML" 0	
src_sql:
		drop table visible purge
		/
		create table visible (
			no 					int primary key,
			c_int               int,
			c_raw6              raw(6) invisible,
			c_raw7              raw(6),	
			c_lraw1             long raw
		)
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 1, 10,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 2, 20,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_raw6,c_raw7,c_lraw1) values ( 3, 30,'ABCDEF','AAAAAA','00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 4, 40,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 5, 50,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 6, 60,'AAAAAA', '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		alter table visible drop column c_raw6
		/
		alter table visible drop column c_raw7
		/
		insert into visible(no,c_int,c_lraw1) values ( 7, 70,'00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_lraw1) values ( 8, 80,'00112233445566778899aabbccddeeff' )
		/
		insert into visible(no,c_int,c_lraw1) values ( 9, 90,'00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 10, 100, '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 11, 110, '00112233445566778899aabbccddeeff' )
		/
		insert into visible values ( 12, 120, '00112233445566778899aabbccddeeff' )
		/
		commit
		/
		update visible set c_int=2333 where no=8
        /
		update visible set c_int=2333 where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_int from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/				

case 150 "隐藏列：ROWID类型隐藏rowid单列 建表" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_rid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			
		
case 151 "隐藏列：ROWID类型隐藏rowid单列 DML" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		update visible set c_rid='QQQQ+QQQQQQQQQvQQQ' where no=2
        /
		update visible set c_rid0='QQQQ+QQQQQQQQQvQQQ' where no=5
        /
		commit
		/
		delete from visible where  no=3
		/
		delete from visible where  no=6
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_rid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			

case 152 "隐藏列：ROWID类型隐藏rowid单列 增加列" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		alter table visible add v1 rowid 
		/
		alter table visible add v2 urowid invisible
		/
		insert into visible(no,c_rid,c_rid0,c_urid,v1,v2) values ( 7,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid,v1,v2) values ( 8,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+')
		/
		insert into visible(no,c_rid,c_rid0,c_urid,v1,v2) values ( 9,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+', 'AAAQ+UAAEAAADAvAAA' )
		/
		insert into visible values ( 11, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+', 'AAAQ+UAAEAAADAvBBB' )
		/
		insert into visible values ( 12, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+', 'AAAQ+UAAEAAADAvCCC' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_rid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/					
		
		
case 153 "隐藏列：ROWID类型隐藏rowid单列 增加列DML" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		alter table visible add v1 rowid 
		/
		alter table visible add v2 urowid invisible
		/
		insert into visible(no,c_rid,c_rid0,c_urid,v1,v2) values ( 7,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid,v1,v2) values ( 8,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvBBB', '*BAEANzQCwQICwQL+')
		/
		insert into visible(no,c_rid,c_rid0,c_urid,v1,v2) values ( 9,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+','AAAQ+UAAEAAADAvCCC', '*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+', 'AAAQ+UAAEAAADAvAAA' )
		/
		insert into visible values ( 11, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+', 'AAAQ+UAAEAAADAvBBB' )
		/
		insert into visible values ( 12, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+', 'AAAQ+UAAEAAADAvCCC' )
		/
		commit
		/
		update visible set c_rid='QQQQ+QQQQQQQQQvQQQ' where no=8
        /
		update visible set c_rid0='QQQQ+QQQQQQQQQvQQQ' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_rid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/					

case 154 "隐藏列：ROWID类型隐藏rowid单列 重命名列" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		alter table visible rename column c_rid to v1
		/
		alter table visible rename column c_rid0 to v2
		/
		insert into visible(no,v1,v2,c_urid) values ( 7,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,v1,v2,c_urid) values ( 8,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,v1,v2,c_urid) values ( 9,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 11, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 12, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		update visible set v1='QQQQ+QQQQQQQQQvQQQ' where no=8
        /
		update visible set v2='QQQQ+QQQQQQQQQvQQQ' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/					
			
		
case 155 "隐藏列：ROWID类型隐藏rowid单列 重命名列DML" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		alter table visible rename column c_rid to v1
		/
		alter table visible rename column c_rid0 to v2
		/
		insert into visible(no,v1,v2,c_urid) values ( 7,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,v1,v2,c_urid) values ( 8,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,v1,v2,c_urid) values ( 9,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 11, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 12, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		update visible set v1='QQQQ+QQQQQQQQQvQQQ' where no=8
        /
		update visible set v2='QQQQ+QQQQQQQQQvQQQ' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,v1 from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/					

case 156 "隐藏列：ROWID类型隐藏rowid单列 修改列属性" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		alter table visible modify (c_rid char(20))
		/
		alter table visible modify (c_urid char(20))
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 7,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 8,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 9,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 11, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 12, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in('C_RID','C_URID') order by column_name
		/
		select * from visible order by no
		/
		select no,c_rid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/
		
case 157 "隐藏列：ROWID类型隐藏rowid单列 修改列属性DML" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		alter table visible modify (c_rid char(20))
		/
		alter table visible modify (c_urid char(20))
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 7,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 8,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 9,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 11, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 12, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		update visible set c_rid='QQQQ+QQQQQQQQQvQQQ' where no=8
        /
		update visible set c_rid0='QQQQ+QQQQQQQQQvQQQ' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select column_name,data_type,data_length from user_tab_cols where table_name='VISIBLE' and column_name in('C_RID','C_URID') order by column_name
		/
		select * from visible order by no
		/
		select no,c_rid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/		

case 158 "隐藏列：ROWID类型隐藏rowid单列 删除列" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		alter table visible drop column c_rid
		/
		alter table visible drop column c_rid0 
		/
		insert into visible(no,c_urid) values ( 7,'*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_urid) values ( 8,'*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_urid) values ( 9,'*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, '*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 11, '*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 12, '*BAEANzQCwQICwQL+' )
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_urid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/	
		
case 159 "隐藏列：ROWID类型隐藏rowid单列 删除列DML" 0			
src_sql:
		drop table visible purge
		/
		create table visible (
			no               	int primary key,
			c_rid               rowid invisible,
			c_rid0              rowid,
			c_urid              urowid
		)
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 1,'AAAQ+UAAEAAADAvAAA', 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 2,'AAAQ+UAAEAAADAvBBB', 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_rid,c_rid0,c_urid) values ( 3,'AAAQ+UAAEAAADAvCCC', 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 4, 'AAAQ+UAAEAAADAvAAA','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 5, 'AAAQ+UAAEAAADAvBBB','*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 6, 'AAAQ+UAAEAAADAvCCC','*BAEANzQCwQICwQL+' )
		/
		commit
		/
		alter table visible drop column c_rid
		/
		alter table visible drop column c_rid0 
		/
		insert into visible(no,c_urid) values ( 7,'*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_urid) values ( 8,'*BAEANzQCwQICwQL+' )
		/
		insert into visible(no,c_urid) values ( 9,'*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 10, '*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 11, '*BAEANzQCwQICwQL+' )
		/
		insert into visible values ( 12, '*BAEANzQCwQICwQL+' )
		/
		commit
		/
		update visible set c_urid='QQQQ+QQQQQQQQQvQQQ' where no=8
        /
		update visible set c_urid='QQQQ+QQQQQQQQQvQQQ' where no=11
        /
		commit
		/
		delete from visible where  no=9
		/
		delete from visible where  no=12
		/
		commit
		/
 tgt_sql:
		select * from visible order by no
		/
		select no,c_urid from visible order by no
		/
		SELECT name,col#,intcol#,segcol# FROM sys.col$ WHERE obj# = (SELECT obj# FROM sys.obj$ WHERE name = 'VISIBLE') order by name
		/			
		
		
		
		
		
		