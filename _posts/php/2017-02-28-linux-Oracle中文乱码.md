---
title: linux-Oracle中文乱码
categories: Oracle
tags: Oracle
---

conn / as sysdba;
shutdown immediate;
startup mount;
alter system enable restricted session;
alter system set job_queue_processes=0;
alter system set aq_tm_processes=0;
alter database open;
alter database character set internal_use ZHS16GBK;
shutdown immediate;
startup;


select userenv('language') from dual;
中文显示乱码

将字符集改为AMERICAN_AMERICA.ZHS16GBK
命令行中执行export LANG=zh_CN.UTF-8
再次进入oracle查询数据,不出现了乱码了
xshell/linux vim
export LANG=zh_CN.UTF-8

.bashrc

export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK


vim .bash_profile 
注意.bashrc和.bash_profile

遇到.bash_profile中NLS_LANG错误,导致OCI init env err


