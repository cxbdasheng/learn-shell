#!/bin/bash
# var1 = I love you,Do you love me
var1="I love you,Do you love me";
echo "var1 = ${var1}";

# ${变量名#匹配规则} var2 = e you,Do you love me
var2=${var1#*ov}
echo "var2 = ${var2}";

# ${变量名##匹配规则} var3 = e me
var3=${var1##*ov}
echo "var3 = ${var3}";

# ${变量名%匹配规则} var4 = I love you,Do you l
var4=${var1%ov*}
echo "var4 = ${var4}";

# ${变量名%%匹配规则} var5 = I l
var5=${var1%%ov*}
echo "var5 = ${var5}";

# ${变量名/旧字符串/新字符串} var6 = I like you,Do you love me
var6=${var1/love/like}
echo "var6 = ${var6}";

# ${变量名//旧字符串/新字符串} var7 = I like you,Do you like me
var7=${var1//love/like}
echo "var7 = ${var7}";