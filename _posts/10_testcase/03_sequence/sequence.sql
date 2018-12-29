 case 1 "SEQUENCE: 建立" 0
        src_sql:
            drop sequence dds_test_seq
            /
            drop sequence dds_test_seq2
            /
            create sequence dds_test_seq
                   start with 100
                   minvalue -1000
                   maxvalue 500000
                   cache 5
                   noorder cycle
            /
            create sequence dds_test_seq2
            /

        tgt_sql:
            select count(*) from user_sequences where sequence_name=upper('dds_test_seq')
            /
            select count(*) from user_sequences where sequence_name=upper('dds_test_seq2')
            /
            select min_value||','||max_value from user_sequences where sequence_name='DDS_TEST_SEQ'
            /
            select min_value||','||max_value from user_sequences where sequence_name='DDS_TEST_SEQ2'
            /
            select increment_by||','||last_number from user_sequences where sequence_name='DDS_TEST_SEQ'
            /
            select increment_by||','||last_number from user_sequences where sequence_name='DDS_TEST_SEQ2'
            /
            select cycle_flag||','||order_flag||','||cache_size from user_sequences where sequence_name='DDS_TEST_SEQ'
            /
            select cycle_flag||','||order_flag||','||cache_size from user_sequences where sequence_name='DDS_TEST_SEQ2'
            /

 case 2 "SEQUENCE: 进行 SELECT 操作" 0
        src_sql:
            drop sequence dds_test_seq
            /
            drop sequence dds_test_seq2
            /
            create sequence dds_test_seq
                   start with 100
                   minvalue -1000
                   maxvalue 500000
                   cache 5
                   noorder cycle
            /
            create sequence dds_test_seq2
            /
            select dds_test_seq.nextval from dual
            /
            select dds_test_seq2.nextval from dual
            /
        
        tgt_sql:
            select to_char(last_number) from user_sequences where sequence_name='DDS_TEST_SEQ'
            /
            select to_char(last_number) from user_sequences where sequence_name='DDS_TEST_SEQ2'
            /
            

 case 3 "SEQUENCE: 更改各个参数 incrment_by, cache, nocycle, order" 0
        src_sql:
            drop sequence dds_test_seq
            /
            drop sequence dds_test_seq2
            /
            create sequence dds_test_seq
                   start with 100
                   minvalue -1000
                   maxvalue 500000
                   cache 5
                   noorder cycle
            /
            create sequence dds_test_seq2
            /
            alter sequence dds_test_seq increment by 11 nocache nocycle order
            /
            alter sequence dds_test_seq2 increment by 11 nocache nocycle order
            /

        tgt_sql:
            select min_value||','||max_value||','||increment_by||','||cycle_flag||','||order_flag||','||cache_size from user_sequences where sequence_name='DDS_TEST_SEQ'
            /
			select min_value||','||max_value||','||increment_by||','||cycle_flag||','||order_flag||','||cache_size from user_sequences where sequence_name='DDS_TEST_SEQ2'
            /

 case 4 "SEQUENCE: 更改各个参数 incrment_by, cache, cycle, noorder" 0
        src_sql:
            drop sequence dds_test_seq
            /
            create sequence dds_test_seq
                   start with 100
                   minvalue -1000
                   maxvalue 500000
                   cache 5
                   noorder cycle
            /
            select dds_test_seq.nextval from dual
            /
            alter sequence dds_test_seq increment by 11 nocache nocycle order
            /
            select dds_test_seq.nextval from dual
            /
            alter sequence dds_test_seq increment by -1009 cache 41 cycle noorder
            /
            select dds_test_seq.nextval from dual
            /
            
        tgt_sql:
            select min_value||','||max_value||','||increment_by||','||cycle_flag||','||order_flag||','||cache_size from user_sequences where sequence_name='DDS_TEST_SEQ'
            /

 case 5 "SEQUENCE: 进行 SELECT 操作( increment < 0 ) " 0
        src_sql:
            drop sequence dds_test_seq
            /
            create sequence dds_test_seq
                   start with 100
                   increment by -1
                   minvalue -1000
                   maxvalue 500000
                   cache 5
                   noorder cycle
            /
            select dds_test_seq.nextval from dual
            /
            alter sequence dds_test_seq increment by 11 nocache nocycle order
            /
            select dds_test_seq.nextval from dual
            /
            alter sequence dds_test_seq increment by -1009 cache 41 cycle noorder
            /
            select dds_test_seq.nextval from dual
            /
            select dds_test_seq.nextval from dual
            /

        tgt_sql:
            select to_char(last_number) from user_sequences where sequence_name='DDS_TEST_SEQ'
            /           

 case 6 "SEQUENCE: 进行 SELECT 操作( increment > 0 ) " 0
        src_sql:
            drop sequence dds_test_seq
            /
            create sequence dds_test_seq
                   start with 100
                   minvalue -1000
                   maxvalue 500000
                   cache 5
                   noorder cycle
            /
            select dds_test_seq.nextval from dual
            /
            alter sequence dds_test_seq increment by 11 nocache nocycle order
            /
            select dds_test_seq.nextval from dual
            /
            alter sequence dds_test_seq increment by -1009 cache 41 cycle noorder
            /
            select dds_test_seq.nextval from dual
            /
            alter sequence dds_test_seq increment by 108 nocache cycle noorder
            /
            select dds_test_seq.nextval from dual
            /
            
        tgt_sql:
            select to_char(last_number) from user_sequences where sequence_name='DDS_TEST_SEQ'
            /
            select increment_by||','||last_number from user_sequences where sequence_name='DDS_TEST_SEQ'
            /
            select cycle_flag||','||order_flag||','||cache_size from user_sequences where sequence_name='DDS_TEST_SEQ'
            /


 case 7 "SEQUENCE: 删除" 0
        src_sql:
            drop sequence dds_test_seq
            /
            drop sequence dds_test_seq2
            /
            create sequence dds_test_seq
                   start with 100
                   minvalue -1000
                   maxvalue 500000
                   cache 5
                   noorder cycle
            /
            create sequence dds_test_seq2
            /
            drop sequence dds_test_seq
            /
            drop sequence dds_test_seq2
            /
        tgt_sql:
            select count(*) from user_sequences where sequence_name=upper('dds_test_seq')
            /
            select count(*) from user_sequences where sequence_name=upper('dds_test_seq2')
            /

