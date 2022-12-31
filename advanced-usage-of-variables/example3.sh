#!/bin/bash
string="Bigdata process framework is Hadoop , Hadoop is an open source project"

function print_tips {
  echo "-----------------------------"
  echo "(1).打印 string 长度"
  echo "(2).删除字符串中所有的 Hadoop"
  echo "(3).替换第一个 Hadoop 为 Mapreduce"
  echo "(4).替换全部 Hadoop 为 Mapreduce"
  echo "-----------------------------"
}

function len_of_string {
  echo ${#string}
}

function del_hadoop {
  echo ${string//Hadoop/}
}

function rep_hadoop_mapreduce_first {
  echo ${string/Hadoop/mapreduce}
}

function rep_hadoop_mapreduce_all {
  echo ${string//Hadoop/mapreduce}
}
while true; do
  echo "[string=$string]"
  print_tips
  read -p "Pls input you choice(1|2|3|4|q|Q)：" choice
  case $choice in
  1)
    len_of_string
    ;;
  2)
    del_hadoop
    ;;
  3)
    rep_hadoop_mapreduce_first
    ;;
  4)
    rep_hadoop_mapreduce_all
    ;;
  q | Q)
    exit
    ;;
  *)
    echo "Error, input only in(1|2|3|4|q|Q)"
    ;;
  esac
  echo "-----------------------------"
done
