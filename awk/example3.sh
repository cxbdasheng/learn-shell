#!/bin/bash
# RegExp
echo 'RegExp'
# 1. 匹配 /etc/passwd 文件行中含有 root 字符串的所有行
echo '1. 匹配 /etc/passwd 文件行中含有 root 字符串的所有行'
awk '/root/{print $0}' passwd

# 2. 匹配 /etc/passwd 文件行中以 yarn 开头的所有行
echo ''
echo '2. 匹配 /etc/passwd 文件行中以 yarn 开头的所有行'
awk '/^yarn/{print $0}' passwd

# 运算符匹配
# 1. 以：为分隔符，匹配 /etc/passwd 文件中第 3 个字段小于 50 的所有行信息
echo ''
echo '运算符匹配'
echo '1. 以：为分隔符，匹配 /etc/passwd 文件中第 3 个字段小于 50 的所有行信息'
awk 'BEGIN{FS=":"}$3<50{print $0}' passwd

# 2. 以：为分隔符，匹配 /etc/passwd 文件中第 7 个字段不为 /bin/bash 的所有行信息
echo ''
echo '2. 以：为分隔符，匹配 /etc/passwd 文件中第 7 个字段不为 /bin/bash 的所有行信息'
awk 'BEGIN{FS=":"}$7!="/bin/bash"{print $0}' passwd

# 布尔运算符匹配
echo ''
echo '布尔运算符匹配'
# 1. 以：为分隔符，匹配 /etc/passwd 文件中包含 hdfs 或 yarn 的所有行信息
echo '1. 以：为分隔符，匹配 /etc/passwd 文件中包含 hdfs 或 yarn 的所有行信息'
awk 'BEGIN{FS=":"} hdfs|| yarn {print $0}' passwd

# 2. 以：为分隔符，匹配 /etc/passwd 文件中第 3 个字段小于 50 并且第 4 个字段大于 50 的所行信息
echo ''
echo '2. 以：为分隔符，匹配 /etc/passwd 文件中第 3 个字段小于 50 并且第 4 个字段大于 50 的所行信息'
awk 'BEGIN{FS=":"}$3<50 && $4>50{print $0}' passwd
games:x:12:100:games:/usr/games:/sbin/nologin