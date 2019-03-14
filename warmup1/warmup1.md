warmup01-Stella-Cui.Rmd
================
Stella Cui
2/3/2019

A character's quote
===================

> "You can work as a mechanic on my team. But when it comes to your mission as a spy, I don't want anything to do with it."
> ―Jarek Yeager, to Kazuda Xiono

Insert a picture
================

![Image of Jarek Yeager](https://goo.gl/images/Rx6szp)

Use markdown table with two columns to include things like species, gender, eye color, etc.
===========================================================================================

JarekYeager &lt;- matrix(c(51,43,22,92,28,21,68),ncol=2,byrow=TRUE) &gt; colnames(JarekYeager) &lt;- c("Category","Attribute") &gt; rownames(JarekYeager) &lt;- c("Species","Gender","EyeColor") &gt; JarekYeager &lt;- as.table(JarekYeager) &gt; JarekYeager

A character's quote
===================

> "You can work as a mechanic on my team. But when it comes to your mission as a spy, I don't want anything to do with it."
> ―Jarek Yeager, to Kazuda Xiono

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

Including Plots
---------------

You can also embed plots, for example:

![](warmup1_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
