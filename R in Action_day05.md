---
title: "R in Action_day05"
author: "weiminlee"
date: "8/25/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


## sapply()函数
```{r}
stuname <- c("John Davis", "David Jones")

## string split by blank

name <- strsplit(stuname, " ") ## 以列表形式返回
name

## extract the first name
## 函数sapply()提取列表中每个成分的第一个元素，"["是一个可以提取某个对象的一部分的函数
firstname <- sapply(name, "[", 1) 

firstname
```

## 控制流
```{r}

## for循环
for (i in 1:10){
  print("hello world,")
}

## while循环
i <- 0
while(i < 10){
  print("hello world")
  i <- i + 1
}

## ifelse
## if(cond) statement1 else statement2
i <- 11
if(i==10) print("i==10") else print(i)

## ifelse(cond, statement1, statement2)
i <- 10
ifelse(i==10, print("i==10"), print("change i value"))
```

















