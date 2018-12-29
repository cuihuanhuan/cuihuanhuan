  case 1 "建表" 0
drop table check_table
/
create table check_table
(
  t_key       number not null,
  t_unique    number,
  t_notnull   varchar2(10),
  t_condition number
)
pctfree 10
initrans 8
maxtrans 255
storage (
initial 10M
minextents 1
maxextents unlimited )
/
        tgt_sql:
            select PCT_FREE||MAX_TRANS||INI_TRANS||INITIAL_EXTENT||MIN_EXTENTS||MAX_EXTENTS||tablespace_name from user_tables where table_name='CHECK_TABLE'
            /
            select count(*) from user_tab_cols where table_name='CHECK_TABLE'
            /
            select COLUMN_NAME||DATA_TYPE from user_tab_cols where table_name='CHECK_TABLE' 
            /
           

 case 2 "建表：删除同名对象后建表" 0
		src_sql:
			drop table t_0002
            /
            create procedure t_0002 is
            begin
                 null;
            end;
            /
            drop procedure t_0002
            /
            create table t_0002 ( f1 int, f2 varchar2(20) )
            /
        tgt_sql:
            select count(*) from user_tables where table_name='T_0002'
            /

 case 3 "建表：建表时指定完整性约束" 0
        src_sql:
             drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
        tgt_sql:
            select count(*) from user_tables where table_name in('T_0000','T_0002','T_0003','T_0004')
            /
            select nullable from user_tab_cols where table_name='T_0000' and column_name='CLASS_ID'
            /
            select count(*) from user_constraints where table_name in('T_0000','T_0002','T_0003','T_0004')
            /
            
            
 case 4 "建表:添加约束" 0
drop table check_table
            /
drop table check_table2
            /
create table check_table
(
  t_key       number not null,
  t_unique    number,
  t_notnull   varchar2(10),
  t_condition number
)
            /
create table check_table2
(
  t_key2       number not null PRIMARY KEY,
  t_unique2    number,
  t_notnull2   varchar2(10),
  t_condition2 number
)
            /
alter table check_table add constraint pk_check primary key (t_key)
            /
alter table check_table constraint con_check check(t_condition>20)
            /
alter table check_table add constraint unq_check unique(t_unique)
            /
alter table check_table add constraint not_check default info2soft for t_notnull
            /
alter table check_table add constraint fk_check foreign key (t_key) references check_table2 （t_key2）
            /
        tgt_sql:
            select table_name,status,index_name from user_constraints where constraint_name='UNQ_CHECK'
            /
            select table_name,status,index_name from user_constraints where constraint_name='PK_CHECK'
            /


    case 5 "主键：DISABLE" 0
        src_sql:
             drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 modify primary key disable
            /
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='PK_T4'
            /


    case 6 "主键：ENABLE" 0
        src_sql:
             drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 modify primary key enable
            /
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='UK_T4'
            /


    case 7 "唯一键：DISABLE" 0
        src_sql:
             drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
alter table t_0004 modify unique (email) disable
/
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='UK_T4'
            /
            
            
    case 8 "唯一键：ENABLE" 0
        src_sql:
             drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 modify unique (email) enable
            /
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='CHK_SAL_T4'
            /

            
            
    case 9 "检查键：DISABLE" 0
        src_sql:
             drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 modify constraint chk_sal_t4 disable
            /
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='CHK_SAL_T4'
            /
            
            
    case 10 "检查键：ENABLE" 0
        src_sql:
                         drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 modify constraint chk_sal_t4 enable
            /
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='CHK_SAL_T4'
            /

            
            
    case 11 "外键：DISABLE" 0
        src_sql:
                         drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 modify constraint fk_t4 disable
            /
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='FK_T4'
            /
  
            
    case 12 "外键：ENABLE" 0
        src_sql:
                         drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 modify constraint fk_t4 enable
            /
        tgt_sql:
            select status from user_constraints where table_name='T_0004' and constraint_name='FK_T4'
            /

            
            
    case 13 "主键：改名" 0
        src_sql:
                         drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 rename constraint pk_t4 to pk_t04
            /
        tgt_sql:
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='UK_T4'
            /
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='UK_T04'
            /


            
            
    case 14 "唯一键：改名" 0
        src_sql:
                         drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 rename constraint uk_t4 to uk_t04
            /
        tgt_sql:
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='PK_T4'
            /
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='PK_T04'
            /

            
            
    case 15 "外键：改名" 0
        src_sql:
                         drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 rename constraint fk_t4 to fk_t04
            /
        tgt_sql:
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='FK_T4'
            /
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='FK_T04'
            /

            
            
    case 16 "检查键：改名" 0
        src_sql:
                         drop table t_0002
            /
             drop table t_0003
            /
             drop table t_0004
            /
             drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 rename constraint chk_sal_t4 to chk_sal_t04
            /
        tgt_sql:
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='CHK_SAL_T4'
            /
            select count(*) from user_constraints where table_name='T_0004' and constraint_name='CHK_SAL_T04'
            /



    case 17 "删除约束" 0
        src_sql:
            drop table t_0002
            /
            drop table t_0003
            /
            drop table t_0004
            /
            drop table t_0000
            /
            create table t_0000 ( class_id      NUMBER(10) PRIMARY KEY,
                                  class_name    VARCHAR2(24))
            /
            CREATE TABLE t_0002
                 ( id    NUMBER(10) PRIMARY KEY,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) UNIQUE,
                   class_id NUMBER(10) REFERENCES t_0000(class_id) ON DELETE CASCADE )
            /
            CREATE TABLE t_0003
                 ( id    NUMBER(10) CONSTRAINT pk_t3 PRIMARY KEY,
                   name  VARCHAR2(24) CONSTRAINT not_null NOT NULL,
                   sal   NUMBER(8) CONSTRAINT chk_sal_t3 CHECK (sal>=1000 AND sal<=10000),
                   email VARCHAR2(24) CONSTRAINT uk_t3 UNIQUE,
                   class_id NUMBER(10) CONSTRAINT fk_t3 REFERENCES t_0000(class_id) ON DELETE CASCADE)
            /
            CREATE TABLE t_0004
                 ( id    NUMBER(10) ,
                   name  VARCHAR2(24) NOT NULL,
                   sal   NUMBER(8) ,
                   email VARCHAR2(24) ,
                   class_id NUMBER(10) ,
                   CONSTRAINT pk_t4 PRIMARY KEY(id),
                   CONSTRAINT chk_sal_t4 CHECK (sal>=1000 AND sal<=10000),
                   CONSTRAINT uk_t4 UNIQUE(email),
                   CONSTRAINT fk_t4 FOREIGN KEY(class_id) REFERENCES t_0000(class_id) ON DELETE CASCADE
                 )
            /
            alter table t_0004 drop constraint pk_t4
			/
            alter table t_0004 drop constraint chk_sal_t4
			/
            alter table t_0004 drop constraint uk_t4
			/
            alter table t_0004 drop constraint fk_t4
			/
        tgt_sql:
            select count(*) from user_constraints where table_name in('T_0000','T_0002','T_0003','T_0004')
			/

    
