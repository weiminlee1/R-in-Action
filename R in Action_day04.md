---
title: "R in Action_day04"
author: "weiminlee"
date: "8/21/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 数值和字符处理函数
```{r}
x = 9
y = -9
abs(y) ##返回绝对值
sqrt(x) ##平方根

ceiling(x) ## 不小于x的最小整数
ceiling(3.475) ##返回4

floor(x) ##不大于x的最大整数
floor(3.475) ##返回3

trunc(x) ##向0的方向截取的x中的整数部分
trunc(5.99) ##返回5

round(x, digits = n) ##将x舍入为指定的有效数字位数

round(3.475, digits = 2) ##返回3.48

log(x, base = n) ##对x取以n为底的对数

exp(x) 指数函数

```

## 统计函数
```{r}
x = c(1,2,3,4)

mean(x)

median(x)

sd(x) ##标准差

var(x) ##方差

quantile(x, probs = c(.25,.95)) ##求分位数，其中x为待求分位数的数值型向量，probs为一个由[0,1]之间的概率值组成

#求x 的30%和84%的分位点
y <- quantile(x, c(.3, .84))


range(x) ##求值域
x <- c(1,2,3,4)
range(x) ##返回c(1,4)

sum(x)
min(x)
max(x)

scale(x, center = T, scale = T) 
##为数据对象x按列进行中心化(center=T)或者标准化(center=T, scale=T)
##默认情况下，函数scale()对矩阵或者数据框的指定列进行均值为0，标准差为1的标准化


set.seed(1234) ##显示指定种子，让结果可以重现
runif(15) ##生成0到1区间上服从均匀分布的伪随机函数

```

## 字符处理函数
```{r}
x <- c('ab', 'cde', 'fghij')
nchar(x) ##计算x中的字符数量
nchar(x[3]) ##返回5

substr(x, start, stop) ##提取或替换一个字符向量中的子串

x <- 'abcdef'
substr(x, 2, 4) ##返回bcd
substr(x, 2, 4) <- '222' ##bcd 被替换为222

grep(pattern, x, ignore.case = F, fixed = F) 
## 在x中搜索某种模式， 若fixed=F, 则pattern为一个正则表达式。
## 若fixed=T，则pattern为一个文本字符串。返回值为匹配的下标

grep("A", c("b", "A", "c"), fixed = T) ##返回值为2


sub(pattern, replacement, x, ignore.case = F, fixed = T)
## 在x中搜索pattern， 并以文本replacement将其替换。若fixed=F， 则pattern为一个正则表达式
## 若fixed=T，则pattern为一个文本字符串

sub("\\s", ".", "hello world") ##返回值是hello.world

strsplit(x, split, fixed = F) ##在split处分割字符向量x中的元素

paste(..., sep = "") ##连接字符串，分隔符为sep
paste("x", 1:3, sep = "") ##返回值为c("x1", "x2", "x3")


toupper(x) ##大写转换

tolower(x) ##小写转换

```

## 其他实用函数
```{r}
length(x) ##对象x的长度

seq(from, to, by) ##生成一个序列

rep(x, n) ##将x重复n次

cat("a", "\b.\n", "b", file = "myfile") 
##连接a,.,b，并将其输出到屏幕上或者文件上
##当cat输出连接后的对象时，他会将每个对象用空格空开，这就是在句号之前使用退格转义字符（\b）的原因
```

## apply()函数
```{r}

apply(x, MARGIN, FUN) ##x为数据对象， MARGIN是维度的下标，Fun是由你指定的函数
## margin=1表示行
## margin=2表示列
















