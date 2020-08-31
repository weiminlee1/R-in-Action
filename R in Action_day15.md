---
title: "R in Action_day15"
author: "weiminlee"
date: "8/31/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 相关

## 相关的类型
## 包括Pearson相关系数，Spearman相关系数，Kendall相关系数，偏相关系数
## 1，Pearson积差相关系数衡量了两个定量变量之间的线性相关程度
## Spearman等级相关系数衡量分级定序变量之间的相关程度
## Kendall's Tau相关系数也是一种非参数的等级相关度量
## cor()函数可以计算这三种相关系数
## cor(x, use= , method= ) 默认为pearson
## cov()函数可以用来计算协方差

```{r}
states <- state.x77[, 1:6]
cov(states)


cor(states)

cor(states, method = "spearman")
```

## 偏相关
## 偏相关是指在控制一个或者多个定量变量时，另外两个变量定量之间的相互关系。可以使用ggm包中的pcor()函数计算偏相关系数


## 相关性的显著性检验

## 在计算好相关系数以后，如何对他们进行统计显著性检验呢，常用的原假设为变量间不相关（即总体的相关系数为0)
## 可以使用cor.test()函数对单个的Pearson，Spearman和Kendall相关系数进行检验
## cor.test(x, y, alternative= , method= )

## 其中的x和y为要检验相关性的变量，alternative则用来指定进行双侧检验或者单侧检验
## method用以指定要计算的相关类型。当研究的假设为总体的相关系数小于0时，请使用alternative=less
## 在研究的假设为总体的相关系数大于0时，应使用alternative=greater
## 默认情况下，假设为alternative=two.side, 总体相关系数不等于0


```{r}
cor.test(states[,3], states[,5]) ##检验预期寿命和谋杀率的相关系数为0的原假设

## 假设总体的相关度为0，则预计在一千万次中只会有少于一次的机会见到0.703这样大的样本相关度。由于这种情况几乎不可能发生，所以可以拒绝原假设。
```


















