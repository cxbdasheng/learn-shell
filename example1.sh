#!/bin/bash
var1="I love you,Do you love me";
echo "var1 = ${var1}";

var2=${var1#*ov}
echo "var2 = ${var2}";

var3=${var1##*ov}
echo "var3 = ${var3}";

var4=${var1%ov*}
echo "var4 = ${var4}";

var5=${var1%%ov*}
echo "var5 = ${var5}";

var6=${var1/love/like}
echo "var6 = ${var6}";

var7=${var1//love/like}
echo "var7 = ${var7}";
