#!/bin/bash
# 条件语句
# 1. 以：为分隔符，只打印 /etc/passwd 中第 3 个字段的数值在 50-100 范围内的行信息
echo '条件语句'
echo '1. 以：为分隔符，只打印 /etc/passwd 中第 3 个字段的数值在 50-100 范围内的行信息'
awk 'BEGIN{FS=":"}$3>50 && $3<100{print $0}' passwd

# 2. 计算下列每个同学的平均分数，并且只打印平均分数大于90的同学姓名和分数信息
echo ''
echo '2. 计算下列每个同学的平均分数，并且只打印平均分数大于90的同学姓名和分数信息'
awk 'BEGIN{printf "%-10s %-10s %-10s %-10s %-10s %-10s \n","name","chinese","math","english","computer","avg"}{avg=($2+$3+$4+$5)/4;if(avg>90)printf "%-10s %-10d %-10d %-10d %-10d %-10d \n",$1,$2,$3,$4,$5,avg}' student.txt

# 循环语句
echo ''
echo '循环语句'
# 1. 计算1+2+3+4+...+100的和，请使用while、 do while、 for三种循环方式实现（我只写for了）
echo '1. 计算1+2+3+4+...+100的和，请使用while、 do while、 for三种循环方式实现'
awk 'BEGIN{sum=0;for(i=0;i<=100;i++)sum+=i;print sum}'
