#!/bin/bash

# 根据系统时间计算今年或明年
echo "This is $(date +%Y) year";
echo "This is $(($(date +%Y)+1)) year";

# 根据系统时间获取今年还剩下多少星期，已经过了多少星期
echo "This year have passed $(date +%j) days";
echo "This year have passed $(date +%V) weeks";
echo "There is $((365-$(date +%j))) days before new year";
echo "There is $(((365-$(date +%j))/7)) weeks before new year";