#!/bin/bash
HOME=$(pwd)'/'
CONFIG_FILE='process.cfg'
this_pid=$$

# 无需输入任何参数；返回配置文件 process.cfg中所有的组信息，例如WEB、DB等
function get_all_group {
  group_list=$(sed -n '/\[GROUP\]/,/\[.*\]/p' ${HOME}${CONFIG_FILE} | grep -v -E '(\[.*\]|^$)')
  echo $group_list
}

# 无需输入任何参数；返回配置文件 process.cfg中所有的进程信息。
function get_all_process {
  for g in $(get_all_group); do
    p_list=$(sed -n "/\[${g}\]/,/\[.*\]/p" process.cfg | grep -v -E '(\[.*\]|^$)')
    echo $p_list
  done
}

# 接收一个参数，参数为组名称；返回值是对应组内的所有进程名称列表
function get_all_process_by_group {
  is_group_in_config $1
  if [ $? -eq 0 ]; then
    p_list=$(sed -n "/\[$1\]/,/\[.*\]/p" $HOME/$CONFIG_FILE | egrep -v "(^$|^#|\[.*\])")
    echo $p_list
  else
    echo "GroupName $1 is not in process.cfg"
  fi
}

# 接收一个参数，参数是一个进程名称；返回值是一个组名
function get_group_by_process_name {
  for gn in $(get_all_group); do
    for pn in $(get_all_process_by_group $gn); do
      if [ $pn == $1 ]; then
        echo "$gn"
      fi
    done
  done
}

# 接收一个参数，参数为进程PID；返回值是一个进程运行信息的列表，列表包含运行状态、CPU占用率、内存占用率、进程启动时间
function get_process_info_by_pid {
  if [ $(ps -ef | awk -v pid=$1 '$2==pid{print }' | wc -l) -eq 1 ]; then
    pro_status="RUNNING"
  else
    pro_status="STOPED"
  fi
  pro_cpu=$(ps aux | awk -v pid=$1 '$2==pid{print $3}')
  pro_mem=$(ps aux | awk -v pid=$1 '$2==pid{print $4}')
  pro_start_time=$(ps -p $1 -o lstart | grep -v STARTED)
}

# 接收一个参数，参数为组的名称；返回值是0或1,0代表该组在配置文件中，1代表该组不在配置文件中
function get_process_pid_by_name {
  if [ $# -ne 1 ]; then
    return 1
  else
    pids=$(ps -ef | grep $1 | grep -v grep | grep -v $0 | awk '$3==1{print $2"\n"}')
    echo $pids
  fi
}

# 接收一个参数，判断组是否存在
function is_group_in_config {
  for gn in $(get_all_group); do
    if [ $gn == $1 ]; then
      return
    fi
  done
  echo "Group $1 is not in process.cfg"
  return 1
}

# 接收一个参数，判断进程是否存在
function is_process_in_config {
  for pn in $(get_all_process); do
    if [ $pn == $1 ]; then
      return
    fi
  done
  echo "Process $1 is not in process.cfg"
  return 1
}

# 接收二个参数，第一个参数为process_name，第二个参数为组名称返回值，是针对每一个进程PID的运行信息
function format_print {
  ps -ef | grep $1 | grep -v grep | grep -v $this_pid &>/dev/null
  if [ $? -eq 0 ]; then
    pids=$(get_process_pid_by_name $1)
    for pid in $pids; do
      get_process_info_by_pid $pid
      awk -v p_name=$1 \
        -v g_name=$2 \
        -v p_status=$pro_status \
        -v p_pid=$pid \
        -v p_cpu=$pro_cpu \
        -v p_mem=$pro_mem \
        -v p_start_time="$pro_start_time" \
        'BEGIN{printf "%-20s%-12s%-10s%-6s%-7s%-10s%-20s\n",p_name,g_name,p_status,p_pid,p_cpu,p_mem,p_start_time}'
    done
  else
    awk -v p_name=$1 -v g_name=$2 'BEGIN{printf "%-20s%-12s%-10s%-6s%-7s%-10s%-20s\n",p_name,g_name,"STOPPED","NULL","NULL","NULL","NULL"}'
  fi
}

# 输出前置标题
awk 'BEGIN{printf "%-20s%-10s%-10s%-6s%-7s%-10s%-20s\n","ProcessName---------","GroupName---","Status----","PID---","CPU----","MEMORY----","StartTime---"}'

# 执行有三种情况：
# 1	无参数			列出配置文件中所有进程的运行信息
# 2	-g GroupName	列出GroupName组内的所有进程
# 3	process_name1	列出指定进程的运行信息

if [ $# -gt 0 ]; then
  if [ "$1" == '-g' ]; then
    # 2	-g GroupName	列出GroupName组内的所有进程
    shift
    for gn in $@; do
      is_group_in_config $gn || continue
      for pn in $(get_all_process_by_group $gn); do
        is_process_in_config $pn && format_print $pn $gn
      done
    done
  else
    # 3	process_name1	列出指定进程的运行信息
    for pn in $@; do
      gn=$(get_group_by_process_name $pn)
      is_process_in_config $pn && format_print $pn $gn
    done
  fi
else
  # 1	无参数			列出配置文件中所有进程的运行信息
  for pn in $(get_all_process); do
    gn=$(get_group_by_process_name $pn)
    is_process_in_config $pn && format_print $pn $gn
  done
fi
