---
title: "R in Action_day08"
author: "weiminlee"
date: "8/26/2020"
output:
  html_document: default
  pdf_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 条形图的微调

```{r}
## 条形图搭配标签
library(vcd)
par(mar=c(5,8,4,2)) ##增加y边界大小

par(las=2) ##旋转条形的标签 由垂直转变为水平

counts <- table(Arthritis$Improved)

barplot(counts, 
        main = "treatment outcome",
        horiz = T,
        cex.names = 0.8, 
        col = c("red", "green", "blue"),
        names.arg = c("No improvement",
                      "some improvement",
                      'marked improvement'))

## cex.names调节字体大小，让标签更合适
```

## 饼图
```{r}

par(mfrow=c(2,2)) ##两行两列
slices <- c(10, 12, 4, 16, 8)
lbls <- c('us', 'uk' , 'aus', 'ger', 'fra')

pie(slices, labels = lbls, main = 'simple pie chart')

pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", "%", sep = "" )
pie(slices, labels = lbls2, col = rainbow(length(lbls2)),
    main = 'pie chart with percentage')



library(plotrix)
pie3D(slices, labels = lbls, explode = 0.1,
      main = '3D pie chart')

## 从表格创建饼图
mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, sep = "")
pie(mytable, labels = lbls3, 
    main = 'pie chart from a table\n (with sample sizes)')

```
















