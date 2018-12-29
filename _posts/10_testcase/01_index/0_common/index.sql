 case 1 "准备进行索引操作：建表" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /

        tgt_sql:
            select count(*) from user_tables where table_name='DDS_TABLE_TEST'
            /


 case 2 "INDEX: 建立普通索引" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
        
        tgt_sql:
            select index_name||pct_free||ini_trans||max_trans||initial_extent||min_extents||max_extents from user_indexes where index_name='TEST_A1_IDX'   
            /

 case 3 "INDEX: 普通索引改名" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            alter index test_a1_idx rename to test_a1_index
            /
        
        tgt_sql:
            select count(*) from user_indexes where index_name='TEST_A1_INDEX'
            /

 case 4 "INDEX: 重建普通索引" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            alter index test_a1_idx rename to test_a1_index
            /
            alter index test_a1_index rebuild tablespace users
            /
        
        tgt_sql:         
            select tablespace_name from user_indexes where index_name='TEST_A1_INDEX'
            / 

 case 5 "INDEX: 普通索引删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
             /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            alter index test_a1_idx rename to test_a1_index
            /
            alter index test_a1_index rebuild tablespace users
            /
            drop index test_a1_index
            /
     
        tgt_sql:
            select count(*) from user_indexes where index_name='TEST_A1_INDEX'
            /            

 case 6 "INDEX: 唯一索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
             /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index dds_tab_idx2 on dds_table_test ( a1, a2, a3 )
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='DDS_TAB_IDX2'
            /
            select uniqueness from user_indexes where table_name='DDS_TABLE_TEST' and index_name='DDS_TAB_IDX2'
            /
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='DDS_TAB_IDX2'
            /
            select column_name from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='DDS_TAB_IDX2' and column_position=1
            /             
            select column_name from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='DDS_TAB_IDX2' and column_position=3
            /            

 case 7 "INDEX: 唯一索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index dds_tab_idx2 on dds_table_test ( a1, a2, a3 )
            /
            drop index dds_tab_idx2
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='DDS_TAB_IDX2'
            /             

 case 8 "INDEX: 升序索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx3" on dds_table_test ( a1 asc, a2, a3 asc )
            /
    
        tgt_sql:
            select count(*) from user_indexes where index_name='test_a1_idx'
            /        
            select count(*) from user_indexes where index_name='dds_tab_idx3'
            /
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx3'
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx3' and column_position=1
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx3' and column_position=2
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx3' and column_position=3
            /          

 case 9 "INDEX: 升序索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
             /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx3" on dds_table_test ( a1 asc, a2, a3 asc )
            /
            drop index "dds_tab_idx3"
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='test_a1_idx3'
            /    

 case 10 "INDEX: 降序索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx4" on dds_table_test ( a1 desc, a2, a3 desc )
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='test_a1_idx'
            /        
            select count(*) from user_indexes where index_name='dds_tab_idx4'
            /
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx4'
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx4' and column_position=1
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx4' and column_position=2
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx4' and column_position=3
            / 
            
 case 11 "INDEX: 降序索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx4" on dds_table_test ( a1 desc, a2, a3 desc )
            /
            drop index "dds_tab_idx4"
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx4'
            /
            
 case 12 "INDEX: BITMAP索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create bitmap index "dds_tab_idx5" on dds_table_test ( a1 desc, a2, a3 desc )
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='test_a1_idx'
            /        
            select count(*) from user_indexes where index_name='dds_tab_idx5'
            /
            select index_type from user_indexes where index_name='dds_tab_idx5'
            /            
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx4'
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5' and column_position=1
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5' and column_position=2
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5' and column_position=3
            / 

 case 13 "INDEX: BITMAP索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create bitmap index "dds_tab_idx5" on dds_table_test ( a1 desc, a2, a3 desc )
            /
            drop index "dds_tab_idx5"
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx5'
            /

 case 14 "INDEX: 函数索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
             /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx5" on dds_table_test ( a1*2, upper(a2), lower(a5), a3 desc )
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx5'
            /
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5'
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5' and column_position=1
            /
            select default$ from sys.user$ u, sys.obj$ o, sys.col$ c where o.owner# = userenv('SCHEMAID') and u.user#=o.owner# and o.name='DDS_TABLE_TEST' and o.type#=2 and c.name='SYS_NC00006$' and o.obj#=c.obj#
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5' and column_position=2
            /
            select default$ from sys.user$ u, sys.obj$ o, sys.col$ c where o.owner# = userenv('SCHEMAID') and u.user#=o.owner# and o.name='DDS_TABLE_TEST' and o.type#=2 and c.name='SYS_NC00007$' and o.obj#=c.obj#
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5' and column_position=3
            /
            select default$ from sys.user$ u, sys.obj$ o, sys.col$ c where o.owner# = userenv('SCHEMAID') and u.user#=o.owner# and o.name='DDS_TABLE_TEST' and o.type#=2 and c.name='SYS_NC00008$' and o.obj#=c.obj#
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx5' and column_position=4
            /
            select default$ from sys.user$ u, sys.obj$ o, sys.col$ c where o.owner# = userenv('SCHEMAID') and u.user#=o.owner# and o.name='DDS_TABLE_TEST' and o.type#=2 and c.name='SYS_NC00009$' and o.obj#=c.obj#
            /            

 case 15 "INDEX: 函数索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx5" on dds_table_test ( a1*2, upper(a2), lower(a5), a3 desc )
            /
            drop index "dds_tab_idx5"
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx5'
            /

 case 16 "INDEX: LOGGING索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx6" on dds_table_test ( a1, a2, a3 desc ) logging
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx6'
            /
            select logging from user_indexes where index_name='dds_tab_idx6'
            /
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx6'
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx6' and column_position=1
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx6' and column_position=2
            /
            select column_name||','||descend from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx6' and column_position=3
            /

 case 17 "INDEX: LOGGING索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx6" on dds_table_test ( a1, a2, a3 desc ) logging
            /
            drop index "dds_tab_idx6"
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx6'
            /            


 case 18 "INDEX: NOLOGGING索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx7" on dds_table_test ( a1, a2 ) nologging
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx7'
            /
            select logging from user_indexes where index_name='dds_tab_idx7'
            /
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx7'
            /
            select column_name from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx7' and column_position=1
            /

 case 19 "INDEX: NOLOGGING索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx7" on dds_table_test ( a1, a2 ) nologging
            /
            drop index "dds_tab_idx7"
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx7'
            /
 case 20 "INDEX: 反向索引：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx8" on dds_table_test ( a1, a2 ) reverse
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx8'
            /
            select bitand(i.property,4) from sys.obj$ o, sys.ind$ i where o.owner#=userenv('SCHEMAID') and o.name='dds_tab_idx8' and o.type#=1 and o.obj#=i.obj#
            /
            select count(*) from user_ind_columns where table_name='DDS_TABLE_TEST' and index_name='dds_tab_idx8'
            /
            
 case 21 "INDEX: 反向索引：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx8" on dds_table_test ( a1, a2 ) reverse
            /
            drop index "dds_tab_idx8"
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx8'
            /            

 case 22 "INDEX: 索引：指定 PCTFREE 参数：建立" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx9" on dds_table_test ( a1, a2 ) pctfree 49
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx9'
            /
            select pct_free from user_indexes where index_name='dds_tab_idx9'
            /           

 case 23 "INDEX: 索引：指定 PCTFREE 参数：删除" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx9" on dds_table_test ( a1, a2 ) pctfree 49
            /
            drop index "dds_tab_idx9"
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx9'
            /            

 case 24 "INDEX: 索引：指定 initrans, maxtrans 参数：建立" 0
        src_sql:
            drop index "dds_tab_idx10"
            /
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /

        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx10'
            /
            select ini_trans||','||max_trans from user_indexes where index_name='dds_tab_idx10'
            /            

 case 25 "INDEX: 索引：修改参数：parallel" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
             /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            alter index "dds_tab_idx10" parallel 5
            /

        tgt_sql:
            select degree from user_indexes where index_name='dds_tab_idx10'
            /            

 case 26 "INDEX: 索引：修改参数：initrans" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            alter index "dds_tab_idx10" initrans 5
            /

        tgt_sql:
            select ini_trans from user_indexes where index_name='dds_tab_idx10'
            /            

 case 27 "INDEX: 索引：修改参数：nologging" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            alter index "dds_tab_idx10" nologging
            /
            
        tgt_sql:
            select logging from user_indexes where index_name='dds_tab_idx10'
            /

 case 28 "INDEX: 索引：修改参数：logging" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            alter index "dds_tab_idx10" nologging
            /
            alter index "dds_tab_idx10" logging
            /
            
        tgt_sql:
            select logging from user_indexes where index_name='dds_tab_idx10'
            /

 case 29 "INDEX: 索引：修改压缩：compress" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            alter index "dds_tab_idx10" rebuild compress
            /
            
        tgt_sql:
            select compression from user_indexes where index_name='dds_tab_idx10'
            /            


 case 30 "INDEX: 索引：修改压缩：nocompress" 0
        src_sql:
            drop table dds_table_test
            /
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            alter index "dds_tab_idx10" rebuild compress
            /
            alter index "dds_tab_idx10" rebuild nocompress
            /
            
        tgt_sql:
            select compression from user_indexes where index_name='dds_tab_idx10'
            /            


 case 31 "INDEX: 索引：以 REVERSE 反向方式 REBUILD" 0
        src_sql:
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            alter index "dds_tab_idx10" rebuild reverse
            /
            
        tgt_sql:
            select bitand(i.property,4) from sys.obj$ o, sys.ind$ i where o.owner#=userenv('SCHEMAID') and o.name='dds_tab_idx10' and o.type#=1 and o.obj#=i.obj#
            /

 case 32 "INDEX: 索引：指定 initrans, maxtrans 参数：删除" 0
        src_sql:
            create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
                pctfree 10 initrans 8 maxtrans 255
                storage ( initial 10M minextents 1 maxextents unlimited )
            /
            create index test_a1_idx on dds_table_test(a1)
            tablespace users
            pctfree 10
            initrans 10
            maxtrans 255
            storage
            (
              initial 10M
              minextents 1
              maxextents unlimited
            )
            /
            create unique index "dds_tab_idx10" on dds_table_test ( a1, a2 ) initrans 6 maxtrans 30
            /
            drop index "dds_tab_idx10"
            /
            
        tgt_sql:
            select count(*) from user_indexes where index_name='dds_tab_idx10'
            /           
