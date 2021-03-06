# Title: "Regression Inference"
# Name:

# Load required functions and packages
library(tidyverse)
library(smodels)
library(forcats)
library(ggrepel)

theme_set(theme_minimal())

##############################################################################
# 01. Let's read the diamonds dataset into R:

diamonds <- read_csv("https://statsmaths.github.io/stat_data/diamonds.csv")

##############################################################################
# 02. Fit a linear regression predicting the diamond price as a function of
# its weight (carats). Print out the regression table without any confidence
# intervals.



# How would you interpret the slope coefficient in this model?

# Answer:

##############################################################################
# 03. Now, print the same model as in the previous question but add a 95%
# confidence interval.



# What range of values does the confidence interval give for the intercept
# in this model?

# Answer:

# What range of values does the confidence interval give for the slope
# in this model?

# Answer:

# Would you be surprised if we re-ran the experiment exactly the same way
# and found a slope estimate equal to 5500?

# Answer:

# Would you be surprised if we re-ran the experiment exactly the same way
# and found a slope estimate equal to 7760?

# Answer:

##############################################################################
# 04. The biggest use of confidence intervals, at least for us, is to
# determine whether the confidence interval for a slope contains only values
# that are all negative, all positive, or a mix of both.
#
# Why might this be important? Let's look at our diamond example. Describe the
# meaning of the slope in this linear regression:
#
# Answer:

# Therefore, if the confidence interval has only positive values, what we can
# fairly confidently say is that there is a positive relationship between
# diamond weight and its price.

##############################################################################
# 05. Fit a regression model on the diamonds dataset, predicting the price as
# a function of depth. Compute the regression table using level equal to .95:


# What does the model predict will be the price of a diamond with a depth of
# 60?


# Answer:

##############################################################################
# 06. Describe in words the estimate of the slope in terms of the problem.

# Answer:

##############################################################################
# 07. Using the regression table from the previous question, does the
# confidence interval contain only values that are positive, only values that
# are negative, or values that are both positive and negative?

# Answer:

# Interpret this in words (my words, not the formal definition).

# Answer:

##############################################################################
# 08. While we lose the nice graphical summary, it is possible to build linear
# models with more than one variable and an intercept. In the diamond example,
# for instance, we can fit a model that has both depth and carat in it:

model <- lm_basic(price ~ 1 + carat + depth, data = diamonds)
reg_table(model, level = 0.95)

# Notice that switching the order of the inputs does not change the estimates
# or confidence intervals; only the order in the output is modified, but this
# is inconsequential:

model <- lm_basic(price ~ 1 + depth + carat, data = diamonds)
reg_table(model, level = 0.95)

##############################################################################
# 09. Using the model in the previous question, what do you expect will be the
# price of a diamond with a depth of 50 that weights 2 carats?


# Answer:

##############################################################################
# 10. Are both of the slopes in the model statistically significant? What are
# their signs?

# Answer:

##############################################################################
# 11. Use the `add_prediction` function to add predictions from this model
# back into the diamonds dataset.


# What is the largest positive residual?


# Answer:

##############################################################################
# 12. Interpreting the meaning of the slopes in a regression model with
# multiple variables changes slightly from the version with a single slope.
# Each slope measures the change in the response give a change in its
# corresponding value, when holding the other variables in the model fixed.
# This last part is actually important and we will see some examples that at
# first seem counterintuitive that make sense once we remember this caveat.
#
# Describe the meaning the slopes in the regression model above.

# Answer:

##############################################################################
# 13. Notice that we can do some comparisons quickly with the slope estimates.
# For example, if we have two diamonds with the same depth where one is 1
# carat in weight and the other is 2 carats in weight, how much more do you
# expect the heavier diamond to cost?

# Answer:

##############################################################################
# 14. (Practice) Load and summarize the Chicago crime data again:

crimes <- read_csv("https://statsmaths.github.io/stat_data/chi_crimes_2016.csv")
ca <- read_csv("https://statsmaths.github.io/stat_data/chicago_meta.csv")
crimes_ca <- group_summarize(crimes, area_number)
crimes_ca <- left_join(crimes_ca, ca)

# And construct the rate variable for narcotics:

crimes_ca <- mutate(crimes_ca, narcotics_rate = narcotics_sum / num_households * 1000)

##############################################################################
# 15. Run a regression predicting the rate of narcotics crimes as a function
# of median age and compute the regression table:



##############################################################################
# 16. What does the model predict will be the rate of narcotics crimes per
# 1000 households in a community area where the median age is 31?


# Answer:

##############################################################################
# 17. Is the slope in the model above significant? Does the sign fit your
# prior assumptions?

# Answer:

##############################################################################
# 18. Now fit a model that predicts the narcotics rate as a function of both
# median age and the percentage of people who walk to work. From now on, when
# I ask you to fit a regression, print the regression table at a 0.95 level
# as well unless I specifically state to do something else.



# Check each slope for statistically significance and for those that are
# significant describe the sign of their slope.

# Answer:



