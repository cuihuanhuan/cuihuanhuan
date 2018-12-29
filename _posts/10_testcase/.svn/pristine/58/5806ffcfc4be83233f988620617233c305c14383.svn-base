
--stop queue
exec dbms_aqadm.stop_queue('JAY.NOTEQ');

--drop queue and queue table
exec dbms_aqadm.drop_queue('JAY.NOTEQ');
exec dbms_aqadm.drop_queue_table('JAY.NOTETAB')

-- Create Type
create or replace type note as Object(
 subject varchar2(100),
 Content varchar2(2000),CreateTime date
);
/

-- Create queue table
begin
    sys.dbms_aqadm.create_queue_table(
    queue_table => 'NOTETAB',
    queue_payload_type => 'NOTE');
end;
/

--create queue
begin
    sys.dbms_aqadm.create_queue(
    queue_name => 'NOTEQ',
    queue_table => 'NOTETAB',
    queue_type => sys.dbms_aqadm.normal_queue,
    max_retries => 5,
    retry_delay => 0,
    retention_time => 0);
end;
/

--start queue
exec dbms_aqadm.start_queue('JAY.NOTEQ',true,true);

--enqueue
declare
v_Message note;
v_MsgId RAW(16);
v_options DBMS_AQ.ENQUEUE_OPTIONS_T;
v_properties DBMS_AQ.MESSAGE_PROPERTIES_T;
v_Recipients  DBMS_AQ.AQ$_RECIPIENT_LIST_T;
begin
     v_Message:=note(subject => 'note3',Content => 'content3',createTime => sysdate);

--     v_Recipients(0) := sys.aq$_agent('NOTE','MTQ',0);
--     v_properties.recipient_list := v_Recipients;
     v_options.visibility :=DBMS_AQ.IMMEDIATE;
     dbms_aq.enqueue(queue_name => 'noteq',enqueue_options => v_options,message_properties => v_properties,payload => v_Message,msgid => v_MsgId);
     dbms_output.put_line('encode success,msgid is '||v_MsgId);

end;
/

--dequeue
declare
v_Message note;
v_MsgId RAW(16);
v_options DBMS_AQ.DEQUEUE_OPTIONS_T;
v_properties DBMS_AQ.MESSAGE_PROPERTIES_T;
v_Recipients  DBMS_AQ.AQ$_RECIPIENT_LIST_T;
begin

--     v_Recipients(0) := sys.aq$_agent('NOTE','MTQ',0);
--     v_properties.recipient_list := v_Recipients;
     v_options.visibility :=DBMS_AQ.IMMEDIATE;
     dbms_aq.dequeue(queue_name => 'noteq',dequeue_options => v_options,message_properties => v_properties,payload => v_Message,msgid => v_MsgId);
     dbms_output.put_line('decode success,msgid is '||v_MsgId);
     dbms_output.put_line('subject is '||v_Message.subject);
     dbms_output.put_line('Content is '||v_Message.Content);
     dbms_output.put_line('createTime is '||to_char(v_Message.createTime,'yyyy-mm-dd hh24:mi:ss'));
end;
/


tgt.sql:
SELECT OBJECT_TYPE||' , '|| OBJECT_NAME||' , '||STATUS FROM USER_OBJECTS WHERE OBJECT_TYPE = 'QUEUE' 
/
SELECT user_data FROM AQ$NOTETAB
/
SELECT user_data FROM NOTETAB
/
