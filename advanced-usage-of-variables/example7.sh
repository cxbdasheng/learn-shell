#!/bin/bash

string="Hello world";
declare -r string 
echo "string = $string"

string="zxcvadsf"
echo "string = $string"


num1=100
num2=10
num3=$num1+$num2
echo "num3 = $num3"

declare -i num3
num3=$num1+$num2
echo "num3 = $num3"

declare -f
declare -F

echo $num4

declare -a array
array=("jones" "mike" "kobe" "jordan")
echo "array = ${array[@]}"
echo "array[0] = ${array[0]}"
echo "array[1] = ${array[1]}"
echo "array length = ${#array[@]}"
for v in ${array[@]}
do
    echo $v
done
