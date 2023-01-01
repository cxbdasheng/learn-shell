#!/bin/bash
this_pid=$$

function is_nginx_running
{
    ps -ef | grep nginx | grep -v grep | grep -v $this_pid &> /dev/null
    if [ $? -eq 0 ];then
        return 
    else
        return 1
    fi
}

is_nginx_running && echo "Nginx is running" || echo "Nginx is stoped"
