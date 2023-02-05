#!/bin/bash

FILE_NAME=$(pwd)'/my.cnf'

function get_all_segments {
  sed -n '/\[.*\]/p' $FILE_NAME | sed -e 's/\[//g' -e 's/\]//g'
}

function count_items_in_segment {
  items=`sed -n "/\[.*$1.*\]/,/\[.*\]/p" $FILE_NAME | grep -v "^#" | grep -v "^$"|grep -v "\[.*\]"`
#  echo $items
  index=0

  for item in $items
  do
    index=`expr $index + 1`
  done
  echo $index
}

for segment in `get_all_segments`
do
echo $segment `count_items_in_segment $segment`
done
