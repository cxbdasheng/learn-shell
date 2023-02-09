#!/bin/bash
# 1. 使用 awk 计算 /etc/nginx 中的空白行数量
echo '1. 使用 awk 计算 /etc/nginx 中的空白行数量'
awk 'BEGIN{count=0}/^$/{count++;}END{print count}' nginx

# 2. 计算学生课程分数平均值
echo ''
echo '2. 计算学生课程分数平均值'
awk 'BEGIN{printf "%-10s %-10s %-10s %-10s %-10s %-10s \n","name","chinese","math","english","computer","avg"}{avg=($2+$3+$4+$5)/4;printf "%-10s %-10d %-10d %-10d %-10d %-10d \n",$1,$2,$3,$4,$5,avg}' student.txt

