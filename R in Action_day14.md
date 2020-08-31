---
title: "R in Action_day14"
author: "weiminlee"
date: "8/31/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 独立性检验
## 卡方独立性检验，chisq.test()函数对二维表的行变量和列变量进行卡方独立性检验
```{r}
library(vcd)
mytable <- xtabs(~Treatment + Improved, data = Arthritis) ##治疗情况和改善情况是否独立
chisq.test(mytable)

##p value < 0.05说明治疗情况和改善情况不独立

mytable <- xtabs(~Improved + Sex, data = Arthritis)
chisq.test(mytable)

## pvalue > 0.05 说明改善和性别相互独立
```


## Fisher精确检验
## 可以使用fisher.test()函数进行Fisher精确检验。fisher精确检验的原假设是：边界固定的列联表中行和列是相互独立的
## 调用的格式为fisher.test(mytable)

```{r}
mytable <- xtabs(~Treatment + Improved, data = Arthritis)
fisher.test(mytable)

## pvalue < 0.05 说明治疗和改善情况不独立
## fisher.test()函数可以在任意行列数大于等于2的二维列联表上使用，但不能用于2x2的列联表
```
