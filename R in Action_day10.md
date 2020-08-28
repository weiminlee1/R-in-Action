---
title: "R in Action_day10"
author: "weiminlee"
date: "8/28/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## 核密度图
```{r}

## plot(density(x))
## 其中x是一个数值型向量，由于plot()函数会创建一副新的图形，所以要向一副已经存在的图形上叠加一条密度曲线，可以使用lines()函数

par(mfrow=c(2,1))

d <- density(mtcars$mpg)
plot(d)


d <- density(mtcars$mpg)
plot(d, main = 'kernel density of miles of per gallon',
     xlab = 'mpg', ylab = 'density')

polygon(d, col = 'red', border = 'blue') ##polygon根据顶点的x和y坐标，绘制了多边形。
rug(mtcars$mpg, col = 'brown') ##添加棕色的轴须图

```

## 可比较的核密度图

```{r}
library(sm)
## sm package
## sm.density.compare(x, factor) ## factor是一组分组变量
attach(mtcars)
cyl.f <- factor(cyl, levels = c(4,6,8),
                labels = c('4 cylinder', '6 cylinder',
                           '8 cylinder'))
sm.density.compare(mpg, cyl, xlab='miles per gallon')
title(main='mpg distribution by car cylinders')

colfill <- c(2: (1+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill = colfill)

detach(mtcars)
```











