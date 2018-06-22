---
title: Oracle-SQL用例自动化测试步骤
categories: python
tags: python
---


注意.bashrc和.bash_profile

遇到.bash_profile中NLS_LANG错误,导致OCI init env err


1.获取https://svn.info2soft.com/svn/i2doc/研发和技术/产品/i2Active/05. 测试用例/10_testcase并重命名为80_testcase

2.将80_testcase拷贝到C盘,在C盘新建目录all cases

3.拆分case
python i2active_splitcase.py

4.创建list_case表(用于存测试结果)
python i2active_managecase.py

5.将all cases拷贝到linux根目录下,重命名为allcases


6.新建/root/Desktop/i2active/bin/run.sh

./iadebug work --add test --uuid 42B0AEB2-83D1-A5DD-1353-A63E7FE279DF  --sip 192.168.17.11 --datport 26829  --srcdir /tmp/i2active/ --dip 192.168.17.12 --datport 26829  --dstdir /tmp/i2active/  --mem 111 --disk 111 --src --instance orcl --name wk --ip 192.168.17.11 --thread 1 --port 1521  --user huan2 --pass 12345  --type file --dst --instance orcl --name bk --ip 192.168.17.12 --port 1521 --user huan2 --pass 12345 --thread 1 --type file  --rmmode 0  --maptype 0 HUAN2 HUAN2
./iadebug work --start 42B0AEB2-83D1-A5DD-1353-A63E7FE279DF


7.新建/root/Desktop/i2active/bin/sql2.sql

drop user huan2 cascade;
create user huan2 identified by 12345;
grant connect,resource,dba to huan2;

8.增量测试
python i2active_increment.py



9.查看测试结果
select * from list_case where STATE = 'PASS' order by case_id;



