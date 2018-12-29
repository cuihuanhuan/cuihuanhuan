 case 100 "建立依赖于type的表后,删除重建同名不同属性的type表" 0
        src_sql:
            drop table udtlob1 purge
            /
			drop type lobtype1
            /
            create type lobtype1 as object(
			f1 number,
			f2 varchar2(30),
			f3 clob
			);
			/
			create table udtlob1(f1 number primary key, f2 lobtype1)
			/
			insert into udtlob1 values (1, lobtype1(1, 'aaa', 'bbbbb'))
			/
			commit
			/
			
			drop table udtlob1 purge
            /
			drop type lobtype1
            /
            create type lobtype1 as object(
			b1 varchar2(30),
			b2 clob,
			b3 number
			);
			/
			create table udtlob1(f1 number primary key, f2 lobtype1)
			/
			insert into udtlob1 values (2, lobtype1('ssaa', 'xxvv',2))
			/
			commit
			/

        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('LOBTYPE1','UDTLOB1') order by object_name,object_type
            /
			select attr_name,attr_type_name from user_type_attrs where type_name='LOBTYPE1' order by attr_name
			/
            select * from udtlob1 order by f1
            /
			
			

 case 101 "建立依赖于type的表后,删除表且replace同名不同属性的type，然后创建type表" 0
        src_sql:
            drop table udtlob1 purge
            /
			drop type lobtype1
            /
            create type lobtype1 as object(
			f1 number,
			f2 varchar2(30),
			f3 clob
			);
			/
			create table udtlob1(f1 number primary key, f2 lobtype1)
			/
			insert into udtlob1 values (1, lobtype1(1, 'aaa', 'bbbbb'))
			/
			commit
			/
			
			drop table udtlob1 purge
            /
            create or replace type lobtype1 as object(
			b1 varchar2(30),
			b2 clob,
			b3 number
			);
			/
			create table udtlob1(f1 number primary key, f2 lobtype1)
			/
			insert into udtlob1 values (2, lobtype1('ssaa', 'xxvv',2))
			/
			commit
			/

        tgt_sql:
			select object_name,object_type,status from user_objects where object_name='LOBTYPE1' order by object_name,object_type
            /
			select attr_name,attr_type_name from user_type_attrs where type_name='LOBTYPE1' order by attr_name
			/
            select * from udtlob1 order by f1
            /
			
 case 102 "建立依赖于type的SYNONYMS后删除重建TYPE" 0
      src_sql:
            src_sql:
            drop synonym syn1
			/
			drop type type1
            /
            create type type1 as object(
			f1 number,
			f2 varchar2(30),
			f3 clob
			);
			/
            create synonym syn1 for type1
            /
			
			drop type type1
            /
            create type type1 as object(
			b1 varchar2(30),
			b2 clob,
			b3 number
			);
			/
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('TYPE1','SYN1') order by object_name,object_type
            /
			select attr_name,attr_type_name from user_type_attrs where type_name='TYPE1' order by attr_name
			/


 case 103 "建立依赖于type的SYNONYMS后删除重建TYPE,，然后编译SYNONYMS" 0
      src_sql:
            src_sql:
            drop synonym syn1
			/
			drop type type1
            /
            create type type1 as object(
			f1 number,
			f2 varchar2(30),
			f3 clob
			);
			/
            create synonym syn1 for type1
            /
			
			drop type type1
            /
            create type type1 as object(
			b1 varchar2(30),
			b2 clob,
			b3 number
			);
			/
			alter synonym syn1 compile
			/
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('SYN1') order by object_name,object_type
            /
			select attr_name,attr_type_name from user_type_attrs where type_name='TYPE1' order by attr_name
			/			
			
 case 104 "建立依赖于type的SYNONYMS后replace TYPE" 0
      src_sql:
            src_sql:
            drop synonym syn1
			/
			drop type type1
            /
            create type type1 as object(
			f1 number,
			f2 varchar2(30),
			f3 clob
			);
			/
            create synonym syn1 for type1
            /
			
            create or replace type type1 as object(
			b1 varchar2(30),
			b2 clob,
			b3 number
			);
			/
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('SYN1') order by object_name,object_type
            /
			select attr_name,attr_type_name from user_type_attrs where type_name='TYPE1' order by attr_name
			/
			
			
 case 105 "建立依赖于type的SYNONYMS后replace TYPE,然后编译SYNONYMS" 0
      src_sql:
            src_sql:
            drop synonym syn1
			/
			drop type type1
            /
            create type type1 as object(
			f1 number,
			f2 varchar2(30),
			f3 clob
			);
			/
            create synonym syn1 for type1
            /
			
            create or replace type type1 as object(
			b1 varchar2(30),
			b2 clob,
			b3 number
			);
			/
			alter synonym syn1 compile
			/
        tgt_sql:
            select object_name,object_type,status from user_objects where object_name in('SYN1') order by object_name,object_type
            /
			select attr_name,attr_type_name from user_type_attrs where type_name='TYPE1' order by attr_name
			/