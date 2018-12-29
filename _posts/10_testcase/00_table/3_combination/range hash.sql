case 201 "组合表(范围+HASH:子分区模板): 建表" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( oid NUMBER primary key, otype VARCHAR2(19), created DATE )
           partition by range ( created )
           subpartition by hash (oid)
           subpartition template (
                 subpartition sub_table tablespace system,
                 subpartition sub_index TABLESPACE users,
                 subpartition sub_other TABLESPACE users
           )(
              partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
              partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
              partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
              partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
           )
           /
			begin	
				for i in 1..30
				loop
					insert into object_type values(
					i,
					'info2soft',
					add_months(to_date('2002-10-01','YYYY-MM-DD'),+i)
					);
				end loop;
				commit;
			end;
			/
			UPDATE object_type set otype='information2'
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from object_type order by oid
/

 
 case 202 "组合表(范围+HASH:子分区模板): 修改子分区模板 增加分区" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid NUMBER primary key, otype VARCHAR2(19), created DATE )
			partition by range ( created )
			subpartition by hash (oid)
			subpartition template (
				 subpartition sub_table tablespace system,
				 subpartition sub_index TABLESPACE users,
				 subpartition sub_other TABLESPACE users
			)(
			  partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
			  partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
			  partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
			  partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
			)
			/

			alter table object_type set subpartition template (
				subpartition sub_table tablespace users,
				subpartition sub_index tablespace system,
				subpartition sub_view  tablespace users,
				subpartition sub_other tablespace users
			)
			/
			alter table object_type add partition P5 values less than (to_date('2006-12-31','YYYY-MM-DD'))
			/
			begin	
				for i in 1..40
				loop
					insert into object_type values(
					i,
					'info2soft',
					add_months(to_date('2002-10-01','YYYY-MM-DD'),+i)
					);
				end loop;
				commit;
			end;
			/
			UPDATE object_type set otype='information2'
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from object_type order by oid
/


 case 203 "组合表(范围+HASH:子分区模板): 删除分区" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid NUMBER primary key, otype VARCHAR2(19), created DATE )
			partition by range ( created )
			subpartition by hash (oid)
			subpartition template (
				 subpartition sub_table tablespace system,
				 subpartition sub_index TABLESPACE users,
				 subpartition sub_other TABLESPACE users
			)(
			  partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
			  partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
			  partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD')),
			  partition P4 values less than (to_date('2005-12-31','YYYY-MM-DD'))
			)
			/
			begin	
				for i in 1..30
				loop
					insert into object_type values(
					i,
					'info2soft',
					add_months(to_date('2002-10-01','YYYY-MM-DD'),+i)
					);
				end loop;
				commit;
			end;
			/
			alter table object_type drop partition P3
			/
			UPDATE object_type set otype='information2'
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select * from object_type order by oid
/

 case 204 "组合表(范围+HASH): 建表" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
		  update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/


 case 205 "组合表(范围+HASH): 增加分区" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
		  insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          alter table object_type add partition p3 values less than ('ZZ') (
             subpartition p3_table1,
             subpartition p3_index1,
             subpartition p3_view1
          )
          /
		  insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where object_name>'WW' and object_name<'ZZ'
          /
		  update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

