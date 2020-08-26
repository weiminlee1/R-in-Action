---
title: "R in Action_day07"
author: "weiminlee"
date: "8/25/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 基本图形



### 条形图
```{r}
library(vcd)
counts <- table(Arthritis$Improved)
counts

#None   Some Marked 
#    42     14     28 

barplot(counts, main = "simple bar plot",
        xlab = "improved",
        ylab = "frequency")

 barplot(counts, main = "simple bar plot",
        xlab = "improved",
        ylab = "frequency",
        horiz = T)

```

### 堆砌条形图和分组条形图
```{r}
library(vcd)

counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

barplot(counts, main = "stacked bar plot",
        xlab = 'treatment',
        ylab = 'frequency',
        col = c('red', 'yellow', 'green'),
        legend = row.names(counts))

barplot(counts, main = "stacked bar plot",
        xlab = 'treatment',
        ylab = 'frequency',
        col = c('red', 'yellow', 'green'),
        legend = row.names(counts), beside = T)
```



### 均值条形图
```{r}
## 排序后均值的条形图
states <- data.frame(state.region, state.x77)

means <- aggregate(states$Illiteracy, by=list(state.region), mean)

means


## 排序
means <- means[order(means$x),]
barplot(means$x, names.arg = means$Group.1, main = 'mean illiteracy rate', ylab = 'mean value')
#title('mean illiteracy rate') ## 添加标题



```











