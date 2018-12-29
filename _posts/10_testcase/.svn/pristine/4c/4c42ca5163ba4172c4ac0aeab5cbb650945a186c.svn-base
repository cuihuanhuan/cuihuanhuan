 case 100 "建立依赖于SEQUENCE的表,后重建sequence" 0
        src_sql:
			drop table seq_tab purge
			/
            drop sequence seq
            /
            create sequence seq start with 500 increment by 1 cache 5 noorder nocycle
            /
			create table seq_tab (f1 number,f2 varchar2(100))
			/
			insert into seq_tab values(seq.nextval,'aaa')
			/
			insert into seq_tab values(seq.nextval,'bbbb')
			/
			commit
			/
			
			drop sequence seq
            /
            create sequence seq start with 10 increment by 1 cache 5 noorder nocycle
            /
			insert into seq_tab values(seq.nextval,'aaa')
			/
			insert into seq_tab values(seq.nextval,'bbbb')
			/
			commit
			/
        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('SEQ','SEQ_TAB') order by object_name,object_type
            /
            select min_value,max_value,increment_by,cycle_flag,order_flag,cache_size from user_sequences where sequence_name='SEQ'
            /
			select * from seq_tab order by f1
			/
			

 case 101 "建立依赖于SEQUENCE的procedure后,重建sequence" 0
        src_sql:
			drop procedure seq_proc
			/
            drop sequence seq1
            /
            create sequence seq1 start with 500 increment by 1 cache 5 noorder nocycle
            /
			create or replace procedure seq_proc(pro_res1 out number)
            is
            begin
                 select seq1.nextval into pro_res1 from dual;
            end seq_proc;
            /
			
			drop sequence seq1
            /
            create sequence seq1 start with 10 increment by 1 cache 5 noorder nocycle
            /
			alter procedure seq_proc compile
			/
        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('SEQ1','SEQ_PROC') order by object_name,object_type
            /
            select min_value,max_value,increment_by,cycle_flag,order_flag,cache_size from user_sequences where sequence_name='SEQ1'
            /
			DECLARE
				pro_result number;
			BEGIN
				seq_proc(pro_result);
				DBMS_OUTPUT.PUT_LINE('seq1 current vaule is:'||pro_result);
			END;
			/
			
			
 case 102 "建立依赖于SEQUENCE的function后,重建sequence" 0
        src_sql:
			drop function seq_function
			/
            drop sequence seq2
            /
            create sequence seq2 start with 500 increment by 1 cache 5 noorder nocycle
            /
			create function seq_function return number
			is
				v_seq number;
			begin
				select seq2.nextval into v_seq from dual;
				return v_seq; 
			END;
			/
			
			drop sequence seq2
            /
            create sequence seq2 start with 10 increment by 1 cache 5 noorder nocycle
            /
			alter function seq_function compile
			/
        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('SEQ2','SEQ_FUNCTION') order by object_name,object_type
            /
            select min_value,max_value,increment_by,cycle_flag,order_flag,cache_size from user_sequences where sequence_name='SEQ2'
            /
			select seq_function from dual
            /
			
			
 case 103 "建立依赖于SEQUENCE的trigger后,重建sequence" 0
        src_sql:
			drop trigger seq_trigger
			/
			drop table seq_tab3 purge
			/
            drop sequence seq3
            /
            create sequence seq3 start with 500 increment by 1 cache 5 noorder nocycle
            /
            create table seq_tab3 ( f1 int, f2 varchar2(20) )
            /
            CREATE OR REPLACE TRIGGER seq_trigger
			BEFORE INSERT ON seq_tab3 FOR EACH ROW
			BEGIN
				SELECT seq3.nextval INTO :new.f1 FROM dual;
			END;
			/
			
			insert into seq_tab3(f2) values('aaaa')
			/
			commit
			/
			
			drop sequence seq3
            /
            create sequence seq3 start with 10 increment by 1 cache 5 noorder nocycle
            /
			alter trigger seq_trigger compile
			/
			
			insert into seq_tab3(f2) values('bbbbb')
			/
			commit
			/
        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('SEQ3','SEQ_TRIGGER') order by object_name,object_type
            /
            select min_value,max_value,increment_by,cycle_flag,order_flag,cache_size from user_sequences where sequence_name='SEQ3'
            /
			select * from seq_tab3 order by f1
			/
			
			
 case 104 "建立依赖于SEQUENCE的package后,重建sequence" 0
        src_sql:
			drop package seq_package
			/
            drop sequence seq4
            /
            create sequence seq4 start with 500 increment by 1 cache 5 noorder nocycle
            /
            create package seq_package as function pack_func return number;
            end seq_package;
            /
            create package body seq_package
            as
				function pack_func return number
                is
					v_seq number;
				begin
					select seq4.nextval into v_seq from dual;
					return v_seq; 
				END;
            end seq_package;
            /
			
			drop sequence seq4
            /
            create sequence seq4 start with 10 increment by 1 cache 5 noorder nocycle
            /
			alter package seq_package compile
			/

        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('SEQ4','SEQ_PACKAGE') order by object_name,object_type
            /
            select min_value,max_value,increment_by,cycle_flag,order_flag,cache_size from user_sequences where sequence_name='SEQ4'
            /
			select seq_package.pack_func from dual
            /
			
			
 case 105 "建立依赖于SEQUENCE的synonym后,重建sequence" 0
        src_sql:
			drop synonym seq_synonym
			/
            drop sequence seq5
            /
            create sequence seq5 start with 500 increment by 1 cache 5 noorder nocycle
            /
            create synonym seq_synonym for seq5
            /
			
			drop sequence seq5
            /
            create sequence seq5 start with 10 increment by 1 cache 5 noorder nocycle
            /
			alter synonym seq_synonym compile
			/
        tgt_sql:
			select object_name,object_type,status from user_objects where object_name in('SEQ5','SEQ_SYNONYM') order by object_name,object_type
            /
            select min_value,max_value,increment_by,cycle_flag,order_flag,cache_size from user_sequences where sequence_name='SEQ5'
            /