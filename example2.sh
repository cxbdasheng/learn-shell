#!/bin/bash
var1="Hello World"
echo "var1 = $var1"

# 获取字符串长度 
len=${#var1}
echo "var1 len = $len"

# 通过expr获取
len=`expr length "$var1"`
echo "var1 len = $len"

# 获取字符索引位置 
index=`expr index "$var1" rld`
echo "rld index = $index"


index=`expr index "$var1" a1d`
echo "a1d index = $index"

#获取子串长度 
sub_len=`expr match "$var1" rld`
echo "rld sub_len = $sub_len"
sub_len=`expr match "$var1" Hello`
echo "Hello sub_len = $sub_len"

# 抽取字符串中的子串 
var2="redis mysql pgsql sqlserver"
echo "var2 = $var2"

# 从 var2 第 10 位开始提取子串 
substr1=${var2:10}
echo "substr1 = $substr1"

# 从 var2 第 10 位开始提取长度为 5 的子串 
substr2=${var2:10:5}
echo "substr2 = $substr2"

# 从 var2 的右边第 5 开始提取子串 
substr3=${var2:-5}
echo "substr3 = $substr3"

substr4=${var2:(-5)}
echo "substr4 = $substr4"

# 从 var2 的右边第 5 开始提取长度为 5 的子串
substr5=${var2:-5:5}
echo "substr5 = $substr5"

# 从 5 开始,匹配长度为 10(tips:使用expr，索引计数是从1开始计算;使用${string:position}， 索引计数是从0开)
substr6=`expr substr "$var2" 5 10`
echo "substr6 = $substr6"