case 206 "组合表(范围+HASH): 删除分区" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 ),
			 partition p3 values less than ('SS')
               ( subpartition p3_sub1,
                 subpartition p3_sub2 )
          )
          /
		  insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'SS'
          /
		  commit
		  /
          alter table object_type drop partition p2
          /
		  update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

 case 207 "组合表(范围+HASH): 增加子分区" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          alter table object_type modify partition p1 add subpartition p1_sub3
          /
          update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/


 case 208 "组合表(范围+HASH): TRUNCATE 分区" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number, objd number, reccount int, nm varchar2(30),constraint pk_rh primary key(objn))
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          alter table object_type truncate partition p1
          /
		  alter index pk_rh rebuild
		  /
          insert into object_type select object_id, object_id+90000, object_id, object_name
                 from dba_objects where object_name<'HH' and rownum<100
          /
          update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

 case 209 "组合表(范围+HASH): TRUNCATE 子分区" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number, objd number, reccount int, nm varchar2(30),constraint pk_rh primary key(objn))
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table object_type truncate subpartition p2_sub1
          /
		  alter index pk_rh rebuild
		  /
          insert into object_type select object_id+900000, object_id+900000, object_id, object_name
                 from dba_objects where object_name<'MM' and rownum<150
          /
          update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

 case 210 "组合表(范围+HASH): 分区改名" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table object_type rename partition p2 to p2_2
          /
		  update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

 case 211 "组合表(范围+HASH): 子分区改名" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table object_type rename subpartition p2_sub1 to p2_sub_1
          /
		  update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/


 case 212 "组合表(范围+HASH): 移动子分区（相同表空间）" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table object_type move subpartition p2_sub1
          /
		  update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

 case 213 "组合表(范围+HASH): 移动子分区（不同表空间）" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm )
          subpartition by hash (objn)
          (
             partition p1 values less than ('HH')
               ( subpartition p1_sub1,
                 subpartition p1_sub2 ),
             partition p2 values less than ('MM')
               ( subpartition p2_sub1,
                 subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          alter table object_type move subpartition p2_sub1 tablespace system
          /
		  update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

 case 214 "组合表(范围+HASH): 合并分区(不重用分区名)" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          alter table object_type merge partitions p1, p2 into partition p12
          /
          update object_type set reccount=123456
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
select count(*) from object_type
/
select sum(reccount) from object_type
/


 case 215 "组合表(范围+HASH): 分裂分区(不重用分区名)" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          alter table object_type merge partitions p1, p2 into partition p12
          /
          update object_type set reccount=reccount+1
          /
		  commit
		  /
          alter table object_type split partition p12 at ('II') into ( partition p121, partition p122 )
          /
          update object_type set reccount=123456
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
select count(*) from object_type partition(p121)
/
select count(*) from object_type partition(p122)
/
select count(*) from object_type
/
select sum(reccount) from object_type
/

 case 216 "组合表(范围+HASH): 合并分区(重用第一个分区名称)" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          alter table object_type merge partitions p1, p2 into partition p2
          /
          update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/


 case 217 "组合表(范围+HASH): 分裂分区(重用第一个分区名称)" 0
      src_sql:
          drop table object_type purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
		  commit
		  /
          alter table object_type merge partitions p1, p2 into partition p2
          /
          update object_type set reccount=reccount+1
          /
		  commit
		  /
          alter table object_type split partition p2 at ('II') into ( partition p1, partition p2 )
          /
          update object_type set reccount=123456
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type partition(p1)
/
select count(*) from object_type partition(p2)
/
select count(*) from object_type
/
select sum(reccount) from object_type
/


 case 218 "组合表(范围+HASH): 交换分区：建表" 0
      src_sql:
          drop table object_type purge
          /
          drop table swap_t purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create table swap_t ( objn number  primary key, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+1234, objd+2345, reccount+3456, nm from object_type partition (p1)
          /
		  update object_type set reccount=123456
          /
		  update swap_t set reccount=67890
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
select sum(reccount) from object_type
/
select count(*) from swap_t
/
select sum(reccount) from swap_t
/


 case 219 "组合表(范围+HASH): 交换分区" 0
      src_sql:
          drop table object_type purge
          /
          drop table swap_t purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create table swap_t ( objn number primary key, objd number, reccount int, nm varchar2(30) )
             partition by hash ( objn ) ( partition swap_t_part1,
                                          partition swap_t_part2 )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn+50000, objd+2345, reccount+3456, nm from object_type partition (p1)
          /
		  commit
		  /
          alter table object_type exchange partition p1 with table swap_t
          /
          update object_type set reccount=123456
          /
		  update swap_t set reccount=67890
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
SELECT sum(reccount) FROM  object_type partition(p1)
/
select sum(reccount) from object_type
/
select count(*) from swap_t
/
select sum(reccount) from swap_t
/


 case 220 "组合表(范围+HASH): 交换子分区：建表" 0
      src_sql:
          drop table object_type purge
          /
          drop table swap_t purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create table swap_t ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+50000, reccount+3456, nm from object_type subpartition (p1_sub2)
          /
		  update object_type set reccount=123456
          /
		  update swap_t set reccount=67890
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
SELECT sum(reccount) FROM  object_type subpartition(p1_sub2)
/
select sum(reccount) from object_type
/
select count(*) from swap_t
/
select sum(reccount) from swap_t
/


 case 221 "组合表(范围+HASH): 交换子分区" 0
      src_sql:
          drop table object_type purge
          /
          drop table swap_t purge
          /
          create table object_type ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          partition by range ( nm ) subpartition by hash (objn) (
             partition p1 values less than ('HH') ( subpartition p1_sub1,
                                                    subpartition p1_sub2 ),
             partition p2 values less than ('MM') ( subpartition p2_sub1,
                                                    subpartition p2_sub2 )
          )
          /
          create table swap_t ( objn number primary key, objd number, reccount int, nm varchar2(30) )
          /
          insert into object_type
                 select object_id, object_id+1000, object_id, object_name from dba_objects
                 where rownum<2048 and object_name<'MM'
          /
          insert into swap_t select objn, objd+50000, reccount+3456, nm from object_type subpartition (p1_sub2)
          /
		  commit
		  /
          alter table object_type exchange subpartition p1_sub2 with table swap_t
          /
          update object_type set reccount=123456
          /
		  update swap_t set reccount=67890
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
select partition_name,subpartition_name,tablespace_name from user_tab_subpartitions where table_name='OBJECT_TYPE' order by partition_name,subpartition_name
/
select count(*) from object_type
/
SELECT sum(reccount) FROM  object_type subpartition(p1_sub2)
/
select sum(reccount) from object_type
/
select count(*) from swap_t
/
select sum(reccount) from swap_t
/