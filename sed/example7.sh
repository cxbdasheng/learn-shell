#!/bin/bash
PATH=`pwd`;
# 1. 修改 /etc/passwd 中第 1 行中第 1 个 root 为 ROOT
\cp -f ./passwd PATH
echo '1. 修改 /etc/passwd 中第 1 行中第 1 个 root 为 ROOT'
sed -i '1s/root/ROOT/' passwd
cat passwd

# 2. 修改 /etc/passwd 中第 5 行到第 10 行中所有的 /sbin/nologin 为 /bin/bash
\cp -f ./passwd PATH
echo ''
echo '2. 修改 /etc/passwd 中第 5 行到第 10 行中所有的 /sbin/nologin 为 /bin/bash'
sed -i '5,10s/\/sbin\/nologin/\/bin\/bash/g' passwd
cat passwd

# 3. 修改 /etc/passwd 中匹配到 /sbin/nologin 的行,将匹配到行中的 login 改为大写的 LOGIN
\cp -f ./passwd PATH
echo ''
echo '3. 修改 /etc/passwd 中匹配到 /sbin/nologin 的行,将匹配到行中的 login 改为大写的 LOGIN'
sed -i '/\/sbin\/nologin/s/login/LOGIN/g' passwd
cat passwd

# 4. 修改 /etc/passwd 中从匹配到以 root 开头的行，到匹配到行中包含 mail 的所有行。修改内为将这些所有匹配到的行中的 bin 改为 HADOOP
\cp -f ./passwd PATH
echo ''
echo '4. 修改 /etc/passwd 中从匹配到以 root 开头的行，到匹配到行中包含 mail 的所有行。修改内为将这些所有匹配到的行中的 bin 改为 HADOOP'
sed -i '/^root/,/mail/s/bin/HADOOP/g' passwd
cat ngpasswdinx

# 5. 修改 /etc/passwd 中从匹配到以 root 开头的行，到第 15 行中的所有行，修改内容为将这些行中的 nologin 修改为 SPARK
\cp -f ./passwd PATH
echo ''
echo '5. 修改 /etc/passwd 中从匹配到以 root 开头的行，到第 15 行中的所有行，修改内容为将这些行中的 nologin 修改为 SPARK'
sed -i '/^root/,15s/nologin/SPARK/g' passwd
cat passwd

# 6. 修改 /etc/passwd 中从第 15 行开始,到匹配到以 yarn 开头的所有行，修改内容为将这些行中的 bin 换位 BIN
\cp -f ./passwd PATH
echo ''
echo '6. 修改 /etc/passwd 中从第 15 行开始,到匹配到以 yarn 开头的所有行，修改内容为将这些行中的 bin 换位 BIN'
sed -i '15,/^yarn/s/bin/BIN/g' passwd
cat passwd
