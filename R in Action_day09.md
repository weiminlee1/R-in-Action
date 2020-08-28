---
title: "R in Action_day09"
author: "weiminlee"
date: "8/26/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 直方图
```{r}
## 直方图在x轴上将值域分割为一定数量的组，在y轴上显示相应值的频数
## 参数freq=F表示根据概率而不是频数
## 参数breaks用于控制组的数量

par(mfrow=c(2,2))
hist(mtcars$mpg)

hist(mtcars$mpg, 
     breaks = 12,
     col = 'red',
     xlab = 'miles per gallon',
     main = 'colored histogram with 12 bins')

hist(mtcars$mpg,
     freq = F,
     breaks = 12,
     col = 'blue',
     xlab = 'miles per gallon',
     main = 'histogram rug plot, density curve')
rug(jitter(mtcars$mpg)) ##添加轴须图
lines(density(mtcars$mpg), col = 'orange', lwd=2)

hist(mtcars$mpg,
     freq = F,
     breaks = 12,
     col = 'green',
     xlab = 'miles per gallon',
     main = 'histogram rug plot, density curve')
box() ##添加外框

```
