---
title: "R in Action_day03"
author: "weiminlee"
date: "8/20/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

## 创建新变量
```{r}

mydata <- data.frame(x1 = c(1,2,3,4), 
                     x2 = c(3,4,5,6))

mydata <- transform(mydata, sumx = x1 + x2, 
                    meanx = (x1+x2)/2)

#leadership$age[leadership$age == 99] <- NA ##改变值

#leadership$agecat[leadership$age > 75] <- "elder" ##创建新变量agecat

##exp 按条件增加新列

mydata$samll[mydata$x1 <= 2] <- "smaller"
mydata$large[mydata$x2 >= 4] <- "larger"

mydata
```

## 逻辑运算符
---
运算符    描述
<    小于
<=    小于等于
>    大于
>=    大于等于
==    等于
!=    不等于
!x    非x
x|y    x或者y
x&y    x和y
---

## 变量的重命名

```{r}
names(mydata) ##显示列名
names(mydata)[1] <- "1st colume"

library(plyr)
rename(mydata, c(x2="2nd colume"))

```

## 缺失值
```{r}
is.na(mydata) ##识别是否包含缺失值

x <- c(1,2,NA, 3)
y <- sum(x)
y1 <- sum(x, na.rm = T) ##去除缺失值
y
y1

na.omit(mydata) ##na.omit()可以删除含有缺失数据的行ß
```

## 日期值
```{r}

#as.Date(x, "input_format")
#日期的默认输入格式为yyy-mm-dd
strDates <- c(c("01/05/1965", "08/16/1975"))
dates <- as.Date(strDates, "%m/%d/%Y")
dates

```
## 类型转换
```{r}
mydata <- c('china', 'america', 1, 2)
mydata <- as.character(mydata)
```

## 数据排序
```{r}
##order()排序后返回的是坐标
newdata <- leadership[order(leadership$age),]

newdata <- leadership[order(gender, -age),] ##性别正序，年龄降序排序

```

## 数据集的合并
```{r}

##向数据框中添加列
  ##横向合并两个数据框，使用merge()函数，两个数据框通过一个或多个共有变量进行联结的
total <- merge(dataframea, dataframeb, by=c("ID", "Country"))

  ##cbind()直接横向合并，但是需要同样的行数
cbind(a, b)

##向数据框中添加行，但是需要同样的列
total <- rbind(dataframea, dataframeb)

```

## 数据集取子集
```{r}
##选入变量

newdata <- leadership[, c(6:10)] ##保留第6到第10列

newdata <- leadership['age'] ##获取age列

##丢弃变量

myvars <- names(leadership) %in% c('q3', 'q4')
newdata <- leadership[!myvars] ##舍去q3,q4列

newdata <- leadership[c(-8, -9)] ##舍去第8和第9列

##进入观测

newdata <- leadrship[leadership == "M" &
                       leadership$age > 30, ]

##subset()函数

newdata <- subset(leadership, age>=35 | age<=24,
                  select=c(q1,q2,q3))



```













