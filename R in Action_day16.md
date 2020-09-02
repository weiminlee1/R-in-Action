---
title: "R in Action_day16"
author: "weiminlee"
date: "9/2/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## t检验


```{r}
## 对两个组进行比较，针对两组的独立样本t检验可以用于检验两个总体的均值相等的假设
## 假设两组数据独立，并且是从正态分布总体中抽得
## t.test(y~x, data)
## t.test(y1, y2)
## t检验默认假定方差不相等，并使用welsh的修正自由度。可以添加参数var.equal=True来假定方差相等，并使用合并方差估计
## 默认的备择假设是双侧的（即均值不相等，但大小的方向不确定）可以添加参数alternative="less"或者alternative="greater"来进行有方向的检验
```

### 独立样本的t检验
```{r}

## 以下为假设方差不等的双侧检验，比较group1和group0各州的监禁概率

library(MASS)
t.test(Prob ~ So, data = UScrime)

## H0:group1, group0拥有相同监禁概率
```

### 非独立样本的t检验
```{r}
## 非独立样本的t检验假定组间的差异呈正态分布

## t.test(y1, y2, paired=TRUE)
## 其中的y1和y2为两个非独立组的数值向量

library(MASS)
sapply(UScrime[c("U1", "U2")], function(x)(c(mean=mean(x), sd=sd(x))))

with(UScrime, t.test(U1, U2, paired = TRUE))
```

## 多于两组的情况
### 多于两组之间进行比较，如果能够假设数据是从正态分布中独立抽样而得的，可以使用方差分析


## 组间差异的非参数检验
### 如果数据无法满足t检验和方差的参数假设，可以转而使用非参数方法

### 两组的比较(两组数据独立)
```{r}
## 若两组数据独立，可以使用Wilcoxon秩和检验（也称Mann-Whitney U检验）来评估观测是否是从相同的概率分布中抽得的（即，在一个总体中获得更高得分的概率是否比另一个总体要大）

## wilcox.test(y ~ x, data)
## wilcox.test(y1, y2)
## 其中的y1和y2为各组的结果变量。可选参数date的取值为一个包含了这些变量的矩阵或者数据框。默认进行一个双侧检验。可以添加参数exact来进行精确检验，指定alternative="less"或者alternative="greater"来进行有方向的检验

with(UScrime, by(Prob, So, median))


wilcox.test(Prob ~ So, data = UScrime)

```
### Wilcoxon符号秩检验是非独立样本t检验的一种非参数替代方法。适用于两组成对数据和无法保证正态性假设的情况
```{r}
sapply(UScrime[c("U1", "U2")], median)
with(UScrime, wilcox.test(U1, U2, paired = TRUE))

```


### 当t检验的假设合理时， 参数检验的功效更强（更容易发现存在的差异）。而非参数检验在假设不合理时（如对于等级有序数据）更适用。



## 多于两组的比较
### 如果无法满足ANOVA设计的假设，那么可以用非参数方法来估计组间的差异。如果各组独立，则Kruskal-Wallis检验将是一种实用的方法，如果各组不独立（如重复测量设计或者随机区组设计）那么Friedman检验更合适


```{r}
## kruskal.test(y ~ A, data)
## 其中的y是一个数值型结果变量，A是一个拥有两个或者更多水平的分组变量（若有两个水平，则它与Mann-Whitney U检验等价）而Friedman检验格式为：

## friedman.test(Y ~ A|B, data)
## 其中的Y是数值型结果变量， A是一个分组变量，而B是一个用以认定匹配观测的区组变量

states <- data.frame(state.region, state.x77)

kruskal.test(Illiteracy ~ state.region, data = states)

## 显著性检验的结果意味着美国四个地区的文盲率各不相同
```

















