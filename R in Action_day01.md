---
title: "R in Action_weimy_day01"
author: "weiminlee"
date: "8/19/2020"
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
 
## ```{r, prompt/comment/echo/tidy/eval/include/child/collapse, results}```

- 如果希望代码用R的>作为提示符的话，prompt=TRUE
- 如果希望结果不用#保护，comment=""
- 如果不希望显示代码，echo=FALSE
- tidy=T，自动重新排列代码
- eval=T，可以使代码显示而不实际运行
- include=T，本代码段仅运行，代码和结果不写入输出文档
- child="...Rmd"，可以调用另一个Rmd文件的内容
- collapse=T，代码和结果都在一个文本块中显示
- results=选择文本型结果的类型，
  - results='hide'；运行代码后不显示结果
  - results='hold'；运行代码后显示结果




