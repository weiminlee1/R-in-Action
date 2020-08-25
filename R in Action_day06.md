---
title: "R in Action_day06"
author: "weiminlee"
date: "8/25/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 整合与重构数据

## 转置数据
```{r}


cars <- mtcars[1:5,1:4]
cars

## 行列变换
newcars <- t(cars)

newcars

```

## 整合数据
```{r}

## aggregate(x, by, fun) by变量可以使用预先定义好的函数来折叠数据，by是一个变量名组成的列表，这些变量将被去掉以形成新的观测，fun则是用来计算描述统计量的表量函数，它将被用来计算新观测中的值

options(digits = 3)
attach(mtcars)

aggdata <- aggregate(mtcars, by=list(cyl), FUN = max, na.rm=T)

aggdata

```


## reshape2 包
```{r}
## 将数据融合melt，以使每一行都是唯一的标识符-变量组合，然后将数据重铸cast为想要的形状

library(reshape2)
mydata <- data.frame("ID"=c(1,1,2,2), "Time"=c(1,2,1,2), "X1"=c(5,3,6,2), "X2"=c(6,5,1,4))
mydata

## 融合
md <- melt(mydata, id=c("ID", "Time"))
md
## 注意，必须指定要唯一确定每个测量所需的变量（ID和Time），而表示测量变量名的变量（X1，X2）将由程序为你自动创建

## 重铸
## dcast()函数读取已经融合的数据，并使用提供的公式和一个用于整合数据的函数将其重塑

## newdata <- dcast(md, formula, fun.aggregate)
## 公式： rowvar1 + rowvar2 +... ~ colvar1 + colvar2 + ...; rowvar1 + rowvar2 +...定义了要划掉的变量整合，已确定各行的内容，而colvar1 + colvar2 + ...则定义了要划掉的，确定各列内容的变量集合。

newdata <- dcast(md, ID ~variable, mean) ##ID代表要呈现的行名，variable代表列名，mean代表列名下的均值

newdata

newdata <- dcast(md, ID + Time ~ variable)
newdata
```














