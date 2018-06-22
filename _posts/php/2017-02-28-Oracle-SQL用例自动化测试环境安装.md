---
title: Oracle sql自动化测试环境安装
categories: python
tags: python
---


![img](/img/python/cx_Oracle.png)

PL/SQL和Oracle的版本要一致64位

我重新了PL/SQL_x86_64,instantclient_x86_64

windows下载instantclient-basic-win-x86-64-11.2.0.1.0.zip

C:\Program Files\PLSQL Developer\instantclient_11_2

C:\Program Files\PLSQL Developer\instantclient_11_2\network\admin\tnsnames.ora

```
wk =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.17.11)(PORT = 1521))
    (CONNECT_DATA =
      (SID = orcl)
    )
  )

bk =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.17.12)(PORT = 1521))
    (CONNECT_DATA =
      (SID = orcl)
    )
  )

```



注意:编译安装python之前要安装一些依赖包!

yum install openssl-devel zlib zlib-devel -y

1.下载python2.7
tar -xvf Python-2.7.11.tgz

cd Python-2.7.11
./configure 
make
make install
python -v




2.安装setuptools,pip

要验证pip是否能用

3.安装pycrypto

google pycrypto-2.6.1.tar.gz
下载并安装pycrypto,setup.py install

4.安装paramiko

下载https://pypi.python.org/pypi/paramiko/2.4.0
下载并安装paramiko,python setup.py install

5.安装cx_Oracle

pip install cx_Oracle


```
[root@test_c11 paramiko-2.4.0]# python
Python 2.7.11 (default, Feb 28 2018, 13:47:36) 
[GCC 4.4.7 20120313 (Red Hat 4.4.7-4)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import Crypto  
>>> import paramiko
>>> import cx_Oracle
>>> 

```



