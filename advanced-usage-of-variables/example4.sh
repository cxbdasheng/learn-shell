#!/bin/bash
index=1
for user in `cat /etc/passwd |cut -d ":" -f 1`
do
        echo "This is $index user: $user"
        index=$(($index+1))
done
