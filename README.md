## Shell 编程(八)：学习总结
使用 Linux 时，多多少少会有 shell 需求，一直都是利用搜索引擎搜索 copy 改改，一到深处需各种查（五花八门），遂自学 。虽多多少少平时有用到过，但基础不牢，地动山摇，所以秉着扎好马步，走的更稳原则，重新温习一遍 Shell ，主要参考 [菜鸟教程 ](https://www.runoob.com/linux/linux-shell.html) 和 [慕课](https://coding.imooc.com/class/314.html) 断断续续学习了一个月，边看视频边学习，边学习边写代码记录此过程。
## 章节
- [Shell 编程(一)：Shell 变量的高级用法	](https://www.it927.com/article/50/shell-programming-1-advanced-usage-of-shell-variables)
- [ Shell 编程(二)：Shell 函数的高级用法 ](https://www.it927.com/article/51/shell-programming-2-advanced-usage-of-shell-variables)
- [ Shell 编程(三)：Shell 编程中的常用工具	](https://www.it927.com/article/52/shell-programming-3-common-tools-in-shell-programming)
- [ Shell 编程(四)：文本三剑客之 Grep	](https://www.it927.com/article/53/shell-programming-4-text-grep-of-the-three-musketeers)
- [ Shell 编程(五)：文本三剑客之 Sed	](https://www.it927.com/article/68/shell-programming-5-the-sed-of-the-text-three-musketeers)
- [ Shell 编程(六)：文本三剑客之 Awk](https://www.it927.com/article/69/shell-programming-6-text-awk-of-the-three-musketeerss)
- [ Shell 编程(七)：脚本实战](https://www.it927.com/article/70/shell-programming-7-script-practice)

## 学习心得
学习 shell 需要具备 Linux 基础、正则匹配基础
### 文本三剑客：Grep、Sed、Awk
文本三剑客都可用标准输出和用管道符进行输出
- grep 适合单纯的查找或匹配文本【非常常用】，利用管道符强到飞起
- sed 适合编辑匹配到的文本，常用于正则替换
- awk 适合格式化文本，可利用正则表达式对复杂文本进行处理，筛选到我们想要的结果

### 缩进
缩进这块有点坑，出了问题你也找不到。shell 其实不需要缩进，但是不缩进呢，这代码简直就是天书。

1. if 、for、while... 需缩进，话说我 if 中括号内没有加空格，调试了几个小时没有发现问题，还是后面不小心按空格才发现问题。
2. 赋值(=)前后不能有空格。
3. 文件分隔符一定要选对，否则代码白写，Linux 和 MacOs 上运行建议使用 **LF(\n)**,Windows 运行一定要选 **CRLF(\r\n)**,不然满是包。


### [] 与 ()
shell 缩进是青铜的话，[] 与 () 就是 最强王者，缩进 不好可能会报错，[] 与 () 用不好，代码就只有 bug。
#### 单小括号 ()
单小括号 ()，有三种用途：命令组、命令替换、初始化数组。
1. **命令组**：括号中的命令将会新开一个子 shell 顺序执行，所以括号中的变量不能够被脚本余下的部分使用。括号中多个命令之间用分号隔开，最后一个命令可以没有分号，各命令和括号之间不必有空格。
2. **命令替换**：等同于 \`cmd\`，shell 扫描一遍命令行，发现了 $(cmd) 结构，便将 $(cmd) 中的 cmd 执行一次，得到其标准输出，再将此输出放到原来命令
3. **初始化数组**：array=(a b c d)

#### 双小括号 (( ))
双小括号 (( ))，有四种用途：整数扩展、运行 **C语言** 代码、重定义变量值、算术运算比较。
1. **整数扩展**：((exp)) 结构扩展并计算一个算术表达式的值，如果表达式的结果为0，那么返回的退出状态码为1，或者 是"假"，而一个非零值的表达式所返回的退出状态码将为0，或者是"true"。若是逻辑判断，表达式exp为真则为1,假则为 0
2. **运行 C语言 代码**：(( )) 中的运算符、表达式符合C语言运算规则，都可用在 $((exp)) 中，甚至是三目运算符。作不同进位(如二进制、八进制、十六进制)运算时，输出结果全都自动转化成了十进制。如：echo $((16#5f)) 结果为95 (16进位转十进制)
3. **重定义变量值**：a=5; ((a++)) 可将 $a 重定义为 6
4. **算术运算比较**：(( )) 变量可以不使用 $ 符号前缀。括号内支持多个表达式用逗号分开。 只要括号中的表达式符合 **C语言** 运算规则,可以直接使用 for((i=0;i<5;i++)),如果不使用双括号, 则为 for i in \`seq 0 4\`或者 for i in {0..4}

#### 单中括号 []
单中括号 []，有四种用途：内部命令、比较运算符、字符范围、索引编号
1. **内部命令**：bash 的内部命令，[] 和 test 是等同的。如果我们不用绝对路径指明，通常我们用的都是 bash 自带的命令。if/test 结构中的左中括号是调用 test 的命令标识，右中括号是关闭条件判断的。这个命令把它的参数作为比较表达式或者作为文件测试，并且根据比较的结果来返回一个退出状态码
2. **比较运算符**：Test 和 [] 可用的比较运算符只有==和!=，都是用于字符串比较的，不可用于整数比较，整数比较只能使用 -eq，-gt 这种形式。
3. **字符范围**：用作正则表达式的一部分，描述一个匹配的字符范围
4. **索引编号**：[] 用来引用数组中每个元素的编号

#### 双中括号 [[ ]]
[[ ]] 是 bash 程序语言的关键字。[[ ]] 有四种用途：关键字、字符串的模式匹配、条件判断、单独的元素
1. **关键字**：[[ ]] 结构比 [ ] 结构更加通用。在 [[和]] 之间所有的字符都不会发生文件名扩展或者单词分割，但是会发生参数扩展和命令替换。
2. **字符串的模式匹配**：字符串的模式匹配，使用=~操作符时甚至支持 shell 的正则表达式。字符串比较时可以把右边的作为一个模式，而不仅仅是一个字符串，比如[[ hello == hell? ]]，结果为真。[[ ]] 中匹配字符串或通配符，不需要引号
3. **条件判断**：使用 [[ ... ]] 条件判断结构，而不是 [ ... ]，能够防止脚本中的许多逻辑错误。比如，&&、||、<和> 操作符能够正常存在 于[[ ] ]条件判断结构中，但是如果出现在[ ]结构中的话，会报错。比如可以直接使用 if [[ $a != 1 && $a != 2 ]], 如果不适用双括号, 则为if [ $a -ne 1] && [ $a != 2 ]或者 if [ $a -ne 1 -a $a != 2 ]。
4. **单独的元素**：可看作一个单独的元素，并返回一个退出状态码。

例子：
```bash
if ($i<5)      #此处有问题,改为if (($i<5))
if [ $i -lt 5 ]  
if [ $a -ne 1 -a $a != 2 ]  
if [ $a -ne 1] && [ $a != 2 ]  
if [[ $a != 1 && $a != 2 ]]  
   
for i in $(seq 0 4);do echo $i;done  
for i in `seq 0 4`;do echo $i;done  
for ((i=0;i<5;i++));do echo $i;done  
for i in {0..4};do echo $i;done  
```

> 更多括号问题可参考： [shell中各种括号的作用()、(())、[]、[[]]、{}](https://blog.csdn.net/taiyang1987912/article/details/39551385)

## 章节代码
- [Shell 函数的高级用法 章节代码 ](https://github.com/cxbdasheng/learn-shell/tree/main/advanced-usage-of-variables)
- [Shell 函数的高级用法 章节代码](https://github.com/cxbdasheng/learn-shell/tree/main/advanced-usage-of-function)
- [文本三剑客之 Grep 章节代码](https://github.com/cxbdasheng/learn-shell/tree/main/grep)
- [文本三剑客之 Sed 章节代码](https://github.com/cxbdasheng/learn-shell/tree/main/sed)
- [文本三剑客之 Awk 章节代码](https://github.com/cxbdasheng/learn-shell/tree/main/awk)
- [脚本实战 章节代码](https://github.com/cxbdasheng/learn-shell/tree/main/best-practices)


## 参考 & 引用
- [Shell 教程 | 菜鸟教程](https://www.runoob.com/linux/linux-shell.html)
- [掌握Shell脚本编程 360架构师带你进阶Linux高手](https://coding.imooc.com/class/314.html)