#!/bin/bash
cd /home
cat /etc/passwd > ./password.txt
# 找普通字符root，不区分大小写
> grep -ni root passwd.txt 
1:root:x:0:0:root:/root:/bin/bash
10:operator:x:11:0:operator:/root:/sbin/nologin

# 统计password.txt文本中，有多少行root有关的内容
> grep -c root passwd.txt 
2

# 找出所有允许登录的用户，解释器是/bin/bash的行
> grep -n "/bin/bash$" passwd.txt 
1:root:x:0:0:root:/root:/bin/bash

# 找出不允许登录的用户
> grep -n 'nologin$' passwd.txt 
2:bin:x:1:1:bin:/bin:/sbin/nologin
3:daemon:x:2:2:daemon:/sbin:/sbin/nologin
4:adm:x:3:4:adm:/var/adm:/sbin/nologin
5:lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
9:mail:x:8:12:mail:/var/spool/mail:/sbin/nologin

# 找出root开头的行
> grep -n '^root' passwd.txt 
1:root:x:0:0:root:/root:/bin/bash

# 过滤出除bin开头的行，显示行号
> grep -nvE '^bin' passwd.txt 
1:root:x:0:0:root:/root:/bin/bash
3:daemon:x:2:2:daemon:/sbin:/sbin/nologin
4:adm:x:3:4:adm:/var/adm:/sbin/nologin

# 找出系统上root、yu、nobody用户的信息
> grep -E '^\<(root|yu|nobody)\>' passwd.txt 
root:x:0:0:root:/root:/bin/bash
nobody:x:65534:65534:Kernel Overflow User:/:/sbin/nologin
