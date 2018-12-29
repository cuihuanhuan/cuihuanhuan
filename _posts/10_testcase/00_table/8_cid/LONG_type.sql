case 2000 "数据：RAW类型修改数据" 0
        src_sql:
            drop table lon
            /
            create table lon (
				no 					int primary key,
                c_int               int,
				c_char  	   		char(10),
				c_number     		number,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            begin 
				for i in 1..4000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update lon set c_raw6=rawtohex('INFOFO') where no<500
			/
			commit
			/
			delete from lon where  no>3500
			/
			commit
			/
tgt_sql:
select table_name,column_name,data_type from user_tab_columns order by table_name,column_name
/
select count(*) from lon
/



 case 2001 "数据：RAW类型 增加单列" 0
        src_sql:
            drop table lon
            /
			create table lon (
				no 					int primary key,
                c_int               int,
				c_char  	   		char(10),
				c_number     		number,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            begin 
				for i in 1..1000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon add v1 raw(10)
			/
			begin 
				for i in 1001..2000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff',
					rawtohex('JAYCHOU')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon drop (c_int,c_lraw)
			/
			begin 
				for i in 2001..3000
				loop
					insert into lon values (
					i,
					'info2soft',
					i+10000,
					'ABCDEF',
					rawtohex('JAYCHOU')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon add (c_int int,c_lraw long raw)
			/
			begin 
				for i in 3001..4000
				loop
					insert into lon values (
					i,
					'jaychou',
					i+10000,
					'ABCDEF',
					rawtohex('JAYCHOU'),
					i+i,
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update lon set c_raw6=rawtohex('INFOFO') where no between 2000 and 3000
			/
			commit
			/
			delete from lon where  no>3500
			/
			commit
			/
tgt_sql:
select table_name,column_name,data_type from user_tab_columns order by table_name,column_name
/
select count(*) from lon
/


 case 2002 "数据：RAW类型 增加多列" 0
        src_sql:
            drop table lon
            /
			create table lon (
				no 					int primary key,
                c_int               int,
				c_char  	   		char(10),
				c_number     		number,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            begin 
				for i in 1..1000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon add (v1 raw(10),v2 int)
			/
			begin 
				for i in 1001..2000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff',
					rawtohex('JAYCHOU'),
					10012000
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon drop (c_int,c_lraw)
			/
			begin 
				for i in 2001..3000
				loop
					insert into lon values (
					i,
					'info2soft',
					i+10000,
					'ABCDEF',
					rawtohex('JAYCHOU'),
					20013000
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon add (c_int int,c_lraw long raw)
			/
			begin 
				for i in 3001..4000
				loop
					insert into lon values (
					i,
					'jaychou',
					i+10000,
					'ABCDEF',
					rawtohex('JAYCHOU'),
					30014000,
					i+i,
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update lon set c_raw6=rawtohex('INFOFO') where no between 2000 and 3000
			/
			commit
			/
			delete from lon where  no>3500
			/
			commit
			/
tgt_sql:
select table_name,column_name,data_type from user_tab_columns order by table_name,column_name
/
select count(*) from lon
/

 case 2003 "数据：RAW类型 重命名列" 0
        src_sql:
            drop table lon
            /
			create table lon (
				no 					int primary key,
                c_int               int,
				c_char  	   		char(10),
				c_number     		number,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            begin 
				for i in 1..1000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon rename column c_int to v1 
			/
			begin 
				for i in 1001..2000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon drop (v1,c_lraw)
			/
			begin 
				for i in 2001..3000
				loop
					insert into lon values (
					i,
					'info2soft',
					i+10000,
					'ABCDEF'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon add (c_int int,c_lraw long raw)
			/
			begin 
				for i in 3001..4000
				loop
					insert into lon values (
					i,
					'jaychou',
					i+10000,
					'ABCDEF',
					i+i,
					rawtohex('JAYCHOU')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update lon set c_raw6=rawtohex('INFOFO') where no between 2000 and 3000
			/
			commit
			/
			delete from lon where  no>3500
			/
			commit
			/
tgt_sql:
select table_name,column_name,data_type from user_tab_columns order by table_name,column_name
/
select count(*) from lon
/


 case 2004 "数据：RAW类型 修改列属性" 0
        src_sql:
            drop table lon
            /
            create table lon (
				no 					int primary key,
                c_int               int,
				c_char  	   		char(10),
				c_number     		number,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            begin 
				for i in 1..1000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon modify (c_int number) 
			/
			begin 
				for i in 1001..2000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon drop (c_int,c_lraw)
			/
			begin 
				for i in 2001..3000
				loop
					insert into lon values (
					i,
					'info2soft',
					i+10000,
					'ABCDEF'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon add (c_int int,c_lraw long raw)
			/
			begin 
				for i in 3001..4000
				loop
					insert into lon values (
					i,
					'jaychou',
					i+10000,
					'ABCDEF',
					i+i,
					rawtohex('JAYCHOU')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update lon set c_raw6=rawtohex('INFOFO') where no between 2000 and 3000
			/
			commit
			/
			delete from lon where  no>3500
			/
			commit
			/
tgt_sql:
select table_name,column_name,data_type from user_tab_columns order by table_name,column_name
/
select count(*) from lon
/

 case 2005 "数据：RAW类型 删除列" 0
        src_sql:
            drop table lon
            /
            create table lon (
				no 					int primary key,
                c_int               int,
				c_char  	   		char(10),
				c_number     		number,
                c_raw6              raw(6),
                c_lraw              long raw
            )
            /
            begin 
				for i in 1..1000
				loop
					insert into lon values (
					i,
					i+100,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon drop column c_int 
			/
			begin 
				for i in 1001..2000
				loop
					insert into lon values (
					i,
					'info2soft',
					i+10000,
					'ABCDEF',
					'00112233445566778899aabbccddeeff'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon drop (c_char,c_lraw)
			/
			begin 
				for i in 2001..3000
				loop
					insert into lon values (
					i,
					i+10000,
					'ABCDEF'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table lon add (c_int int,c_lraw long raw)
			/
			begin 
				for i in 3001..4000
				loop
					insert into lon values (
					i,
					i+10000,
					'ABCDEF',
					i+i,
					rawtohex('JAYCHOU')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update lon set c_raw6=rawtohex('INFOFO') where no between 2000 and 3000
			/
			commit
			/
			delete from lon where  no>3500
			/
			commit
			/
tgt_sql:
select table_name,column_name,data_type from user_tab_columns order by table_name,column_name
/
select count(*) from lon
/





			
case 2006  "UDT:字符串类型 删除单列 " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa char(10),
			bb varchar2(20),
			cc nchar(100),
			dd nvarchar2(100)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+10000,
					'chaorenbuhuifei',
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 drop column no
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					'tingmamadehua',
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (id_add number)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					'zhizhanzhishang',
					type1('one','two','three','four'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					'yuxiayizhengwan',
					type1('one','two','three','four'),
					i+i,
					2013
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update cust1 set no=2017 where id<200
			/
			commit
			/
			delete from cust1 where  id>350
			/
			commit
			/		
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/							
			
case 2007  "UDT:字符串类型 删除多列 " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa char(10),
			bb varchar2(20),
			cc nchar(100),
			dd nvarchar2(100)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+10000,
					'atthebeginning',
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (id_add number,val_add char(20))
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1('one','two','three','four'),
					i+i,
					'asdasd'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int,val varchar2(20))
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1('one','two','three','four'),
					i+i,
					'sdasfg',
					2013,
					'threehundreds'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update cust1 set no=20171121 where id<200
			/
			commit
			/
			delete from cust1 where  id>350
			/
			commit
			/		
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/								
			
			
case 2008  "UDT:字符串类型 添加单列 " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa char(10),
			bb varchar2(20),
			cc nchar(100),
			dd nvarchar2(100)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+10000,
					'chaorenbuhuifei',
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 add (id_add number)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					i+1,
					'zhizhanzhishang',
					type1('one','two','three','four'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop column no
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					'tingmamadehua',
					type1('one','two','three','four'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					'yuxiayizhengwan',
					type1('one','two','three','four'),
					i+i,
					2013
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update cust1 set no=2017 where id<200
			/
			commit
			/
			delete from cust1 where  id>350
			/
			commit
			/		
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/				

case 2009  "UDT:字符串类型 增加多列 " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa char(10),
			bb varchar2(20),
			cc nchar(100),
			dd nvarchar2(100)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+10000,
					'atthebeginning',
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 add (id_add number)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					i+10000,
					'atthebeginning',
					type1('one','two','three','four'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					type1('one','two','three','four'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int,val varchar2(20))
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1('one','two','three','four'),
					i+i,
					2013,
					'threehundreds'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update cust1 set no=20171121 where id<200
			/
			commit
			/
			delete from cust1 where  id>350
			/
			commit
			/		
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/	

case 2010  "UDT:字符串类型 修改列属性 " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa char(10),
			bb varchar2(20),
			cc nchar(100),
			dd nvarchar2(100)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+10000,
					'atthebeginning',
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 modify (val char(20))
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					i+1,
					'onehundreds',
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1('one','two','three','four')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1('one','two','three','four'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update cust1 set no=2017 where id<200
			/
			commit
			/
			delete from cust1 where  id>350
			/
			commit
			/		
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/

			
			
case 2011 "UDT:数字类型 删除单列 有数据 " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa number,
			bb integer,
			cc BINARY_FLOAT,
			dd BINARY_DOUBLE,
			ff float
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			id_new number,
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+1,
					'atthebeginning',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop column no
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					'atthebeginning',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					'atthebeginning',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					i+1
					);
				end loop;
				commit;
			end;
			/
			commit
			/
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/			
			
			
case 2012 "UDT:数字类型 删除多列 有数据 " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa number,
			bb integer,
			cc BINARY_FLOAT,
			dd BINARY_DOUBLE,
			ff float
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			id_new number,
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+1,
					'atthebeginning',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no_add int,val_add char(20))
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					i+1,
					'ccccc'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/						
			
			
case 2013 "UDT:数字类型 增加单列  " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa number,
			bb integer,
			cc BINARY_FLOAT,
			dd BINARY_DOUBLE,
			ff float
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			id_new number,
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+1,
					'atthebeginning',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (id_add number)
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					i+1,
					'onehundreds',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop column no
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					'twohundreds',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					'threehundreds',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					i+i,
					20171121
					);
				end loop;
				commit;
			end;
			/
			commit
			/
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/			
			
			
case 2014 "UDT:数字类型 增加多列  " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa number,
			bb integer,
			cc BINARY_FLOAT,
			dd BINARY_DOUBLE,
			ff float
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			id_new number,
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+1,
					'atthebeginning',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (v1 int,v2 char(10))
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					i+1,
					'onehundreds',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					1111,
					'yibai'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					2222,
					'erbai'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					3333,
					'sanbai',
					i+1
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update cust1 set id_new=20171121 where id<200
			/
			commit
			/
			delete from cust1 where  id>350
			/
			commit
			/	
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/						
						
			
case 2015 "UDT:数字类型 修改列属性  " 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa number,
			bb integer,
			cc BINARY_FLOAT,
			dd BINARY_DOUBLE,
			ff float
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			id_new number,
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					i+1,
					'atthebeginning',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 modify (val char(20))
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					i+1,
					'onehundreds',
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926)
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					2013,
					type1(123456,654321,3.1415926,3.1415926,3.1415926),
					i+1
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			update cust1 set no=20171121 where id<200
			/
			commit
			/
			delete from cust1 where  id>350
			/
			commit
			/	
        tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/								
			
case 2016  "UDT:日期与lob类型 增加单列 " 0
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa date,
			bb CLOB,
			cc NCLOB,
			dd BLOB
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'atthebeginning',
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (id_add int)
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					2222,
					'onehundreds',
					type1(sysdate,'clob','nclob','123456789'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					i+i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					i+i,
					20171122
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/

case 2017  "UDT:日期与lob类型 增加多列 " 0
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa date,
			bb CLOB,
			cc NCLOB,
			dd BLOB
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'atthebeginning',
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (id_add int,val_add char(20))
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					2222,
					'onehundreds',
					type1(sysdate,'clob','nclob','123456789'),
					i+i,
					'aaaaaaaaaa'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					i+i,
					'bbbbbbbbbb'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					i+i,
					'cccccccccc',
					20171122
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/			


case 2018  "UDT:日期与lob类型 删除单列 " 0
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa date,
			bb CLOB,
			cc NCLOB,
			dd BLOB
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'atthebeginning',
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop column no
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					'onehundreds',
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int,val_add char(20))
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					'threehundreds',
					type1(sysdate,'clob','nclob','123456789'),
					3333,
					'sansansan'
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					'sisisisisi'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/

case 2019  "UDT:日期与lob类型 删除多列 " 0
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa date,
			bb CLOB,
			cc NCLOB,
			dd BLOB
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'atthebeginning',
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (id_add int,val_add char(20))
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					i+i,
					'aaaaaaaaaa'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop column id_add
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					'bbbbbbbbbb'
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 401..500
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					'cccccccccc',
					20171122
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/		
			
			
case 2020  "UDT:日期与lob类型 修改单列属性 " 0
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object (
			aa date,
			bb CLOB,
			cc NCLOB,
			dd BLOB
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val varchar2(20),
			abc type1
			)
			/
			alter table cust1 modify (val char(20))
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					2222,
					'onehundreds',
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789')
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1(sysdate,'clob','nclob','123456789'),
					i+1
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/



case 2021  "UDT:RAW & LONG RAW类型 增加单列" 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object(
			bb raw(1000)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val char(10),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (id_add int)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg')),
					i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no_add int,val_add char(20))
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg')),
					i,
					i+1,
					'254665'
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 401..500
				loop
					insert into cust1 values(
					i,
					type1(rawtohex('abcdefg')),
					i,
					i+1,
					'254665'
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/			
			

case 2022  "UDT:RAW & LONG RAW类型 增加多列" 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object(
			bb raw(1000)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val char(10),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no_add int,val_add char(20))
			/
			begin
				for i in 101..200
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg')),
					i+1,
					'254665'
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(rawtohex('abcdefg')),
					i+1,
					'254665'
					);
				end loop;
				commit;
			end;
			/
			alter table cust1 add (id_add int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1(rawtohex('abcdefg')),
					i+1,
					'254665',
					i
					);
				end loop;
				commit;
			end;
			/
			commit
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/	


case 2023  "UDT:RAW & LONG RAW类型 删除单列" 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object(
			bb raw(1000)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val char(10),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop column no
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					'fantexi',
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no_add int,val_add char(20))
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					'yehuimei',
					type1(rawtohex('abcdefg')),
					i+1,
					'254665'
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/
	

			
case 2024  "UDT:RAW & LONG RAW类型 删除多列" 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object(
			bb raw(1000)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val char(10),
			abc type1
			)
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no_add int,val_add char(20))
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1(rawtohex('abcdefg')),
					i+1,
					'254665'
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/
			
			
			
			
case 2025  "UDT:RAW & LONG RAW类型 修改单列属性" 0
        src_sql:
			drop table cust1
			/
			drop type type1
			/
			CREATE OR REPLACE TYPE type1 as object(
			bb raw(1000)
			)
			/
			create table cust1(
			id number primary key,
			no int,
			val char(10),
			abc type1
			)
			/
			alter table cust1 modify (val varchar2(10))
			/
			begin
				for i in 1..100
				loop
					insert into cust1 values(
					i,
					1111,
					'jaychou',
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 drop (no,val)
			/
			begin
				for i in 201..300
				loop
					insert into cust1 values(
					i,
					type1(rawtohex('abcdefg'))
					);
				end loop;
				commit;
			end;
			/
			commit
			/
			alter table cust1 add (no int)
			/
			begin
				for i in 301..400
				loop
					insert into cust1 values(
					i,
					type1(rawtohex('abcdefg')),
					i+1
					);
				end loop;
				commit;
			end;
			/
		tgt_sql:
            select count(*) from cust1
			/
			select type_name from user_types
			/
			select RTRIM(TABLE_NAME)||','||RTRIM(COLUMN_NAME)||','||RTRIM(DATA_TYPE) from user_tab_cols 
			/









			
			