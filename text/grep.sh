#!/bin/bash
cd /home
cat /etc/passwd > ./passwd.txt
# 找普通字符root，不区分大小写
grep -ni root passwd.txt 

# 统计password.txt文本中，有多少行root有关的内容
grep -c root passwd.txt 


# 找出所有允许登录的用户，解释器是/bin/bash的行
grep -n "/bin/bash$" passwd.txt 


# 找出不允许登录的用户
grep -n 'nologin$' passwd.txt 

# 找出root开头的行
grep -n '^root' passwd.txt 

# 过滤出除bin开头的行，显示行号
grep -nvE '^bin' passwd.txt 

# 找出系统上root、yu、nobody用户的信息
grep -E '^\<(root|yu|nobody)\>' passwd.txt

# 查找当前目录下有 root 的所有文件
grep -nr root
