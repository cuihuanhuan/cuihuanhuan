---
title: Linux kernel Kconfig测试-内核裁剪
categories: kernel
tags: kernel
---

相关命令

1.增加内核代码

```shell
[zmb]$ cd s5p6818sdk_lzy1/Linux/src/drivers #linux源码目录
[drivers]$ mkdir zmb
[drivers]$ cd zmb
[zmb]$ touch Makefile
[zmb]$ vim ../Makefile #录shift+g最后添加obj-y +=zmb/
[zmb]$ vim Makefile #添加obj-y +=test.o
[kernel]$ make menuconfig
[kernel]$ make
[kernel]$ make uImage
```

test.c

```c
#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>

static __init int test_init(void)
{
	int i;

	for (i = 0; i < 20; i++)
		printk("<0>""....................hello kernel.................\n");

	return 0;
}

//添加回调函数
//内核启动过程中执行test_init函数
module_init(test_init);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Zhiyong.Li");
MODULE_VERSION("V1.0");
MODULE_DESCRIPTION("Class Test For Uplooking");
```

重新编译内核,通过tftp下载到开发板

内核启动时，在启动的过程中，屏幕会打印

2.Kconfig测试1(Kconfig可用于内核裁剪)

```shell
config MY_TEST
	bool "My Test Support"
	default n
	help
	If you select this you will be happly

config MY_TEST1
	bool "MY TEST1 Support"
	default n
	help
	If you ..............
config FUN_ENABLE
	bool "FUN_ENABLE Support"
	depends on MY_TEST1
	default n
	help
	If you ........

```

Kconfig测试2

```shell
menu "Uplooking Test For Class"
config MY_TEST
	bool "My Test Support"
	default n
	help
	If you select this you will be happly

config MY_TEST1
	bool "MY TEST1 Support"
	default n
	help
	If you ..............
config FUN_ENABLE
	bool "FUN_ENABLE Support"
	depends on MY_TEST1
	default n
	help
	If you ........
endmenu
```

Kconfig测试3

```shell
menuconfig ZMB_TEST
	bool "Uplooking Test For Class"
	default n
	help
	If ......
if ZMB_TEST
	config MY_TEST
		bool "My Test Support"
		default n
		help
		If you select this you will be happly

	config MY_TEST1
		bool "MY TEST1 Support"
		default n
		help
		If you ..............
	config FUN_ENABLE
		bool "FUN_ENABLE Support"
		depends on MY_TEST1
		default n
		help
		If you ........
endif
```

Kconfig测试4

```shell
menuconfig ZMB_TEST
	bool "Uplooking Test For Class"
	default n
	help
	If ......
if ZMB_TEST
	config MY_TEST
		bool "My Test Support"
		default n
		help
		If you select this you will be happly

	config MY_TEST1
		bool "MY TEST1 Support"
		default n
		help
		If you ..............

	config FUN_ENABLE
		bool "FUN_ENABLE Support"
		depends on MY_TEST1
		default n
		help
		If you ........
endif
if MY_TEST1
        config PRINTK_COUNT
                int "printk count"
                default 5
                range 0 100
                help
                If .....
        config PRINTK_CONTENT
                string "printk content"
                default "I am Kernel"
                help
                If ....
endif
```

Kconfig测试5(这个需要测试一下)

```shell
menuconfig ZMB_TEST
	bool "Uplooking Test For Class"
	default n
	help
	If ......

choice
        prompt "select you ts type"
        	config MY_TS1
        		bool "my ts1"
        	config MY_TS2
        		bool "my ts2"
        	config MY_TS3
        		bool "my ts3"
endchoice
```

test1.c(通过Kconfig来裁剪代码)

```c
#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>

static void test_fun(void)
{
#ifdef CONFIG_FUN_ENABLE
	printk(".............enabla enable...........\n");
#else
	printk(".............disabla disable...........\n");
#endif
}

static __init int test_init(void)
{
	int i;

	for (i = 0; i < 20; i++)
		test_fun();

	for (i = 0; i < CONFIG_PRINTK_COUNT; i++)
		printk("%s\n", CONFIG_PRINTK_CONTENT);

	return 0;
}

module_init(test_init);

MODULE_LICENSE("GPL");

```

笔记

