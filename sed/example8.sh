#!/bin/bash
PATH=`pwd`;
# 1. passwd 文件匹配到 /bin/bash 的行后面追加 "Insert Line For /bin/bash Behind"
\cp -f ./passwd PATH
echo '1. passwd 文件匹配到 /bin/bash 的行后面追加 "Insert Line For /bin/bash Behind"'
sed -i '/\/bin\/bash/a Insert Line For /bin/bash Behind' passwd
cat passwd

# 2. passwd 文件每一行前面都追加 "Insert Line Before Every Line"
\cp -f ./passwd PATH
echo ''
echo '2. passwd 文件每一行前面都追加 "Insert Line Before Every Line"'
sed -i 'Insert Line Before Every Line' passwd
cat passwd

# 3. 将 /etc/vconsole.conf 文件内容追加到 passwd 文件中特定行后面，匹配以 ftp 开头的行，到第 18 行的所有行
\cp -f ./passwd PATH
echo ''
echo '3. 将 /etc/vconsole.conf 文件内容追加到 passwd 文件中特定行后面，匹配以 ftp 开头的行，到第 18 行的所有行'
sed -i '/^ftp/,18r /etc/vconsole.conf' passwd
cat passwd

# 4. 将 passwd 文件从第 10 行开始，到匹配到 hdfs 开头的所有行内容追加到 /tmp/sed-1.txt
\cp -f ./passwd PATH
echo ''
echo '4. 将 passwd 文件从第 10 行开始，到匹配到 hdfs 开头的所有行内容追加到 /tmp/sed-1.txt'
sed -i '10,/^hdfs/w /tmp/sed-1.txt' passwd
cat /tmp/sed-1.txt