# Association Example
# Commercial Usage: Market Basket Analysis
# Learning Type: unsupervised

# C:/Users/XX/Documents/R/win-library/3.2/arules/data/
# Dataset Description: Groceries - bound to "arules package"
# setwd("C:/Users/XX/Documents/R/win-library/3.2/arules/data")

install.packages("arules")
library("arules")
library("arulesViz")
require(arules)

#Using the example dataset -- Groceries -- in the "arules" package
data(Groceries)
Groc <- read.transactions("C:/Users/XX/Documents/R/win-library/3.2/arules/data/Groceries.rda")
data("Groceries")
head(Groceries)

# Getting an idea which are the top-30 items
itemFrequencyPlot(Groceries,topN=30, type="absolute")

# Finding the patterns (aka...rules)
# Groceries dataset created 410 rules
# supp =0.00X means that it occured 0.X% in the dataset [LS]
# conf=0.Y means a confidence level of Y% that it occured when the LS happend
rules <- apriori(Groceries, parameter = list(supp=0.001, conf=0.8))
inspect(rules)
summary(rules)
plot(rules,method=NULL, measure="support", shading = "lift", interactive = FALSE, data = NULL, control = NULL)
str(rules)
