#!/bin/bash
# 1. 打印 /etc/passwd 中第 20 行的内容
echo '1. 打印 /etc/passwd 中第 20 行的内容'
sed -n '20p' /etc/passwd

# 2. 打印 /etc/passwd 中从第 8 行开始，到第 15 行结束的内容
echo ''
echo '2. 打印 /etc/passwd 中从第 8 行开始，到第 15 行结束的内容'
sed -n '8,15p' /etc/passwd

# 3. 打印 /ete/passwd 中人第 8 行开始，然后 +5 行结束的内容
echo ''
echo "3. 打印 /ete/passwd 中人第 8 行开始，然后 +5 行结束的内容"
sed -n '8,+5p' /ete/passwd


# 4. 打印 /etc/passwd 中开头匹配 root 字符串的内容
echo ''
echo '4. 打印 /etc/passwd 中开头匹配 root 字符串的内容'
sed -n '/^root/p' /etc/passwd

# 5. 打印 /etc/passwd 中第 8 行开始，到含有 /sbin/nologin 的内容
echo ''
echo '5. 打印 /etc/passwd 中第 8 行开始，到含有 /sbin/nologin 的内容'
sed -n '8,/\/sbin\/nologin/p'  /etc/passwd

# 6. 打印 /etc/passwd 中开头为 root 的行开始，到开头为 halt 的行结束的内容
echo ''
echo '6. 打印 /etc/passwd 中开头为 root 的行开始，到开头为 halt 的行结束的内容'
sed -n '/^root/,/^halt/p' /etc/passwd

# 7. 打印 /etc/passwd 中第一个包含 /bin/bash 内容的行开始，到第 5 行结束的内容
echo ''
echo '7. 打印 /etc/passwd 中第一个包含 /bin/bash 内容的行开始，到第 5 行结束的内容'
sed -n '/\/bin\/bash/,5p' /etc/passwd