#!/bin/bash
PATH=`pwd`
# 1. 删除配置文件 /etc/nginx 中的所有注释行和空行
cp -f ./nginx PATH
echo '1. 删除配置文件 /etc/nginx 中的所有注释行和空行'
sed -i '/[:blank:]*#/d;/^$/d' nginx
cat nginx

# 2. 在配置文件 /etc/nginx 中所有不以 # 开头的行前面添加 * 符号
cp -f ./nginx PATH
echo ''
echo '2. 在配置文件 /etc/nginx 中所有不以 # 开头的行前面添加 * 符号'
sed -i 's/^[^#]/\*&/g' nginx
cat nginx

# 3. 删除 /etc/passwd 中的第 15 行
\cp -f ./passwd PATH
echo ''
echo '3. 删除 /etc/passwd 中的第 15 行'
sed -i '15d' passwd
cat passwd

# 4. 删除 /etc/passwd 中第 5 行到以 ftp 开头的所有行的内容
\cp -f ./passwd PATH
echo ''
echo '4. 删除 /etc/passwd 中第 5 行到以 ftp 开头的所有行的内容'
sed -i '5,/^ftp/d' passwd
cat passwd