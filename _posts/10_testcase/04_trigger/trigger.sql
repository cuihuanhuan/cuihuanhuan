case 1 "BEFORE INSERT触发器: 建表" 0
      src_sql:
		  drop trigger trigger_user1
		  /
		  drop table usertr purge
          /
          create table usertr ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 before insert  on usertr
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001,'You can not access to modify this table.'); 
               end if; 
          end;
          /

      tgt_sql:
          select count(*) from user_tables where table_name='USERTR'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='TRIGGER_USER1'
          /
          
 case 2 "BEFORE INSERT触发器: 删除触发器" 0
      src_sql:
		  drop trigger trigger_user1
		  /
          drop table usertr purge
          /
          create table usertr ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 before insert  on usertr
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001,'You can not access to modify this table.'); 
               end if; 
          end;
          /
		  drop trigger trigger_user1
		  /
          drop table usertr purge
          /
		  
      tgt_sql:
          select count(*) from user_tables where table_name='USERTR'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          
case 3 "BEFORE INSERT FOR EACH ROW触发器: 建表" 0
      src_sql:
		  drop trigger "test_log_trig1"
		  /
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /

      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 4 "BEFORE INSERT FOR EACH ROW触发器: 删除触发器" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /

      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /

 case 5 "BEFORE INSERT FOR EACH ROW触发器: 字段改名" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" rename column id to dds_id
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='ID'
          /
          select count(*) from col where tname='test_log' and cname='DDS_ID'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 6 "BEFORE INSERT FOR EACH ROW触发器: 字段改类型" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" modify ( name varchar2(23) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select coltype||','||width from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 7 "BEFORE INSERT FOR EACH ROW触发器: 字段增加" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" add ( age number(2) )
          /
          
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /

 case 8 "BEFORE INSERT FOR EACH ROW触发器: 字段删除(Trigger中没有使用的字段)" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20),age number )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( age )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 9 "BEFORE INSERT FOR EACH ROW触发器: 字段删除Trigger中已经使用的字段" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( name )
          /
          
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
case 10 "AFTER  INSERT 触发器: 建表" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 AFTER  insert  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /

      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='TRIGGER_USER1'
          / 
          
 case 11 "AFTER  INSERT 触发器: 删除触发器" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 AFTER  insert  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /
          drop table "usertr" purge
          /

      tgt_sql:
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          

 case 12 "AFTER INSERT FOR EACH ROW触发器: 删除触发器" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" after insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /

 case 13 "AFTER INSERT FOR EACH ROW触发器: 建表" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" after insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /

      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 14 "AFTER INSERT FOR EACH ROW触发器: 字段改名" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" after insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" rename column id to dds_id
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='ID'
          /
          select count(*) from col where tname='test_log' and cname='DDS_ID'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 15 "AFTER INSERT FOR EACH ROW触发器: 字段改类型" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" after insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" modify ( name varchar2(23) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select coltype||','||width from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 16 "AFTER INSERT FOR EACH ROW触发器: 字段增加" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" after insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" add ( age number(2) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 17 "AFTER INSERT FOR EACH ROW触发器: 字段删除(Trigger中没有使用的字段)" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20),age number )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" after insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( age )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 18 "AFTER INSERT FOR EACH ROW触发器: 字段删除Trigger中已经使用的字段" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" after insert on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( name )
          /
          
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
case 19 "BEFORE UPDATE 触发器: 建表" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 BEFORE UPDATE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /

      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='TRIGGER_USER1'
          / 
          
 case 20 "BEFORE UPDATE 触发器: 删除触发器" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 BEFORE UPDATE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /
          drop table "usertr" purge
          /
          
      tgt_sql:
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          
 case 21 "BEFORE UPDATE FOR EACH ROW触发器: 删除触发器" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before update on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /

      tgt_sql:
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 22 "BEFORE UPDATE FOR EACH ROW触发器: 建表" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before update on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /

      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 23 "before update FOR EACH ROW触发器: 字段改名" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before update on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" rename column id to dds_id
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='ID'
          /
          select count(*) from col where tname='test_log' and cname='DDS_ID'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 24 "before update FOR EACH ROW触发器: 字段改类型" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before update on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" modify ( name varchar2(23) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select coltype||','||width from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 25 "BEFORE UPDATE FOR EACH ROW触发器: 字段增加" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before update on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" add ( age number(2) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 26 "BEFORE UPDATE FOR EACH ROW触发器: 字段删除(Trigger中没有使用的字段)" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20),age number )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before update on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( age )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 27 "BEFORE UPDATE FOR EACH ROW触发器: 字段删除Trigger中已经使用的字段" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" before update on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( name )
          /
          
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
case 28 "AFTER UPDATE 触发器: 建表" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 AFTER UPDATE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /

      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='TRIGGER_USER1'
          / 
          
 case 29 "AFTER UPDATE 触发器: 删除触发器" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 AFTER UPDATE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /
          drop table "usertr" purge
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /

 case 30 "AFTER UPDATE FOR EACH ROW触发器: 删除触发器" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER UPDATE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /

      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 31 "AFTER UPDATE FOR EACH ROW触发器: 建表" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER UPDATE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /

      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 32 "AFTER UPDATE FOR EACH ROW触发器: 字段改名" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER UPDATE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" rename column id to dds_id
          /
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='ID'
          /
          select count(*) from col where tname='test_log' and cname='DDS_ID'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 

 case 33 "AFTER UPDATE FOR EACH ROW触发器: 字段改类型" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER UPDATE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" modify ( name varchar2(23) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select coltype||','||width from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 34 "AFTER UPDATE FOR EACH ROW触发器: 字段增加" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER UPDATE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" add ( age number(2) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 35 "AFTER UPDATE FOR EACH ROW触发器: 字段删除(Trigger中没有使用的字段)" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20),age number )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER UPDATE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( age )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 36 "AFTER UPDATE FOR EACH ROW触发器: 字段删除Trigger中已经使用的字段" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER UPDATE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( name )
          /
          
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
case 37 "BEFORE DELETE 触发器: 建表" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 BEFORE DELETE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /

      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='TRIGGER_USER1'
          / 
          
 case 38 "BEFORE DELETE 触发器: 删除触发器" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 BEFORE DELETE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /
          drop table "usertr" purge
          /
      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /

 case 39 "BEFORE DELETE FOR EACH ROW触发器: 删除触发器" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" BEFORE DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /

 case 40 "BEFORE DELETE FOR EACH ROW触发器: 建表" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" BEFORE DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_tables where table_name='test_log1'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 

 case 41 "BEFORE DELETE FOR EACH ROW触发器: 字段改名" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" BEFORE DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" rename column id to dds_id
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='ID'
          /
          select count(*) from col where tname='test_log' and cname='DDS_ID'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 42 "BEFORE DELETE FOR EACH ROW触发器: 字段改类型" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" BEFORE DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" modify ( name varchar2(23) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select coltype||','||width from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 43 "BEFORE DELETE FOR EACH ROW触发器: 字段增加" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" BEFORE DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" add ( age number(2) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 44 "BEFORE DELETE FOR EACH ROW触发器: 字段删除(Trigger中没有使用的字段)" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20),age number )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" BEFORE DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( age )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
 case 45 "BEFORE DELETE FOR EACH ROW触发器: 字段删除Trigger中已经使用的字段" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" BEFORE DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( name )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='NAME'
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
case 46 "AFTER DELETE 触发器: 建表" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 AFTER DELETE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /

      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='TRIGGER_USER1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='TRIGGER_USER1'
          / 
          
 case 47 "AFTER DELETE 触发器: 删除触发器" 0
      src_sql:
          drop table "usertr" purge
          /
          create table "usertr" ( id int, name varchar2(20) )
          /
          create trigger trigger_user1 AFTER DELETE  on "usertr"
          begin 
               if user not in ('sys') then 
               Raise_application_error(-20001, 'You can not access to modify this table.'); 
               end if; 
          end;
          /
          drop table "usertr" purge
          /

      tgt_sql:
          select count(*) from user_tables where table_name='usertr'
          /
          select count(*) from user_triggers where trigger_name='TRIGGER_USER1'
          /

