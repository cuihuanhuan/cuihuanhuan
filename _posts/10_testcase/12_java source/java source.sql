case 1 "创建 java source" 0
src_sql:
 drop  java source sayhi
 /
 create or replace and compile java source named sayhi
AS
public class sayhello
{
 public static void msg(String name)
 {
  System.out.println("hello,"+name);
 }
}
/

tgt_sql:
select object_name,object_type,status from user_objects where object_name='SAYHI'
/

case 2 "创建 java 的procedure" 0
src_sql:
 drop  java source sayhi
 /
 drop  procedure prc_sayhi
 /
 create or replace and compile java source named sayhi
AS
public class sayhello
{
 public static void msg(String name)
 {
  System.out.println("hello,"+name);
 }
}
/
create or replace procedure prc_sayhi
(
       p_name VARCHAR2
)
as
language java name 'sayhello.msg(java.lang.String)';
/

tgt_sql:
select object_name,object_type,status from user_objects where object_name in('SAYHI','PRC_SAYHI') order by object_name
/


case 3 "调用 java " 0
src_sql:
 drop  java source sayhi
 /
 drop  procedure prc_sayhi
 /
 create or replace and compile java source named sayhi
AS
public class sayhello
{
 public static void msg(String name)
 {
  System.out.println("hello,"+name);
 }
}
/
create or replace procedure prc_sayhi
(
       p_name VARCHAR2
)
as
language java name 'sayhello.msg(java.lang.String)';
/
set serveroutput on size 2000
/
exec dbms_java.set_output(2000)
/
call prc_sayhi('lily')
/

tgt_sql:
select object_name,object_type,status from user_objects where object_name in('SAYHI','PRC_SAYHI') order by object_name
/