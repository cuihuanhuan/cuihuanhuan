 case 111 "组合表(范围+列表模板): 建表(指定子分区模板)" 0
      src_sql:
        drop table object_type purge
        /
        create table object_type ( oid NUMBER primary key, onum number,otype VARCHAR2(19), created DATE )
        partition by range ( created )
        subpartition by list (otype)
        subpartition template (
				subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
        )(
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
          )
          /
		begin	
			for i in 1..20
			loop
				insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
			end loop;
			commit;
		end;
		/
		UPDATE object_type set onum=onum+100
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

 case 112 "组合表(范围+列表模板): 增加分区" 0
      src_sql:
        drop table object_type purge
        /
        create table object_type ( oid NUMBER primary key, onum number,otype VARCHAR2(19), created DATE )
        partition by range ( created )
        subpartition by list (otype)
        subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
        )(
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
         )
        /
		alter table object_type add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD'))
        /
		begin	
			for i in 1..30
			loop
				insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
			end loop;
			commit;
		end;
		/
		insert into object_type values(31,31,'VIEW',to_date('2006-10-01','YYYY-MM-DD'))
		/
		insert into object_type values(32,32,'INDEX',to_date('2006-11-01','YYYY-MM-DD'))
		/
		UPDATE object_type set onum=onum+10000
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
select * from object_type partition(p4) order by oid
/

 case 113 "组合表(范围+列表模板): 删除分区" 0
      src_sql:
        drop table object_type purge
        /
        create table object_type ( oid NUMBER,onum number,otype VARCHAR2(19), created DATE,constraint pk_rl primary key(oid))
        partition by range ( created )
        subpartition by list (otype)
        subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
        )(
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
         )
		/
		begin	
			for i in 1..20
			loop
				insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
			end loop;
			commit;
		end;
		/
		insert into object_type values(21,21,'VIEW',to_date('2003-10-01','YYYY-MM-DD'))
		/
		insert into object_type values(22,22,'INDEX',to_date('2003-11-01','YYYY-MM-DD'))
		/
		commit
		/
        alter table object_type drop partition P2
        /
		alter index pk_rl rebuild
		/
		UPDATE object_type set onum=onum+50000
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


 case 114 "组合表(范围+列表模板): 修改子分区模板" 0
      src_sql:
        drop table object_type purge
        /
        create table object_type ( oid NUMBER primary key,onum number, otype VARCHAR2(19), created DATE )
        partition by range ( created )
        subpartition by list (otype)
        subpartition template (
                subpartition sub_table VALUES ('TABLE' )  tablespace users,
                subpartition sub_index VALUES ('INDEX' )  tablespace system,
                subpartition sub_other VALUES (DEFAULT )  tablespace users
        )(
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD')),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
         )
        /
        alter table object_type set subpartition template (
                subpartition sub_view  values('VIEW' ) tablespace system,
                subpartition sub_index values('INDEX') tablespace users,
                subpartition sub_table values('TABLE') tablespace system,
                subpartition sub_other values(DEFAULT) tablespace users
        )
        /
		alter table object_type add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD'))
        /
		begin	
			for i in 1..30
			loop
				insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
			end loop;
			commit;
		end;
		/
		insert into object_type values(31,31,'VIEW',to_date('2006-10-01','YYYY-MM-DD'))
		/
		insert into object_type values(32,32,'INDEX',to_date('2006-11-01','YYYY-MM-DD'))
		/
		insert into object_type values(33,33,'HA',to_date('2006-12-01','YYYY-MM-DD'))
		/
		UPDATE object_type set onum=onum+30000
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
select * from object_type partition(p4) order by oid
/

 case 115 "组合表(范围+列表): 建表" 0
      src_sql:
        drop table object_type purge
        /
        create table object_type ( oid number primary key,onum number, otype varchar2(19), created date )
        partition by range ( created )
        subpartition by list (otype) (
            partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')  ),
            partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT)  ),
            partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT)  )
        )
        /
		begin	
			for i in 1..20
			loop
				insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
			end loop;
			commit;
		end;
		/
		UPDATE object_type set onum=onum+30000
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


 case 116 "组合表(范围+列表): 增加分区" 0
      src_sql:
        drop table object_type purge
        /
        create table object_type ( oid number primary key,onum number, otype varchar2(19), created date )
        partition by range ( created )
        subpartition by list (otype) (
            partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
                ( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')  ),
            partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT)  ),
            partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT)  )
        )
        /
		begin	
			for i in 1..25
			loop
				insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
			end loop;
			commit;
		end;
		/
		insert into object_type values(26,26,'INDEX',to_date('2001-11-01','YYYY-MM-DD'))
		/
		insert into object_type values(27,27,'INDEX',to_date('2003-10-01','YYYY-MM-DD'))
		/
		insert into object_type values(28,28,'HAHA',to_date('2003-11-01','YYYY-MM-DD'))
		/
		insert into object_type values(29,29,'INDEX',to_date('2004-10-01','YYYY-MM-DD'))
		/
		insert into object_type values(30,30,'HAHA',to_date('2004-11-01','YYYY-MM-DD'))
		/
		commit
		/
		alter table object_type add partition P4 values less than (to_date('2006-12-31','YYYY-MM-DD')) (
            subpartition p4_table1 values ('TABLE'),
            subpartition p4_index1 values ('INDEX'),
            subpartition p4_view1  values ('VIEW')
        )
        /
		insert into object_type values(31,31,'TABLE',to_date('2006-10-01','YYYY-MM-DD'))
		/
		insert into object_type values(32,32,'VIEW',to_date('2006-12-01','YYYY-MM-DD'))
		/
		insert into object_type values(33,33,'INDEX',to_date('2006-11-01','YYYY-MM-DD'))
		/
		UPDATE object_type set onum=onum+30000
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
select * from object_type partition(p4) order by oid
/


 case 117 "组合表(范围+列表): 增加子分区" 0
      src_sql:
            drop table object_type purge
            /
			create table object_type ( oid number primary key,onum number, otype varchar2(19), created date )
			partition by range ( created )
			subpartition by list (otype) (
            partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
                ( subpartition p1_table values ('TABLE'),
				  subpartition p1_index values ('INDEX')  ),
            partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT)  ),
            partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT)  )
            )
			/
			begin	
				for i in 1..20
				loop
					insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
				end loop;
				commit;
			end;
			/
			insert into object_type values(21,21,'INDEX',to_date('2002-10-01','YYYY-MM-DD'))
			/
			insert into object_type values(22,22,'INDEX',to_date('2003-10-01','YYYY-MM-DD'))
			/
			insert into object_type values(23,23,'HAHA',to_date('2003-11-01','YYYY-MM-DD'))
			/
			insert into object_type values(24,24,'INDEX',to_date('2004-10-01','YYYY-MM-DD'))
			/
			insert into object_type values(25,25,'HAHA',to_date('2004-11-01','YYYY-MM-DD'))
			/
			commit
			/
            alter table object_type modify partition p1 add subpartition p1_view values ('VIEW')
            /
			insert into object_type values(26,26,'VIEW',to_date('2002-11-01','YYYY-MM-DD'))
			/
			insert into object_type values(27,27,'VIEW',to_date('2001-11-01','YYYY-MM-DD'))
			/
			UPDATE object_type set onum=onum+30000
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
select * from object_type subpartition(p1_view) order by oid
/


 case 118 "组合表(范围+列表): 删除分区" 0
      src_sql:
            drop table object_type purge
            /
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid))
			partition by range ( created )
			subpartition by list (otype) (
            partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
                ( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')  ),
            partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT)  ),
            partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT)  )
			)
			/
			begin	
				for i in 1..20
				loop
					insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
				end loop;
				commit;
			end;
			/
			insert into object_type values(21,21,'INDEX',to_date('2003-10-01','YYYY-MM-DD'))
			/
			insert into object_type values(22,22,'VIEW',to_date('2003-11-01','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type drop partition p2
			/
			alter index pk_rl rebuild
			/
			UPDATE object_type set onum=onum+50000
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


 case 119 "组合表(范围+列表): 删除子分区" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid))
			partition by range ( created )
			subpartition by list (otype) (
            partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')  ),
            partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT)  ),
            partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT)  )
			)
			/
			begin	
				for i in 1..20
				loop
					insert into object_type values(i,i,'TABLE',add_months(to_date('2002-10-01','YYYY-MM-DD'),+i));
				end loop;
				commit;
			end;
			/
			insert into object_type values(21,21,'INDEX',to_date('2002-10-01','YYYY-MM-DD'))
			/
			insert into object_type values(22,22,'INDEX',to_date('2002-09-01','YYYY-MM-DD'))
			/
			insert into object_type values(23,23,'INDEX',to_date('2003-10-01','YYYY-MM-DD'))
			/
			insert into object_type values(24,24,'VIEW',to_date('2003-09-01','YYYY-MM-DD'))
			/
			insert into object_type values(25,25,'INDEX',to_date('2004-10-01','YYYY-MM-DD'))
			/
			insert into object_type values(26,26,'VIEW',to_date('2004-09-01','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type drop subpartition p1_table
			/
			alter index pk_rl rebuild
			/
			UPDATE object_type set onum=onum+50000
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

 case 120 "组合表(范围+列表): 交换分区" 0
      src_sql:
			drop table swap_t purge
			/
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid))
			partition by range ( created )
			subpartition by list (otype) (
            partition p1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')  ),
            partition p2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT)  ),
            partition p3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT)  )
			)
			/
			create table swap_t ( oid number primary key,onum number, otype varchar2(19), created date )
			partition by list ( otype ) (
                partition type_table values ('TABLE'),
                partition type_index values ('INDEX')
			)
			/
			insert into object_type values ( 1, 1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3, 3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 12,12, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			insert into swap_t select oid+1000,onum+1000,otype, created from object_type partition (p1)
			/
			insert into swap_t select oid+2000,onum+2000, otype, created from object_type partition (p1)
			/
			commit
			/
			alter table object_type exchange partition p1 with table swap_t
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
			/
			update swap_t set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type partition(p1) order by oid
/
select * from swap_t order by oid
/

 case 121 "组合表(范围+列表): 交换子分区" 0
      src_sql:
			drop table swap_t purge
			/
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid))
			partition by range ( created ) subpartition by list (otype) (
				partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
				  subpartition p1_index values ('INDEX')),
				partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
				partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			create table swap_t ( oid number, onum number,otype varchar2(19), created date ,constraint pks primary key(oid))
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 12,12, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			insert into swap_t select oid+1000,onum+1000,otype, created from object_type subpartition ( p1_table )
			/
			insert into swap_t select oid+2000,onum+2000, otype, created from object_type subpartition ( p1_table )
			/
			commit
			/
			alter table object_type exchange subpartition p1_table with table swap_t
			/
			alter index pk_rl rebuild
			/
			alter index pks rebuild
			/
			update object_type set onum=onum+30000
			/
			update swap_t set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type subpartition(p1_table) order by oid