case 18 "comment：中英文" 0
src_sql:
drop table comment_c
/
create table comment_c(id int)
/
comment on table comment_c is '测试注释'
/
comment on column comment_c.id is '行ID'
/

tgt_sql:
select * from user_tab_comments where table_name='COMMENT_C'
/
select * from user_col_comments where table_name='COMMENT_C' order by column_name
/

case 19 "comment：字符" 0
src_sql:
drop table comment_sign
/
create table comment_sign(id1 int,id2 int,id3 int,id4 int)
/
comment on table comment_sign is '~!@#$%^&*()_+'
/
comment on column comment_sign.id1 is '"":{}?></{}|：“《》？'
/
comment on column comment_sign.id2 is '！@#￥%……&*（）——+'
/
comment on column comment_sign.id3 is '｛｝｜：”《》？'
/
comment on column comment_sign.id4 is '！＠＃￥％……＆×（）——＋'
/

tgt_sql:
select * from user_tab_comments where table_name='COMMENT_SIGN'
/
select * from user_col_comments where table_name='COMMENT_SIGN' order by column_name
/



case 20 "comment：字符+" 0
src_sql:
drop table comment_cs
/
create table comment_cs(id int,id2 int,id3 int,id4 int)
/
comment on table comment_cs is '~!@#$测试test%^&*()_+'
/
comment on column comment_cs.id1 is '"":{}注释comment?></{}|：“《》？'
/
comment on column comment_cs.id2 is '！@#￥能不能canornot%……&*（）——+'
/
comment on column comment_cs.id3 is '｛｝｜：到to”《》？'
/
comment on column comment_cs.id4 is '！＠＃￥％…备端target…＆×（）——＋'
/

tgt_sql:
select * from user_tab_comments where table_name='COMMENT_CS'
/
select * from user_col_comments where table_name='COMMENT_CS' order by column_name
/



case 45 "truncate table" 0
        src_sql:
            drop table dds_table_test purge
			/
			create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
			/
            insert into dds_table_test values ( 1, 'A2_1', sysdate, 41, 'A5_1' )
			/
            insert into dds_table_test values ( 2, 'A2_2', sysdate, 42, 'A5_2' ) 
			/
			commit
			/
            truncate table dds_table_test
            /
        tgt_sql:
        select count(*) from dds_table_test
        /


case 46 "drop table" 0
        src_sql:
            drop table dds_table_test purge
			/
			create table dds_table_test (a1 number(9,3) not null,a2 varchar2(20),a3 date,a4 int,a5 varchar2(30))
			/
            drop table dds_table_test
            /
        tgt_sql:
        select count(*) from user_objects where object_name='DDS_TABLE_TEST'
        /


case 47 "enable validate" 0
    src_sql:
drop table  tab_idx CASCADE CONSTRAINTS
/
create table tab_idx
(
  t_key       int,
  t_notnull   varchar2(10)
)
/
insert into tab_idx(t_key) values (1)
/
commit
/
alter table tab_idx modify  t_notnull constraint tinull  not null enable novalidate
/

tgt_sql:
select status,VALIDATED  from user_constraints where table_name='TAB_IDX' and constraint_name='TINULL'
/



case 48 "disable validate" 0
    src_sql:
drop table  tab_idx CASCADE CONSTRAINTS
/
create table tab_idx
(
  t_key       int,
  t_notnull   varchar2(10)
)
/
insert into tab_idx values (2,'a')
/
commit
/
alter table tab_idx modify  t_notnull constraint tinull  not null disable validate
/
update tab_idx set t_notnull='b' where t_key=2
/
commit
/

tgt_sql:
select * from tab_idx
/
select status,VALIDATED  from user_constraints where table_name='TAB_IDX' and constraint_name='TINULL'
/