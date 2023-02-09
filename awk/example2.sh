#!/bin/bash
# 1. 以字符串格式打印 /etc/passwd 中的第 7 个字段，以 ":" 作为分隔符
echo '1. 以字符串格式打印 /etc/passwd 中的第 7 个字段，以 ":" 作为分隔符'
awk 'BEGIN{FS=":"}{printf "%s \n",$7}' passwd

# 2. 以 10 进制格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符
echo ''
echo '2. 以 10 进制格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符'
awk 'BEGIN{FS=":"}{printf "%d \n",$3}' passwd

# 3. 以浮点数格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符
echo ''
echo '3. 以浮点数格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符'
awk 'BEGIN{FS=":"}{printf "%f \n",$3}' passwd

# 4. 以 8 进制数格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符
echo ''
echo '4. 以 8 进制数格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符'
awk 'BEGIN{FS=":"}{printf "%o \n",$3}' passwd

# 5. 以科学计数法格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符
echo ''
echo '5. 以科学计数法格式打印 /etc/passwd 中的第 3 个字段，以 ":" 作为分隔符'
awk 'BEGIN{FS=":"}{printf "%e \n",$3}' passwd
