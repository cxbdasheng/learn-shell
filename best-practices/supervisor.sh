#!/bin/bash
. ./app_status.lib
. ./app_start.lib
parameter_total=$#
parameter_last=${!parameter_total}

mode='-p'
if (($parameter_total > 0)); then
  if [ "$1" == '-p' ] || [ "$1" == '-g' ]; then
    mode=$1
    shift
  fi
fi
function print_tips() {
  echo "-----------------------------"
  echo "欢迎使用 supervisor 管理器"
  #  echo "命令格式 sh supervisor.sh [-g|-p] [group name | process name] ... [start | stop | show ]"
  #  echo "sh supervisor.sh -g DB start"
  #  echo "(4).替换全部 Hadoop 为 Mapreduce"
  echo "-----------------------------"
}

function to_process_to_show() {
  parameter=$@
  if [ $parameter_total == 0 ]; then
    for pn in $(get_all_process); do
      gn=$(get_group_by_process_name $pn)
      is_process_in_config $pn && format_print $pn $gn
    done
  elif [ $mode == '-p' ]; then
    for pn in $parameter; do
      if [ $pn == 'show' ]; then
         continue ;
      fi
      gn=$(get_group_by_process_name $pn)
      is_process_in_config $pn && format_print $pn $gn
    done
  elif [ $mode == '-g' ]; then
    for gn in $parameter; do
      if [ $gn == 'show' ]; then
         continue ;
      fi
      is_group_in_config $gn || continue
      for pn in $(get_all_process_by_group $gn); do
        is_process_in_config $pn && format_print $pn $gn
      done
    done
  fi
}

function to_process_start
{
 parameter=$@
 parameter_length=$#
      awk 'BEGIN{printf "%-20s%-10s%-10s%-6s%-7s%-10s%-20s\n","ProcessName---------","GroupName---","Status----","PID---","CPU----","MEMORY----","StartTime---"}'
 if [ $parameter_length == 1 ]; then
     for pn in $(get_all_process); do
       start $pn
       gn=$(get_group_by_process_name $pn)
       format_print $pn $gn
     done
 elif [  $mode == '-p' ]; then
   for pn in $parameter;do
     if [ $pn == 'start' ]; then
         continue ;
     fi
    is_process_in_config $pn && start $pn && gn=$(get_group_by_process_name $pn) && format_print $pn $gn
   done
 elif [ $mode == '-g' ]; then
     for gn in $parameter;do
        if [ $gn == 'start' ]; then
                continue ;
        fi
        is_group_in_config $gn || continue
        for pn in $(get_all_process_by_group $gn); do
                is_process_in_config $pn && start $pn && format_print $pn $gn
        done
       done
 fi
}
function to_process_stop
{

  parameter=$@

}


print_tips

case "$parameter_last" in
"stop")
  to_process_stop $@
  ;;
"start")
  to_process_start $@
  ;;
"show" | *)
  awk 'BEGIN{printf "%-20s%-10s%-10s%-6s%-7s%-10s%-20s\n","ProcessName---------","GroupName---","Status----","PID---","CPU----","MEMORY----","StartTime---"}'
  to_process_to_show $@
  ;;
esac