case 48 "AFTER DELETE FOR EACH ROW触发器: 建表" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /

      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          / 
          
          
 case 49 "AFTER DELETE FOR EACH ROW触发器: 删除触发器" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          
      tgt_sql:
          select count(*) from user_tables where table_name in('test_log','test_log1')
          /
          select count(*) from user_triggers where trigger_name='test_log_trig1'
          /


 case 50 "AFTER DELETE FOR EACH ROW触发器: 字段改名" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" rename column id to dds_id
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='ID'
          /
          select count(*) from col where tname='test_log' and cname='DDS_ID'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 51 "AFTER DELETE FOR EACH ROW触发器: 字段改类型" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" modify ( name varchar2(23) )
          /
          
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select coltype||','||width from col where tname='test_log' and cname='NAME'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /

 case 52 "AFTER DELETE FOR EACH ROW触发器: 字段增加" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" add ( age number(2) )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 53 "AFTER DELETE FOR EACH ROW触发器: 字段删除(Trigger中没有使用的字段)" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20),age number)
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( age )
          /

      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='AGE'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /
          
 case 54 "AFTER DELETE FOR EACH ROW触发器: 字段删除Trigger中已经使用的字段" 0
      src_sql:
          drop table "test_log" purge
          /
          drop table "test_log1" purge
          /
          create table "test_log" ( id int, name varchar2(20) )
          /
          create table "test_log1" ( id int, name varchar2(20) )
          /
          create or replace trigger "test_log_trig1" AFTER DELETE on "test_log"
          for each row
          begin
                 insert into "test_log1" (id, name) values ( :new.id, :new.name );
                 null;
          end log_trig1;
          /
          alter table "test_log" drop ( name )
          /
          
      tgt_sql:
          select count(*) from col where tname='test_log'
          /
          select count(*) from col where tname='test_log' and cname='NAME'
          /
          select triggering_event||','||table_name||','||when_clause from user_triggers where trigger_name='test_log_trig1'
          /
          select 'A,'||action_type||',A' from user_triggers where trigger_name='test_log_trig1'
          /