/
select * from swap_t order by oid
/

 case 122 "组合表(范围+列表): 合并分区(2个分区均有数据)" 0
      src_sql:
			drop table swap_t purge
			/
			drop table object_type purge
			/
			create table object_type ( oid number,onum number,otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 12,12, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p12
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
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
select * from object_type order by oid
/
select * from object_type partition(p12) order by oid
/


 case 123 "组合表(范围+列表): SPLIT分区(2个分区均有数据)" 0
 src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date ,constraint pk_rl primary key(oid))
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
                ( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 12,12, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p12
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
			/
			commit
			/
			alter table object_type
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p121, partition p122 )
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type partition(p121) order by oid
/
select * from object_type partition(p122) order by oid
/

 case 124 "组合表(范围+列表): 合并分区(第一个分区有数据,分区名称重用)：建表" 0
      src_sql:
			drop table swap_t purge
			/
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			update object_type set onum=onum+50000
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

 case 125 "组合表(范围+列表): 合并分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p2
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
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
select * from object_type partition(p2) order by oid
/


 case 126 "组合表(范围+列表): SPLIT分区(第一个分区有数据,分区名称重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p2
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
			/
			commit
			/
			alter table object_type
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
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
select * from object_type partition(p1) order by oid
/

 case 127 "组合表(范围+列表): 合并分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p12
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type partition(p12) order by oid
/

 case 128 "组合表(范围+列表): SPLIT分区(第一个分区有数据,分区名称不重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
                ( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2000-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2000-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2001-01-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2001-01-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2002-01-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2002-01-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p12
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
			/
			commit
			/
			alter table object_type
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p121, partition p122 )
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
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
select * from object_type order by oid
/
select * from object_type partition(p121) order by oid
/

 case 129 "组合表(范围+列表): 合并分区(第2个分区有数据,分区名称重用):建表" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number primary key,onum number,otype varchar2(19), created date )
			partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2003-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2003-04-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2003-05-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-06-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2003-07-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2003-08-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			update object_type set onum=onum+30000
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

 case 130 "组合表(范围+列表): 合并分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
	   			  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2003-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2003-04-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2003-05-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-06-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2003-07-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2003-08-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p2
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
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
select * from object_type partition(p2) order by oid
/

 case 131 "组合表(范围+列表): SPLIT分区(第2个分区有数据,分区名称重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
	   			  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2003-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2003-04-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2003-05-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-06-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2003-07-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2003-08-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p2
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
			/
			alter table object_type
                split partition p2 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p1, partition p2 )
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
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
select count(*) from object_type partition(p1)
/
select * from object_type partition(p2) order by oid
/

 case 132 "组合表(范围+列表): 合并分区(第2个分区有数据,分区名称不重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
	   			  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2003-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2003-04-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2003-05-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-06-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2003-07-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2003-08-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p12
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
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
select * from object_type order by oid
/
select * from object_type partition(p12) order by oid
/

 case 133 "组合表(范围+列表): SPLIT分区(第2个分区有数据,分区名称不重用)" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
	   			  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2003-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2003-04-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3,'TABLE', TO_DATE('2003-05-23','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-06-24','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'TABLE', TO_DATE('2003-07-25','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'INDEX', TO_DATE('2003-08-26','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type merge partitions p1, p2 into partition p12
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+30000
			/
			commit
			/
			alter table object_type
                split partition p12 at (to_date('2002-12-31','YYYY-MM-DD')) into ( partition p121, partition p122 )
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
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
select * from object_type order by oid
/
select count(*) from object_type partition(p121)
/
select * from object_type partition(p122) order by oid
/


 case 134 "组合表(范围+列表): 操作子分区键值: 增加" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number,otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type modify subpartition p1_index add values ('VIEW' )
			/
			alter index pk_rl rebuild
			/
			insert into object_type values ( 9,9, 'VIEW', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'VIEW', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			update object_type set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type subpartition(p1_index) order by oid
/


 case 135 "组合表(范围+列表): 操作子分区键值: 删除" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX','VIEW')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'VIEW', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'VIEW', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			delete from object_type where oid>8
			/
			commit
			/
			alter table object_type modify subpartition p1_index drop values ('VIEW' )
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type subpartition(p1_index) order by oid
/


 case 136 "组合表(范围+列表): 分区改名" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number primary key,onum number,otype varchar2(19), created date )
			partition by range ( created ) subpartition by list (otype) (
             partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
             partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
             partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type rename partition p3 to p3_3
			/
			insert into object_type values ( 9,9, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			update object_type set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type partition(p3_3) order by oid
/

 case 137 "组合表(范围+列表): 子分区改名" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number primary key,onum number,otype varchar2(19), created date )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type rename subpartition p2_table to p2_tab
			/
			insert into object_type values ( 9,9, 'TABLE', TO_DATE('2003-04-27','YYYY-MM-DD'))
			/
			update object_type set onum=onum+50000
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
select * from object_type order by oid
/
select * from object_type subpartition(p2_tab) order by oid
/


 case 138 "组合表(范围+列表): 分区 TRUNCATE" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number, onum number,otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
			partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type truncate partition p2
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
			/
			insert into object_type values ( 9,9, 'TABLE', TO_DATE('2003-06-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 10,10, 'INDEX', TO_DATE('2003-06-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'HAHA', TO_DATE('2003-06-28','YYYY-MM-DD'))
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
select * from object_type order by oid
/
select * from object_type partition(p2) order by oid
/


 case 139 "组合表(范围+列表): 子分区 TRUNCATE" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'TABLE', TO_DATE('2003-06-27','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type truncate subpartition p2_table
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
			/
			insert into object_type values ( 10,10, 'TABLE', TO_DATE('2003-06-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'TABLE', TO_DATE('2003-06-28','YYYY-MM-DD'))
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
select * from object_type order by oid
/
select * from object_type subpartition(p2_table) order by oid
/

case 140 "组合表(范围+列表): 移动子分区（相同表空间）" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'TABLE', TO_DATE('2003-06-27','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type move subpartition p2_table
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
			/
			insert into object_type values ( 10,10, 'TABLE', TO_DATE('2003-06-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'TABLE', TO_DATE('2003-06-28','YYYY-MM-DD'))
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
select * from object_type order by oid
/
select * from object_type subpartition(p2_table) order by oid
/

case 141 "组合表(范围+列表): 移动子分区（不同表空间）" 0
      src_sql:
			drop table object_type purge
			/
			create table object_type ( oid number,onum number, otype varchar2(19), created date,constraint pk_rl primary key(oid) )
			partition by range ( created ) subpartition by list (otype) (
            partition P1 values less than (to_date('2002-12-31','YYYY-MM-DD'))
				( subpartition p1_table values ('TABLE'),
                  subpartition p1_index values ('INDEX')),
            partition P2 values less than (to_date('2003-12-31','YYYY-MM-DD'))
				( subpartition p2_table values ('TABLE'),
                  subpartition p2_index values ('INDEX'),
                  subpartition p2_other values (DEFAULT) ),
            partition P3 values less than (to_date('2004-12-31','YYYY-MM-DD'))
				( subpartition p3_table values ('TABLE'),
                  subpartition p3_index values ('INDEX'),
                  subpartition p3_other values (DEFAULT) )
			)
			/
			insert into object_type values ( 1,1,'TABLE', TO_DATE('2001-01-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 2,2, 'INDEX', TO_DATE('2002-01-22','YYYY-MM-DD'))
			/
			insert into object_type values ( 3,3, 'TABLE', TO_DATE('2003-01-27','YYYY-MM-DD'))
			/
			insert into object_type values ( 4,4, 'INDEX', TO_DATE('2003-01-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 5,5, 'HAHA', TO_DATE('2003-11-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 6,6, 'TABLE', TO_DATE('2004-01-29','YYYY-MM-DD'))
			/
			insert into object_type values ( 7,7, 'INDEX', TO_DATE('2004-02-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 8,8, 'HAHA', TO_DATE('2004-03-21','YYYY-MM-DD'))
			/
			insert into object_type values ( 9,9, 'TABLE', TO_DATE('2003-06-27','YYYY-MM-DD'))
			/
			commit
			/
			alter table object_type move subpartition p2_table tablespace system
			/
			alter index pk_rl rebuild
			/
			update object_type set onum=onum+50000
			/
			insert into object_type values ( 10,10, 'TABLE', TO_DATE('2003-06-28','YYYY-MM-DD'))
			/
			insert into object_type values ( 11,11, 'TABLE', TO_DATE('2003-06-28','YYYY-MM-DD'))
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
select * from object_type order by oid
/
select * from object_type subpartition(p2_table) order by oid
/