#!/bin/bash
# 1. 以：为分隔符，返回 /etc/passwd 中每行中每个字段的长度
echo '1. 以：为分隔符，返回 /etc/passwd 中每行中每个字段的长度'
awk '{print length($0)}' passwd

# 2. 搜索字符串“I have a dream“中出现“ea“字符串的位置
echo ''
echo '2. 搜索字符串“I have a dream“中出现“ea“字符串的位置'
awk 'BEGIN{str="I have a dream";print index(str,"ea")}'

# 3. 将字符串“Hadoop is a bigdata Framawork“全部转换为小写
echo ''
echo '3. 将字符串“Hadoop is a bigdata Framawork“全部转换为小写'
awk 'BEGIN{str="Hadoop is a bigdata Framawork";print tolower(str)}'

# 4. 将字符串“Hadoop is a biadata Framawork“全部转换为大写
echo ''
echo '4. 将字符串“Hadoop is a biadata Framawork“全部转换为大写'
awk 'BEGIN{str="Hadoop is a bigdata Framawork";print toupper(str)}'