```shell
所有控制器不可能全学完，太难的三星给代码，不用自己调

linux内核驱动
2000万行源码
查看源码工具
windows sourceside
linux ctags
查看ctags是否存在
[~]$ ctags
ctags: No files specified. Try "ctags --help".

源码目录：
s5p6818sdk_lzy1/Linux/src

[src]$ ls
buildroot.tar.bz2  linux              prototype  uboot6818.tar.bz2
kernel             linux-3.4.tar.bz2  uboot
[src]$ tar -xvf linux-3.4.tar.bz2
kernel
创建索引
ctags -R .
[kernel]$ du -sh tags
133M	tags

vim打开大文件很费劲,别打开这个文件
查找memcpy的实现
vim -t memcpy
vim -t只能找同一个
找其他的memcpy实现
内核中没有man手册,要看函数原型
#cstag memcpy

 # pri kind tag               文件
  1 F   f    memcpy            arch/arm/boot/compressed/string.c
               void *memcpy(void *__dest, __const void *__src, size_t __n)
  2 F   v    memcpy            arch/arm/kernel/armksyms.c
               EXPORT_SYMBOL(memcpy);
  3 F   v    memcpy            arch/um/os-Linux/user_syms.c
               EXPORT_SYMBOL(memcpy);
  4 F   v    memcpy            lib/string.c
               EXPORT_SYMBOL(memcpy);
  5 F   f    memcpy            lib/string.c
               void *memcpy(void *dest, const void *src, size_t count)
  6 F   d    memcpy            tools/perf/bench/mem-memcpy-x86-64-asm.S
               #define memcpy MEMCPY /* don't hide glibc's memcpy() */
  7 FS  d    memcpy            arch/arm/boot/compressed/decompress.c
               49
  8 FS  d    memcpy            arch/um/os-Linux/user_syms.c
               13
  9 FS  m    memcpy            drivers/dma/amba-pl08x.c
               struct:pl08x_driver_data typeref:struct:pl08x_driver_data::dma_d
键入数字和回车(empty cancels)： 
敲5回车进入函数
内核不依赖任何库,内核把libc实现了
找到函数原型才会使用

vim -t strstr
:cstag strstr
选4
进入strstr实现,strstr里面有strlen,进入strlen，ctrl+],返回strlen,ctrl+o
ctrl + ]:进入函数实现
ctrl + o:返回
ctrl + o 一级一级的往前返回

有些时候这样找不到,必须去记文件


在内核中添加自己的代码

kernel-3.4

Linux移植裁剪
从www.kernel.org下载，裁剪，现在原厂做
自己裁剪，很多硬件跑步不起来，
用谁的芯片就用谁的内核


操作系统和内核不一样
内核+文件系统+应用程序=操作系统
android:android配置
arch:支持的平台
block:块设备 SD U 硬盘 emmc
crypto:算法
Documentation:文档
内核不依赖第三方的库，所有都自己实现
driver:内核60%的代码,90%的驱动
firmware:固件，往单片机下载程序
fs:文件系统
include:内核所有头文件
init:内核的启动代码
ipc:进程间通信的机制，用来支持信号量等
kernel:进程调度（多任务，把整个硬件都发挥出来）
lib:依赖库，都实现了
mm:管理内存的代码,malloc调用mm中的代码分配内存
net:tcp/ip协议栈，对网络的支持
samples:demo
script:脚本,编译配置内核调用的
security:安全子系统selinux有关
sound:支持声卡，音频
tools:工具
ust：用户衔接
virt:虚拟化代码，支持虚拟化


cd drivers


[drivers]$ mkdir zmb
[drivers]$ cd zmb/
[zmb]$ touch test.c
[zmb]$ touch Makefile
[zmb]$ vim ../Makefile 
[zmb]$ 
shift+g最后添加obj-y +=zmb/

[zmb]$ vim Makefile
obj-y +=test.o

[zmb]$ vim test.c 
#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>

//加static，只能在当前文件调用
//返回必须是int,参数必须是void
//_init函数只在启动调用一次,以后不会再被调用，执行会释放空间
内核启动过程中调用一次,以后不再被调用，执行一次后，空间释放：加__init
static __init int test_init(void){
}


//static void test_exit(void){}这里先不用

//回调函数，别人调用，
//内核启动过程中执行test_init函数
module_init(test_init)
//module_exit(test_exit);

MODULE_LICENSE("GPL");
用了开源的东西，你的东西也必须开源GPL

printk()可带消息级别
printk("<0>")写0级别很高，会打印出来，级别不高会放到缓存中，自己去查看

/home/uplooking/zmb/s5p6818sdk_lzy1/Linux/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin

 [kernel]$ make -j4
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready

  [kernel]$ make uImage
  Image arch/arm/boot/uImage is ready




在内核中加了自己的东西后,make后,再make uImage
[kernel]$ make
.....
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  Building modules, stage 2.
  MODPOST 2 modules
[kernel]$ make uImage
.....
  Image arch/arm/boot/uImage is ready
[kernel]$ 

obj-y 编译到内核
obj-n 不编译到内核
$代表引用变量的值
obj-$(CONFIG_MY_TEST) += test.o
内核裁剪原理

#替换开发板内核
#192.168.200.206是物理机IP
[root@X6818:~]# mount -t nfs -o nolock,rw 192.168.200.206:/zmb_root /mnt
[root@X6818:~]# mkdir kkk
#mmcblk0p1里面是内核
[root@X6818:~]# mount /dev/mmcblk0p1 kkk/   
[root@X6818:~]# cp /mnt/uImage kkk/
[root@X6818:~]# umount /mnt/
[root@X6818:~]# umount kkk/

[    4.707000] logger: created 256K log 'log_system'
[    4.711000] ....................hello kernel.................
[    4.717000] ....................hello kernel.................
[    4.723000] ....................hello kernel.................
[    4.728000] ....................hello kernel.................
[    4.734000] ....................hello kernel.................
[    4.740000] ....................hello kernel.................
[    4.746000] ....................hello kernel.................
[    4.751000] ....................hello kernel.................
[    4.757000] ....................hello kernel.................
[    4.763000] ....................hello kernel.................
[    4.768000] ....................hello kernel.................
[    4.774000] ....................hello kernel.................
[    4.780000] ....................hello kernel.................
[    4.786000] ....................hello kernel.................
[    4.791000] ....................hello kernel.................
[    4.797000] ....................hello kernel.................
[    4.803000] ....................hello kernel.................
[    4.808000] ....................hello kernel.................
[    4.814000] ....................hello kernel.................
[    4.820000] ....................hello kernel.................
[    4.826000] snd pcm: register sound platform 'nxp-pcm'
[    4.877000] asoc: alc5621-hifi <-> nxp-i2s.0 mapping ok

touch drivers/zmb/Kconfig
		vim drviers/zmb/Kconfig
			config MY_TEST
        			bool "My Test Support"
        			default n
        			help
        			If you select this you will be happy
		vim drivers/Kconfig #第一行
			source "drivers/zmb/Kconfig"




[kernel]$ make
scripts/kconfig/conf --silentoldconfig Kconfig
*
* Restart config...
*
*
* Device Drivers
*
My Test Support (MY_TEST) [N/y/?] (NEW) n
#
# configuration written to .config
#
[kernel]$ vim .config#搜索MY_TEST,去掉那句话


[kernel]$ make
scripts/kconfig/conf --silentoldconfig Kconfig
*
* Restart config...
*
*
* Device Drivers
*
My Test Support (MY_TEST) [N/y/?] (NEW) y
#
# configuration written to .config
#

############################

写了Kconfig
先make menuconfig
进入界面里面的Device Drivers

再make
###########################
dmesg -c #清缓存
printk默认打到缓存，如果消息级别不够高


#########################
kernel/drivers/zmb/Makefile:
obj-$(CONFIG_MY_TEST) +=test.o
通过配置界面来控制是否编译test.c

通过配置界面来控制是否编译某个目录
vim drivers/Makefile
obj-$(CONFIG_ZMB_TEST)          +=zmb/



开发板没有ip重新获取ip
[root@X6818:~]# udhcpc



N种触摸屏驱动，可选



[kernel]$ make 
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: 'include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  CC      drivers/zmb/test1.o
drivers/zmb/test1.c: In function 'test_fun2':
drivers/zmb/test1.c:7:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for(int i=0;i<20;i++){
  ^
drivers/zmb/test1.c:7:2: note: use option -std=c99 or -std=gnu99 to compile your code
scripts/Makefile.build:307: recipe for target 'drivers/zmb/test1.o' failed
make[2]: *** [drivers/zmb/test1.o] Error 1
scripts/Makefile.build:443: recipe for target 'drivers/zmb' failed
make[1]: *** [drivers/zmb] Error 2
Makefile:945: recipe for target 'drivers' failed
make: *** [drivers] Error 2

###################################################
先声明后引用
static void test_fun2(void)
{
        int j;
        for(j=0;j<20;j++){
                printk("-----------------where u r-----------------");
        }
#ifdef PRINTK_COUNT
        int i;
        for(i=0;i<PRINTK_COUNT;i++){
        #ifdef PRINTK_CONTENT
                printk(PRINTK_CONTENT);
        #endif
        }
#endif
}



```

