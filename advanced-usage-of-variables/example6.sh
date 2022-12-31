#!/bin/bash

nginx_process_num=$(ps -ef|grep nginx|grep -v grep|wc -l)
if [ $nginx_process_num -eq 0 ];then
        systemctl start nginx
fi