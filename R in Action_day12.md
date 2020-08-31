---
title: "R in Action_day12"
author: "weiminlee"
date: "8/29/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 基本统计分析

## summary()函数获取描述性统计量
```{r}
myvars <- c("mpg", "hp", "wt")
summary(mtcars[myvars])

## summary()函数提供了最小值，四分位数，最大值，均值，以及因子向量和逻辑向量的频数统计
```

## 通过sapply()函数计算描述性统计量
``` {r}

## sapply(x, Fun, options)
mystats <- function(x, na.omit=F){
                     if(na.omit)
                       x <- x[!is.na(x)]
                     m <- mean(x)
                     n <- length(x)
                     s <- sd(x)
                     skew <- sum((x-m)^3/s^3)/n
                     kurt <- sum((x-m)^4/s^4)/n-3
                     return(c(n=n, mean=m, stdev=s,
                              skew=skew, kurtosis=kurt))}

 myvars <- c("mpg", "hp", "wt")
 result <- sapply(mtcars[myvars], mystats)
 result
```

## pastecs包中stat.desc()函数，可以计算种类繁多的描述性统计量
```{r}

## stat.desc(x, basic=T, desc=T, norm=F, p=0.95)
## 若basic=T，则计算其中所以值，空值，缺失值的数量，以及最小值，最大值，值域还有总和
## 若desc=T，则计算中位数，平均数，平均数的标准误，平均数置信度为95%的置信区间，方差，标准差，变异系数
## 若norm=T，则返回正态分布统计量和shapiro-wilk正态检验结果

library(pastecs)
myvars <- c("mpg", "hp", "wt")
stat.desc(mtcars[myvars])
```

## 分组计算描述性统计量
```{r}

## 使用aggregate()分组获取描述性统计量

myvars <- c("mpg", "hp", "wt")
aggregate(mtcars[myvars], by=list(am=mtcars$am), mean)

aggregate(mtcars[myvars], by=list(am=mtcars$am), sd)


## 如果有多个分组变量，可以使用by=list(name1=groupvar1, name2=groupvar2, ..., nameN=groupvarN)
## aggregate()仅允许在每次调用中使用平均数，标准差这样的单反回值函数，无法一次返回若干个统计量，可以使用by()函数实现

## by(data, INDICES, FUN) data是一个数据框，INDICES是一个因子组成的列表，定义了分组，FUN是任意函数

dstas <- function(x)sapply(x, mystats)

by(mtcars[myvars], mtcars$am, dstas)
```





