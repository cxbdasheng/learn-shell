#!/bin/bash

# 1. 打印行所有信息
echo "1. 打印行所有信息"
awk '{print $0}' student.txt

# 2. 打印行的第 1 到 2 个字段的信息
echo ''
echo "2. 打印行的第 1 到 2 个字段的信息"
awk '{print $1,$2}' student.txt

# 3. 打印每行行的字段个数
echo ''
echo "3. 打印每行行的字段个数"
awk '{print NF}' student.txt

# 4. 打印处理行的行号
echo ''
echo "4. 打印处理行的行号"
awk '{print NR}' student.txt

# 5. 打印多文件单独记录行号
echo ''
echo "5. 打印多文件单独记录行号"
awk '{print FNR}' string.txt student.txt

# 6. 用 `--` 行分隔符和用 `|` 列分割符分割行，且输出字段分隔符为 `&`
echo ''
echo "6. 用 -- 行分隔符和用 | 列分割符分割行，且输出字段分隔符为 &"
awk 'BEGIN{RS="--";FS="|";ORS="&"}{print $3}' string.txt

# 7. 输出文件名
awk '{print FILENAME}' string.txt
