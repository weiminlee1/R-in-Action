---
title: "R in Action_day13"
author: "weiminlee"
date: "8/31/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 频数表和列联表
```{r}
library(vcd)
head(Arthritis)


## table()函数
## table(var1, var2, ..., varN) 使用N个类别型变量（因子）来创建一个N维列联表

##一维列联表
mytable <- with(Arthritis, table(Improved))
mytable

##可以使用prop.table()将这些频数转化为比例值

prop.table(mytable)

##或者使用prop.table()*100转化为百分比
prop.table(mytable)*100


##二维列联表
## mytable <- table(A, B)
## A是行变量， B是列变量

mytable <- with(Arthritis, table(Improved, Sex))
mytable

##xtabs()函数还可以使用公式风格的输入创建列联表
##mytable <- xtabs(~A+B, data = mytable)
mytable <- xtabs(~ Improved + Sex, data = Arthritis)
mytable

##三维列联表

mytable <- xtabs(~ Treatment + Sex + Improved, data = Arthritis)
mytable

```

