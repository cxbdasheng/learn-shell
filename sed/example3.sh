#!/bin/bash
# 1. 删除 /sbin/nologin 登入的用户
echo '1. 删除 /sbin/nologin 登入的用户'
sed -i '\/sbin\/nologin/d' passwd

# 2. 删除以 mail 开头的行到以 ftp 开头的行
echo ''
echo '2. 删除以 mail 开头的行到以 ftp 开头的行'
sed -i '/^mail/,/^ftp/d' passwd

# 3. 将能登入的用户追加一行 ‘This is user which can login to system' passwd ’
echo ''
echo "3. 将能登入的用户追加一行 'This is user which can login to system passwd'"
sed -i '/\/bin\/bash/a This is user which can login to system' passwd


# 4. 将 sed.txt 内容追加 /sbin/nologin 行后
echo ''
echo '4. 将 sed.txt 内容追加 /sbin/nologin 行后'
sed -i '/root/r sed.txt' passwd

# 5. 将匹配的 /bin/bash 行存入 user_login.txt 中
echo ''
echo '5. 将匹配的 /bin/bash 行存入 user_login.txt 中'
sed -i '/\/bin\/bash/w user_login.txt' passwd

# 6. 将 passwd 文件中 /sbin/nologin 替换 /SBIN/NOLOGIN
echo ''
echo '6. 将 passwd 文件中 /sbin/nologin 替换 /SBIN/NOLOGIN'
sed -i 's/\/sbin\/nologin/\/SBIN\/NOLOGIN/g' passwd

# 7. 显示匹配的行号
echo ''
echo '7. 显示匹配的行号'
sed -n '/\/sbin\/nologin/=' passwd