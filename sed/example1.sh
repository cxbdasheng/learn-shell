#!/bin/bash
# 1. 匹配全部行
echo "1. 匹配全部行"
sed 'p' sed.txt
echo "1. 匹配全部行 -n"
sed -n 'p' sed.txt

# 2. 匹配字符串
echo '';
echo "2. 匹配字符串"
sed -n 'p' sed.txt

# 3. 匹配多个表达式
echo '';
echo "3. 匹配多个表达式"
sed -n -e '/python/p' -e '/PYTHON/p' sed.txt

# 4. 指定文件执行
echo '';
echo "4. 指定文件执行"
sed -n -f edit.sed sed.txt

# 5. 匹配扩展正则表达式
echo '';
echo "5. 匹配扩展正则表达式"
sed -n -r '/python|PYTHON/p' sed.txt

# 6. 替换字符串
echo '';
echo "6. 替换字符串"
sed -n 's/love/like/g;p' sed.txt
echo "6. 替换字符串 -i"
sed -i 's/love/like/g' sed.txt
cat sed.txt
