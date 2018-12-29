    case 18 "参数：pctfree" 0
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
            alter table t_0004 pctfree 20
            /
        tgt_sql:
            select pct_free from user_tables where table_name='T_0004'
            /
            
            
    case 19 "参数：initrans" 0
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
            alter table t_0004 initrans 5
            /
        tgt_sql:
            select ini_trans from user_tables where table_name='T_0004'
            /

            
            
    case 20 "参数：logging=no" 0
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
            alter table t_0004 nologging
            /
        tgt_sql:
            select logging from user_tables where table_name='T_0004'
            /
            
            
    case 21 "参数：logging=yes" 0
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
            alter table t_0004 logging
            /
        tgt_sql:
            select logging from user_tables where table_name='T_0004'
            /
            
            
    case 22 "参数：cache=yes" 0
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
            alter table t_0004 cache
            /
        tgt_sql:
            select trim(cache) from user_tables where table_name='T_0004'
            /

            
            
    case 23 "参数：cache=no" 0
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
            alter table t_0004 nocache
            /
        tgt_sql:
            select trim(cache) from user_tables where table_name='T_0004'
            /
            
            
    case 24 "参数：parallel-->10" 0
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
            alter table t_0004 parallel 10
            /
        tgt_sql:
            select trim(degree) from user_tables where table_name='T_0004'
            /

            
            
    case 25 "参数：parallel-->noparallel" 0
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
            alter table t_0004 noparallel
            /
        tgt_sql:
            select trim(degree) from user_tables where table_name='T_0004'
            /

    case 26 "参数：compress" 0
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
            alter table t_0004 compress
            /
        tgt_sql:
            select compression from user_tables where table_name='T_0004'
            /

    case 27 "参数：nocompress" 0
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
            alter table t_0004 nocompress
            /
        tgt_sql:
            select compression from user_tables where table_name='T_0004'
            /
            
            
    case 28 "参数：row movement-->enable" 0
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
            alter table t_0004 enable row movement
            /
        tgt_sql:
            select row_movement from user_tables where table_name='T_0004'
            /
    case 29 "参数：row movement-->disable" 0
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
            alter table t_0004 disable row_movement
            /
            tgt_sql:
            select row_movement from user_tables where table_name='T_0004'
            /