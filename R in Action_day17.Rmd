---
title: "R in Action_day17"
author: "weiminlee"
date: "9/5/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## OLS(普通最小二乘法)回归
目标是通过减少响应变量的真实值与预测值的差值来获得模型参数（截距项和斜率），即使得残差平方和最小
数据必须满足的统计假设：
  正态性，对于固定的自变量值，因变量成正态分布
  独立性，Yi值之间相互独立
  线性，因变量与自变量之间为线性相关
  同方差性，因变量的方差不随自变量的水平不同而变化，也可称为不变方差

## lm()拟合回归模型


myfit <- lm(formula, data)
~左边为响应变量，右边为各个预测变量，预测变量之间用+符号分隔            :号表示预测变量间的交互项，比如通过x,z及x与z的交互项来预测y，y~ x+z+x:z
* 表示所有可能交互项的简洁方式，y~x*z*w展开为y~x+z+w+x:z+x:w+z:w+x:z:w
.表示包含除因变量外的所有变量，数据框包含x,y,z,w，y~.展开为y~x+z+w
I()从算术的角度来解释括号中的元素
-1表示删除截距项，y~x-1拟合y在x上的回归，并强制直线通过原点
summary()展示拟合的详细结果
coefficients()列出拟合模型的模型参数（截距项和斜率）
confint()提供模型参数的置信区间（默认为95%）
fitted()列出拟合模型的预测值
residuals()列出拟合模型的残差值
anova()生成一个拟合模型的方差分析表，或者比较两个或者更多拟合模型的方差分析表
AIC()输出赤池信息统计量
predict()用拟合模型对新的数据集预测响应变量值

#### 当回归模型包含一个因变量和一个自变量时，我们称为简单线性回归
#### 当只有一个预测变量，但同时包含变量的幂，我们称为多项式回归

## 简单线性回归

```{r}
fit <- lm(weight~height, data = women)
summary(fit)



plot(women$height, women$weight, xlab = "Height", ylab = "Weight")
abline(fit)
```
根据结果得到 Y(w) = 3.45*X(h) - 87.5
R平方项（0.991）表明模型可以解释体重99.1%的方差，它也是实际和预测值之间相关系数的平方

## 多项式回归
可以通过添加一个二次项X2来提高回归的预测精度

```{r}
fit2 <- lm(weight ~ height + I(height^2), data = women)
summary(fit2)
```



