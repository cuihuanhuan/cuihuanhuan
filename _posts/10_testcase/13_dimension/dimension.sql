case 1 "创建 时间维度表" 0
drop table TIME_DIMENSION
/
create table TIME_DIMENSION
(
  the_date     NUMBER not null,
  date_name    NVARCHAR2(15),
  the_year     NUMBER,
  year_name    NVARCHAR2(10),
  the_quarter  VARCHAR2(10),
  quarter_name NVARCHAR2(10),
  the_month    NUMBER,
  month_name   NVARCHAR2(10),
  the_week     NUMBER,
  week_name    NVARCHAR2(10),
  week_day     NVARCHAR2(10)
)
tablespace users
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
/


case 2 "创建存储过程脚本" 0
drop table TIME_DIMENSION
/
create table TIME_DIMENSION
(
  the_date     NUMBER not null,
  date_name    NVARCHAR2(15),
  the_year     NUMBER,
  year_name    NVARCHAR2(10),
  the_quarter  VARCHAR2(10),
  quarter_name NVARCHAR2(10),
  the_month    NUMBER,
  month_name   NVARCHAR2(10),
  the_week     NUMBER,
  week_name    NVARCHAR2(10),
  week_day     NVARCHAR2(10)
)
tablespace users
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
/

CREATE OR REPLACE PROCEDURE SP_CREATE_TIME_DIMENSION(begin_date in varchar2,
                                                    end_date in varchar2) is
  /*SP_CREATE_TIME_DIMENSION: 生成时间维数据
  begin_date: 起始时间
  end_date:结束时间
  */
dDate date;
v_the_date number;
v_the_year varchar2(4);
v_the_quarter varchar2(2);
v_the_month varchar2(10);
v_the_month2 varchar2(2);
v_the_week varchar2(2);
v_the_day varchar2(10);
v_the_day2 varchar2(2);
v_week_day nvarchar2(10);
adddays int;

BEGIN
adddays := 1 ;
dDate := to_date(begin_date,'yyyymmdd');

WHILE (dDate <= to_date(end_date,'yyyymmdd'))
loop
   v_the_date := to_number(to_char(dDate,'yyyymmdd'));--key值
   v_the_year:= to_char(dDate, 'yyyy');--年
   v_the_quarter := to_char(dDate, 'q');--季度
   v_the_month:=to_char(dDate, 'mm');--月份(字符型)
   v_the_month2:=to_number(to_char(dDate, 'mm'));--月份(数字型)
   v_the_day:=to_char(dDate, 'dd');--日(字符型)
   v_the_day2:=to_char(dDate, 'dd');
   v_the_week:= to_char(dDate,'fmww');--年的第几周
   v_week_day := to_char(dDate, 'day'); --星期几

  insert into time_dimension(the_date,date_name,the_year,year_name,
                            the_quarter,quarter_name,the_month,
                            month_name,the_week,week_name,week_day)
                      values(v_the_date,v_the_year||'年'||v_the_month2||'月'||v_the_day2||'日',v_the_year,v_the_year||'年',
                            v_the_year||'Q'||v_the_quarter,v_the_year||'年'||v_the_quarter||'季度',to_number(v_the_year||v_the_month),
                            v_the_year||'年'||v_the_month2||'月',v_the_week,'第'||v_the_week||'周',
                            v_week_day);
   dDate :=  dDate + adddays;
   
END loop;
end SP_CREATE_TIME_DIMENSION;
/


case 3 "执行存储过程" 0
drop table TIME_DIMENSION
/
create table TIME_DIMENSION
(
  the_date     NUMBER not null,
  date_name    NVARCHAR2(15),
  the_year     NUMBER,
  year_name    NVARCHAR2(10),
  the_quarter  VARCHAR2(10),
  quarter_name NVARCHAR2(10),
  the_month    NUMBER,
  month_name   NVARCHAR2(10),
  the_week     NUMBER,
  week_name    NVARCHAR2(10),
  week_day     NVARCHAR2(10)
)
tablespace users
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
/

CREATE OR REPLACE PROCEDURE SP_CREATE_TIME_DIMENSION(begin_date in varchar2,
                                                    end_date in varchar2) is
  /*SP_CREATE_TIME_DIMENSION: 生成时间维数据
  begin_date: 起始时间
  end_date:结束时间
  */
dDate date;
v_the_date number;
v_the_year varchar2(4);
v_the_quarter varchar2(2);
v_the_month varchar2(10);
v_the_month2 varchar2(2);
v_the_week varchar2(2);
v_the_day varchar2(10);
v_the_day2 varchar2(2);
v_week_day nvarchar2(10);
adddays int;

BEGIN
adddays := 1 ;
dDate := to_date(begin_date,'yyyymmdd');

WHILE (dDate <= to_date(end_date,'yyyymmdd'))
loop
   v_the_date := to_number(to_char(dDate,'yyyymmdd'));--key值
   v_the_year:= to_char(dDate, 'yyyy');--年
   v_the_quarter := to_char(dDate, 'q');--季度
   v_the_month:=to_char(dDate, 'mm');--月份(字符型)
   v_the_month2:=to_number(to_char(dDate, 'mm'));--月份(数字型)
   v_the_day:=to_char(dDate, 'dd');--日(字符型)
   v_the_day2:=to_char(dDate, 'dd');
   v_the_week:= to_char(dDate,'fmww');--年的第几周
   v_week_day := to_char(dDate, 'day'); --星期几

  insert into time_dimension(the_date,date_name,the_year,year_name,
                            the_quarter,quarter_name,the_month,
                            month_name,the_week,week_name,week_day)
                      values(v_the_date,v_the_year||'年'||v_the_month2||'月'||v_the_day2||'日',v_the_year,v_the_year||'年',
                            v_the_year||'Q'||v_the_quarter,v_the_year||'年'||v_the_quarter||'季度',to_number(v_the_year||v_the_month),
                            v_the_year||'年'||v_the_month2||'月',v_the_week,'第'||v_the_week||'周',
                            v_week_day);
   dDate :=  dDate + adddays;
   
END loop;
end SP_CREATE_TIME_DIMENSION;
/
call SP_CREATE_TIME_DIMENSION(20050101,20141231)
/
commit
/
