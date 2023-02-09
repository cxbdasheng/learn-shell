#!/bin/bash
# 1. 统计主机上所有的 TCP 连接状态数，按照每个 TCP 状态分类
echo '1. 统计主机上所有的 TCP 连接状态数，按照每个 TCP 状态分类'
netstat -an | grep tcp| awk '{array[$6]++}END{ for (a in array) print a,array[a]}'

# 2. 计算横向数据综合，计算纵向数据总和
echo ''
echo '2. 计算横向数据综合，计算纵向数据总和'
awk 'BEGIN{printf "%-10s %-10s %-10s %-10s %-10s %-10s \n","name","chinese","math","english","computer","total"}{total=$2+$3+$4+$5;totol_count+=total;chinese_count+=$2;math_count+=$3;english_count+=$4;computer_count+=$5;printf "%-10s %-10d %-10d %-10d %-10d %-10d \n",$1,$2,$3,$4,$5,total}END{printf "%-10s %-10d %-10d %-10d %-10d %-10d \n","total",chinese_count,math_count,english_count,computer_count,totol_count}' student.txt