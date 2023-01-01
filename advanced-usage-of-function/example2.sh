#!/bin/bash

# 获取当前脚本运行的子id，防止 ps 命令误认
this_pid=$$

while true
do
ps -ef | grep nginx | grep -v grep | grep -v $this_pid &> /dev/null
if [ $? -eq 0 ];then
    echo "Nginx is running well"
    sleep 3
else
    systemctl start nginx
    echo "Nginx is down,Start it ..."
fi
done
