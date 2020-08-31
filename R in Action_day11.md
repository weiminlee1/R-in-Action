---
title: "R in Action_day11"
author: "weiminlee"
date: "8/28/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


## 箱线图
```{r}
## 箱线图可以展示单个变量或者分组变量
## 最大值，上四分位，中位数，下四分位，最小值
## boxplot(formula, data), formula = Y ~ A*B

boxplot(mtcars$mpg, main="box plot", ylab='miles per gallon')

head(mtcars)
boxplot.stats(mtcars$mpg) ##精确显示统计量

## 跨组比较

boxplot(mpg ~ cyl, data = mtcars,
        main='car mileage data',
        xlab = 'number of cylinders',
        ylab = 'miles per gallon',
        col = c('red', 'green', 'blue'))

```

## 小提琴图
```{r}
## 小提琴图是箱线图和核密度图的结合
## vioplot(x1, x2, ..., names= , col= )
```

## 点图
```{r}
dotchart(x, labels = )
```


