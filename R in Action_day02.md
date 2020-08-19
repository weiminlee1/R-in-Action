---
title: "R in Action_day02"
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

##管理R工作空间的函数
```{r}
getwd() ##显示当前的工作目录
setwd("mydir") ##修改当前的工作目录为mydir
ls() ##列出当前工作空间中的对象
rm(objectlist) ##移除一个或多个对象
options() ##显示或者设置当前选项
history() ##显示最近使用过的命令
save.image("myfile") ##保存工作空间到文件myfile中，默认值为.RData
save(objectlist, file='myfile') ##保存指定对象到一个文件中
load("myfile")  ##读取一个工作空间到当前会话中
q() ##退出R 
```


##管理R工作空间的命令
```{r}
setwd(getwd())
options()
options(digits = 3) ##显示为具有小数点后三位有效数字的格式
x <- runif(20)
summary(x)
hist(x)
q()
```


##输入和输出
```{r}
## 输入
source("...R") ##在当前会话中执行一个脚本

## 文本输出
sink("filename") ##将输出重定向到文件filename中，默认情况下会覆盖，设置append=T，可以实现追加

## 图形输出，使用下列函数保存图形，最后使用dev.off()将输出返回终端
jpeg('filename.jpg') ##jpeg文件输出
png('filename.png') ##png文件输出
svg('filename.svg') ##svg文件输出
pdf('filename.pdf') ##pdf文件输出

```



##数据结构
```{r, comment=""}
##向量
a <- c('one', 1, 'two')

##矩阵
  ##矩阵是一个二维数组，只是每个元素都拥有相同的模式

mymatrix <- matrix(1:20, nrow = 5, ncol = 4)

##数据框
  ##可以由不同的列，列不同模式
patients <- data.frame(patientID, age, diabetes, status)


  ##选取数据框的内容
patients[1:2] ##选取前两列数据
patients[c("age","status")] ##选取age，status两列


attach(mtcars) ##将mtcars数据框添加到搜索路径中
detach(mtcars) ##将mtcars数据框从搜索路径中移除

```


##从外部导入数据
```{r}

##把带分隔符的文件导入数据

mydatafile <- read.table(file, options)
  ##options
    header ##是否第一行为列名
    sep ##设置具体的分隔符
    row.names ##指定具体那列为行名
    col.names ##指定某一行为列名
    na.strings ##把某一字符转换为NA，na.strings="9"则表示把9转为NA
    quote ##用于对有特殊字符的字符串划定界限的字符串
    skip ##跳过前多少行
    stringsAsFactors ##字符向量是否转化为因子
```


##图形参数
```{r}

##指定图形的特征：字体，颜色，坐标轴，标签
#par(font.label=3, cex.lab=1.5, font.main=4, cex.main=2) 

##图形尺寸和边界尺寸
  ##pin 以英寸表示的图形尺寸（宽高）
  ##mai 以数值向量表示的边界大小，逆时针
  ##mar 以数值向量表示的边界大小
#par(pin=c(4,3), mai=c(1, .5, 1, .2))


##plot()添加文本、自定义坐标轴和图例
  ##main() 标题
  ##sub() 副标题
  ##xlab,ylab 坐标轴标签
  ##xlim, ylim 坐标轴范围

##标题
  ##title()函数为图形添加标题和坐标轴标签
#title(main="main title",
#       sub="sub title",
#       xlab="x axis lab",
#       ylab="y axis lab")


##例子
x <- c(1:10)
y <- x
z <- 10/x
opar <- par(no.readonly = T) ##保存当前设置
par(mar=c(5,4,4,8)+0.1) ##增加边界大小
plot(x, y, type = "b",
     pch=21, col='red',
     yaxt='n', lty=3, ann=F) ##绘制x对y的图形

lines(x, z, type = 'b', pch=22, col='blue', lty=2) ##添加x对1/x的直线

axis(2, at=x, labels = x, col.axis='red', las=2) 
axis(4, at=z, labels = round(z, digits = 2), 
     col.axis='blue', las=2, cex.axis=0.7, tck=-.01) ##自定义坐标轴

title("An example of creative axes", xlab = 'x values', ylab = 'y=x')
par(opar)
```

##参考线
```{r}
abline(h=yvalues, v=xvalues)

abline(h=c(1,5,7)) ##在y为1，5，7的位置添加水平线
abline(v=seq(1,10,2), lty=2, col='blue')
```


##图例
```{r}
legend(location, title, legend, ...)

##location 添加图例在整个图形的位置"topleft"
##title图例标题的字符串
##legend图例标签组成的字符型向量
```

##文本标注
```{r}
text(location, "text to place", pos )
##location 文本的位置参数，可以为一对x,y坐标
##pos 文本相对于位置参数的方位，1=下，2=左，3=上，4=右
```

##图形的组合
```{r}
##可以使用函数par()或者layout()组合多幅图形为一幅总括图形
## mfrow=c(nrows, ncols) 来创建按行填充的行数为nrows、列数为ncols的图形矩阵
## mfcol=c(nrows, ncols) 按列填充矩阵
```

##多幅图形布局的精细控制排布或者叠加若干图形来创建单幅的图形，使用fig()函数来实现
```{r}
opar <- par(no.readonly = T)

par(fig=c(0, 0.8, 0, 0.8)) ##横向占据为0~0.8，纵向占据为0~0.8
plot(mtcars$wt, mtcars$mpg, xlab = 'miles per gallon', 
     ylab = 'car weight') ## 设置散点图
     

par(fig=c(0, 0.8, 0.55, 1), new=T) ##横向占据为0～0.8，纵向占据为0.55~1
boxplot(mtcars$wt, horizontal = T, axes=F, col = 'red') ##在上方添加箱线图

par(fig=c(0.65, 1, 0, 0.8), new=T) ##横向占据为0.65～1，纵向占据为0~0.8
boxplot(mtcars$mpg, axes=F, col = 'blue') ##在右侧添加箱线图

par(opar)
```











