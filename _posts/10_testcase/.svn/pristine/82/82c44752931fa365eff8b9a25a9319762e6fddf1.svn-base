 case 300 "组合表(范围+范围): 建表" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE order by order_id
/


 case 301 "组合表(范围+范围模板): 增加分区" 0
 drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
alter table OBJECT_TYPE add partition p_2007 values less than (to_date('30-APR-2007','dd-MON-yyyy'))
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-APR-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from OBJECT_TYPE partition(p_2007)
/
select * from OBJECT_TYPE order by order_id
/


 case 302 "组合表(范围+范围): 删除分区" 0
 drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE drop partition p_2006_nov
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE order by order_id
/


  case 303 "组合表(范围+范围): 增加子分区" 0
   drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  )
)
/
alter table OBJECT_TYPE modify partition p_2006_dec add subpartition p06_view values LESS THAN(MAXVALUE)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE subpartition(p06_view)
/
select * from OBJECT_TYPE order by order_id
/


 case 304 "组合表(范围+范围): 删除子分区" 0
   drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-MAR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE drop subpartition p06_dec_a 
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE order by order_id
/

 
 case 305 "组合表(范围+范围): 分区改名" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('11-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE rename partition p_2006_dec to p_2006_december
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE partition(p_2006_december)
/
select * from OBJECT_TYPE order by order_id
/

 case 306 "组合表(范围+范围): 子分区改名" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('11-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('11-MAR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE rename subpartition  p06_dec_e to p06_dec_eee
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE subpartition(p06_dec_eee)
/
select * from OBJECT_TYPE order by order_id
/


 case 307 "组合表(范围+范围): 合并分区(不重用分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('01-AUG-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge partitions p_2006_nov, p_2006_dec into partition p1112
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
		  
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from OBJECT_TYPE partition(p1112)
/
select * from OBJECT_TYPE order by order_id
/

 case 308 "组合表(范围+范围): 分裂分区(不重用分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('01-AUG-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge partitions p_2006_nov, p_2006_dec into partition p1112
/
alter table OBJECT_TYPE split partition p1112 at (TO_DATE('01-DEC-2006','dd-MON-yyyy')) into ( partition p_2006_nove, partition p_2006_dece )
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from OBJECT_TYPE order by order_id
/


case 309 "组合表(范围+范围): 合并分区(重用分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('01-AUG-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge partitions p_2006_nov, p_2006_dec into partition p_2006_dec
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
		  
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE partition(p_2006_dec)
/
select * from OBJECT_TYPE order by order_id
/

 case 310 "组合表(范围+范围): 分裂分区(重用分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('01-AUG-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge partitions p_2006_nov, p_2006_dec into partition p_2006_dec
/
alter table OBJECT_TYPE split partition p_2006_dec at (TO_DATE('01-DEC-2006','dd-MON-yyyy')) into ( partition p_2006_nov, partition p_2006_dec )
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/

tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from OBJECT_TYPE order by order_id
/

case 311 "组合表(范围+范围): 合并子分区(不重用子分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-JUNE-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge subpartitions p06_jul_e, p06_jul_a into subpartition p11
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
		  
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from OBJECT_TYPE subpartition(p11)
/
select * from OBJECT_TYPE order by order_id
/


case 312 "组合表(范围+范围): 分裂子分区(不重用子分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-JUNE-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge subpartitions p06_jul_e, p06_jul_a into subpartition p11
/
alter table OBJECT_TYPE split subpartition p11 at (TO_DATE('15-AUG-2006','dd-MON-yyyy')) into ( subpartition p11_1,subpartition p11_2 )
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
		  
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name
/
select * from OBJECT_TYPE subpartition(p11_1)
/
select * from OBJECT_TYPE subpartition(p11_2)
/
select * from OBJECT_TYPE order by order_id
/

case 313 "组合表(范围+范围): 合并子分区(重用子分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-JUNE-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge subpartitions p06_jul_e, p06_jul_a into subpartition p06_jul_a
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
		  
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE subpartition(p06_jul_a)
/
select * from OBJECT_TYPE order by order_id
/


case 314 "组合表(范围+范围): 分裂子分区(重用子分区名)" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-JUNE-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE merge subpartitions p06_jul_e, p06_jul_a into subpartition p06_jul_a
/
alter table OBJECT_TYPE split subpartition p06_jul_a at (TO_DATE('15-AUG-2006','dd-MON-yyyy')) into ( subpartition p06_july_e,subpartition p06_july_a )
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
		  
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE subpartition(p06_july_e)
/
select * from OBJECT_TYPE subpartition(p06_july_a)
/
select * from OBJECT_TYPE order by order_id
/


 case 315 "组合表(范围+范围): 交换分区" 0
drop table OBJECT_TYPE purge
/
drop table swap_t purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
CREATE TABLE swap_t
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (delivery_date)
  ( 
	PARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , PARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , PARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-JAN-2006','dd-MON-yyyy'),+i),
		add_months(to_date('01-JULY-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
insert into swap_t values(11,to_date('16-JUNE-2006','dd-MON-yyyy'),to_date('11-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into swap_t values(12,to_date('16-JULY-2006','dd-MON-yyyy'),to_date('22-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into swap_t values(13,to_date('16-MAY-2006','dd-MON-yyyy'),to_date('25-SEP-2006','dd-MON-yyyy'),666,666)
/
commit
/
alter table OBJECT_TYPE exchange partition p_2006_jul with table swap_t 
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
update swap_t set sales_amount=67890
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('OBJECT_TYPE','SWAP_T') order by table_name,constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name in('OBJECT_TYPE','SWAP_T') order by table_name
/
select table_name,partition_name,high_value from user_tab_partitions where table_name in('OBJECT_TYPE','SWAP_T') order by table_name,partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE order by order_id
/
select * from swap_t order by order_id
/

 case 316 "组合表(范围+范围): 交换子分区" 0
drop table OBJECT_TYPE purge
/
drop table swap_t purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
CREATE TABLE swap_t
( order_id      NUMBER primary key
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-JAN-2006','dd-MON-yyyy'),+i),
		add_months(to_date('16-JUNE-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
insert into swap_t values(11,to_date('16-JUNE-2006','dd-MON-yyyy'),to_date('20-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into swap_t values(12,to_date('16-JULY-2006','dd-MON-yyyy'),to_date('22-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into swap_t values(13,to_date('16-MAY-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
commit
/
alter table OBJECT_TYPE exchange subpartition p06_jul_a with table swap_t
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
update swap_t set sales_amount=67890
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name in('OBJECT_TYPE','SWAP_T') order by table_name,constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE order by order_id
/
select * from swap_t order by order_id
/


case 317 "组合表(范围+范围): truncate分区" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
, constraint pk_rr primary key(order_id)
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE truncate partition p_2006_jul
/
alter index pk_rr rebuild
/
insert into OBJECT_TYPE values(11,to_date('16-JUNE-2006','dd-MON-yyyy'),to_date('20-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(12,to_date('16-JULY-2006','dd-MON-yyyy'),to_date('22-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(13,to_date('16-MAY-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(14,to_date('16-AUG-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE partition(p_2006_jul)
/
select * from OBJECT_TYPE order by order_id
/



case 318 "组合表(范围+范围): truncate子分区" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
, constraint pk_rr primary key(order_id)
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE truncate subpartition p06_jul_e
/
alter index pk_rr rebuild
/
insert into OBJECT_TYPE values(11,to_date('16-JUNE-2006','dd-MON-yyyy'),to_date('11-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(12,to_date('16-JULY-2006','dd-MON-yyyy'),to_date('12-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(13,to_date('16-MAY-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(14,to_date('16-AUG-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE subpartition(p06_jul_e)
/
select * from OBJECT_TYPE order by order_id
/


case 319 "组合表(范围+范围): 移动子分区（相同表空间）" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
, constraint pk_rr primary key(order_id)
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE move subpartition p06_jul_e
/
alter index pk_rr rebuild
/
insert into OBJECT_TYPE values(11,to_date('16-JUNE-2006','dd-MON-yyyy'),to_date('11-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(12,to_date('16-JULY-2006','dd-MON-yyyy'),to_date('12-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(13,to_date('16-MAY-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(14,to_date('16-AUG-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE subpartition(p06_jul_e)
/
select * from OBJECT_TYPE order by order_id
/


case 320 "组合表(范围+范围): 移动子分区（不同表空间）" 0
drop table OBJECT_TYPE purge
/
CREATE TABLE OBJECT_TYPE
( order_id      NUMBER
, order_date    DATE NOT NULL
, delivery_date DATE NOT NULL
, customer_id   NUMBER NOT NULL
, sales_amount  NUMBER NOT NULL
, constraint pk_rr primary key(order_id)
)
PARTITION BY RANGE (order_date)
SUBPARTITION BY RANGE (delivery_date)
( PARTITION p_2006_jul VALUES LESS THAN (TO_DATE('01-AUG-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_jul_e VALUES LESS THAN (TO_DATE('15-AUG-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_a VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_jul_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_aug VALUES LESS THAN (TO_DATE('01-SEP-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_aug_e VALUES LESS THAN (TO_DATE('15-SEP-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_a VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_aug_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_sep VALUES LESS THAN (TO_DATE('01-OCT-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_sep_e VALUES LESS THAN (TO_DATE('15-OCT-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_a VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_sep_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_oct VALUES LESS THAN (TO_DATE('01-NOV-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_oct_e VALUES LESS THAN (TO_DATE('15-NOV-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_a VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_oct_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_nov VALUES LESS THAN (TO_DATE('01-DEC-2006','dd-MON-yyyy'))
  ( SUBPARTITION p06_nov_e VALUES LESS THAN (TO_DATE('15-DEC-2006','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_a VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_nov_l VALUES LESS THAN (MAXVALUE)
  )
, PARTITION p_2006_dec VALUES LESS THAN (TO_DATE('01-JAN-2007','dd-MON-yyyy'))
  ( SUBPARTITION p06_dec_e VALUES LESS THAN (TO_DATE('15-JAN-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_a VALUES LESS THAN (TO_DATE('01-FEB-2007','dd-MON-yyyy'))
  , SUBPARTITION p06_dec_l VALUES LESS THAN (MAXVALUE)
  )
)
/
begin
	for i in 1..10
	loop
		insert into OBJECT_TYPE values(
		i,
		add_months(to_date('01-FEB-2006','dd-MON-yyyy'),+i),
		add_months(to_date('21-APR-2006','dd-MON-yyyy'),+i),
		233,
		i+233
		);
	end loop;
	commit;
end;
/
alter table OBJECT_TYPE move subpartition p06_jul_e tablespace system
/
alter index pk_rr rebuild
/
insert into OBJECT_TYPE values(11,to_date('16-JUNE-2006','dd-MON-yyyy'),to_date('11-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(12,to_date('16-JULY-2006','dd-MON-yyyy'),to_date('12-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(13,to_date('16-MAY-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
insert into OBJECT_TYPE values(14,to_date('16-AUG-2006','dd-MON-yyyy'),to_date('25-AUG-2006','dd-MON-yyyy'),666,666)
/
update OBJECT_TYPE set sales_amount=12345
/
commit
/
tgt_sql:
select table_name,constraint_type,status,deferrable,validated from user_constraints where table_name='OBJECT_TYPE' order by constraint_type
/
select table_name,partitioning_type,partition_count from user_part_tables where table_name='OBJECT_TYPE'
/
select table_name,partition_name,high_value from user_tab_partitions where table_name='OBJECT_TYPE' order by partition_name
/
select partition_name,subpartition_name,tablespace_name,high_value from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from OBJECT_TYPE subpartition(p06_jul_e)
/
select * from OBJECT_TYPE order by order_id
/


