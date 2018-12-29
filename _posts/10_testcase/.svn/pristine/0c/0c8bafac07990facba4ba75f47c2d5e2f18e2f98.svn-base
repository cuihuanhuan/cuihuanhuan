
 case 1 "聚簇表：创建簇" 0
         src_sql:
            drop  cluster my_clu
            /
            create cluster my_clu (deptno number )  
            pctused 60  
            pctfree 10  
            size 1024  
            tablespace users  
            storage (  
            initial 128 k  
            next 128 k  
            minextents 2  
            maxextents 20  
            )  
            /


 case 2 "聚簇表：创建簇表" 0
         src_sql:
            drop cluster my_clu including tables
            /
            create cluster my_clu (deptno number )  
            pctused 60  
            pctfree 10  
            size 1024  
            tablespace users  
            storage (  
            initial 128 k  
            next 128 k  
            minextents 2  
            maxextents 20  
            )  
            /
            create table t1_dept(  
            deptno number ,  
            dname varchar2 ( 20 )  
            )    
            cluster my_clu(deptno);  
            create table t1_emp(  
            empno number ,  
            ename varchar2 ( 20 ),  
            birth_date date ,  
            deptno number  
            )  
            cluster my_clu(deptno); 
            /


 case 3 "聚簇表：创建索引" 0
         src_sql:
            drop cluster my_clu including tables cascade constraints
            /
            create cluster my_clu (deptno number )  
            pctused 60  
            pctfree 10  
            size 1024  
            tablespace users  
            storage (  
            initial 128 k  
            next 128 k  
            minextents 2  
            maxextents 20  
            )  
            /
            create table t1_dept(  
            deptno number ,  
            dname varchar2 ( 20 )  
            )    
            cluster my_clu(deptno);  
            create table t1_emp(  
            empno number ,  
            ename varchar2 ( 20 ),  
            birth_date date ,  
            deptno number  
            )  
            cluster my_clu(deptno); 
            /
            create index clu_index on cluster my_clu;
            /

 case 4 "聚簇表：修改簇属性" 0
         src_sql:
            drop cluster my_clu including tables cascade constraints
            /
            create cluster my_clu (deptno number )  
            pctused 60  
            pctfree 10  
            size 1024  
            tablespace users  
            storage (  
            initial 128 k  
            next 128 k  
            minextents 2  
            maxextents 20  
            )  
            /
            create table t1_dept(  
            deptno number ,  
            dname varchar2 ( 20 )  
            )    
            cluster my_clu(deptno);  
            create table t1_emp(  
            empno number ,  
            ename varchar2 ( 20 ),  
            birth_date date ,  
            deptno number  
            )  
            cluster my_clu(deptno); 
            /
            create index clu_index on cluster my_clu;
            /
            alter cluster my_clu  
            pctused 40  
            /
        

 case 5 "聚簇表：清空簇" 0
         src_sql:
            drop cluster my_clu including tables cascade constraints
            /
            create cluster my_clu (deptno number )  
            pctused 60  
            pctfree 10  
            size 1024  
            tablespace users  
            storage (  
            initial 128 k  
            next 128 k  
            minextents 2  
            maxextents 20  
            )  
            /
            create table t1_dept(  
            deptno number ,  
            dname varchar2 ( 20 )  
            )    
            cluster my_clu(deptno);  
            create table t1_emp(  
            empno number ,  
            ename varchar2 ( 20 ),  
            birth_date date ,  
            deptno number  
            )  
            cluster my_clu(deptno); 
            /
            create index clu_index on cluster my_clu;
            /
            truncate cluster my_clu;
            /



 case 6 "聚簇表：删除簇" 0
         src_sql:
            drop cluster my_clu including tables cascade constraints
            /
            create cluster my_clu (deptno number )  
            pctused 60  
            pctfree 10  
            size 1024  
            tablespace users  
            storage (  
            initial 128 k  
            next 128 k  
            minextents 2  
            maxextents 20  
            )  
            /
            create table t1_dept(  
            deptno number ,  
            dname varchar2 ( 20 )  
            )    
            cluster my_clu(deptno);  
            create table t1_emp(  
            empno number ,  
            ename varchar2 ( 20 ),  
            birth_date date ,  
            deptno number  
            )  
            cluster my_clu(deptno); 
            /
            create index clu_index on cluster my_clu
            /
            drop cluster my_clu including tables cascade constraints 
            /


 case 7 "聚簇表：创建散列簇" 0
         src_sql:
            /
            drop cluster my_clu_two including tables 
            /
            create cluster my_clu_two(empno number(10) )  
            pctused 70  
            pctfree 10  
            tablespace users  
            hash is empno  
            hashkeys 150 ; 
            /

 case 8 "聚簇表：创建散列表" 0
         src_sql:
            /
            drop cluster my_clu_two including tables 
            /
            create cluster my_clu_two(empno number(10) )  
            pctused 70  
            pctfree 10  
            tablespace users  
            hash is empno  
            hashkeys 150 ; 
            /
            create table t2_emp (  
            empno number ( 10 ),  
            ename varchar2 ( 20 ),  
            birth_date date ,  
            deptno number )  
            cluster my_clu_two(empno)
            /


 case 9 "聚簇表：删除散列簇" 0
         src_sql:
            /
            drop cluster my_clu_two including tables 
            /
            create cluster my_clu_two(empno number(10) )  
            pctused 70  
            pctfree 10  
            tablespace users  
            hash is empno  
            hashkeys 150 ; 
            /
            create table t2_emp (  
            empno number ( 10 ),  
            ename varchar2 ( 20 ),  
            birth_date date ,  
            deptno number )  
            cluster my_clu_two(empno)
            /
            drop cluster my_clu_two including tables
            /
