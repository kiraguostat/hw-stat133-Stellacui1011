Untitled
================

**Binomial Package** \* Author Name: Stella Cui

**Overview** The R package "Binomial" is a minimal implementation that calculates the relative probability of the certain number of successes in the given total number of trials.

**Steps** 1). Choose the inputs for the binaomial variables You can choose the inputs by using the function bin\_choose(n,k), where n is the total number of trials and k is the number of successes in n trials.

2). Get the probability with the given inputs (number of trials(n), successes(k), and probability(p)) You can get the probability by applying the function bin\_probability(k,n,p) after choosing those three inputs.

3). Get a dataframe with the given inputs (k, n, and prob) After choosing the inputs, you can get a dataframe with a consecutive number of trials from 0 to n and their corresponding probability using the function bin\_distribution(n,p).

4). Plot the probability dataframe Plot the histogram of the probability dataframe got through bin\_distribution(n,p) using the function plot().

5). Getting cumulative probabilities for all possible successes values After choosing the inputs n, k, p, you will get a dataframe with a consequtive number of trails from 0 to nand their corresponding probability p and their commulative probability by the function bin\_cumulative(n,p).

6). Plot cumulative probabilities for all possible successes values Plotting the probability and cumulative dataframe we got before using the function plot().

7). Create a binomial variable with your desired inputs (n and p) You can create a "bin\_var" with the function bin\_variable(n,p).

8). Get a summary of your binomial variable You can use the function summary() to get a summary of binomial variables.

9). Various measure of your binomial variable To get more details of your binomial variables, you can use the following funcions. bin\_mean for the mean of your desired binomial distribution. bin\_variance for the variance of your desired binomial distribution. bin\_mode for the mode of your desired binomial distribution. bin\_skewneww for the skeweneww of your desired binomial distribution. bin\_kurtosis for the mean of your desired binomial distribution.

**Motivation** This package has been developed to illustrate the usage of Binomial Package

**Installation** development version from GitHub install.packages("devtools")

install "Binomial" (without vignettes) devtools::install\_github("<https://github.com/Stellacui1011/github>")

install "Binomial" (with vignettes) devtools::install\_github("stat133", build\_vignettes = TRUE)

**Usage** First, loading the package using library(Binomial) Second, choosing the function you want to test Third, choosing your input, such as the number of trails, that of successes, and probability Fourth, get the output from your inputs and functions

The followings are various examples of using my Binomial package: bin\_choose(n=10,k=1) bin\_probability(1,10,0.1) bin\_dis &lt;- bin\_distribution(n=2,p=0.2) plot(bin\_dis) bin\_cum &lt;- bin\_cumulative(5,0.1) plot(bin\_cum) bin\_example &lt;- bin\_variable(2,0,1) summary(bin\_example) bin\_mean(2,0.1) bin\_variance(2,0.1) bin\_mode(10,0.1) bin\_skewness(10,0.1) bin\_kurtosis(10,0.1)

**trials = n, successes = k, and probability = prob or p**
