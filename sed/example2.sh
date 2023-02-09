#!/bin/bash
PATH=`pwd`;
# 1. 直接打印第 10 行
\cp -f ./passwd PATH
echo '1. 直接打印第 10 行'
sed -n '10p' passwd

# 2. 指定起始行号和结束行号
\cp -f ./passwd PATH
echo ''
echo '2. 指定起始行号和结束行号'
sed -n '1,10p' passwd

# 3. 指定起始行号，然后后面 N 行
\cp -f ./passwd PATH
echo ''
echo '3. 指定起始行号，然后后面 N '
sed -n '8,+2p' passwd

# 4. 正则表达式匹配的行 【常用】
\cp -f ./passwd PATH
echo ''
echo '4. 正则表达式匹配的行 【常用】'
sed -n '/^root/p' passwd

# 5. 从匹配到 pattern1 的行,到匹配到 pattern2 【常用】
\cp -f ./passwd PATH
echo ''
echo '5. 从匹配到 pattern1 的行,到匹配到 pattern2 【常用】'
sed -n '/^ftp/,/^mail/p' passwd


# 6. 从指定行号开始匹配，直到匹配到 pattern1 的内容
\cp -f ./passwd PATH
echo ''
echo '6. 从指定行号开始匹配，直到匹配到 pattern1 的内容'
sed -n '8,/operator/p' passwd

# 7. 从 pattern1 匹配的行开始，直到匹配到指定行
\cp -f ./passwd PATH
echo ''
echo '7. 从 pattern1 匹配的行开始，直到匹配到指定行'
sed -n '/operator/,12p' passwd