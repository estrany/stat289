# Title: "Chicago Crime Data"
# Name:

# Load required functions and packages
library(tidyverse)
library(smodels)
library(forcats)
library(ggrepel)

theme_set(theme_minimal())

##############################################################################
# 01. Today we are going to look at a significantly larger dataset. Each row
# of the data refers to a single reported crime in the City of Chicago:

crimes <- read_csv("https://statsmaths.github.io/stat_data/chi_crimes_2016.csv")

# The available variable are:
#
#   area_number    - the community area code of the crime; a number from 1-77
#   arrest_flag    - whether the crime resulted in an arrest; 0 is false and
#                    1 is true
#   domestic_flag  - whether the crime is classified as a domestic offense; 0
#                    is false and 1 is true
#   night_flag     - did the crime occur at night (9pm - 3am); 0 is false and
#                    1 is true
#   burglary       - was the crime classified as a burglary? 0 is false and 1
#                    is true
#   theft          - was the crime classified as a theft? 0 is false and 1 is
#                    true
#   battery        - was the crime classified as a battery? 0 is false and 1
#                    is true
#   damage         - was the crime classified as a damage? 0 is false and 1
#                    is true
#   assault        - was the crime classified as an assault? 0 is false and 1
#                    is true
#   deception      - was the crime classified as criminal deception? 0 is false
#                    and 1 is true
#   robbery        - was the crime classified as a robbery? 0 is false and 1
#                    is true
#   narcotics      - was the crime classified as a narcotics violation? 0 is
#                    false and 1 is true

##############################################################################
# 02. We also have metadata about each community area within Chicago as well.
# We will see how to use these shortly.

ca <- read_csv("https://statsmaths.github.io/stat_data/chicago_meta.csv")

#   area_number        - the community area code; a number from 1 to 77
#   area_name          - popular name of the community area
#   median_age         - the median age of all residents in the community area
#   num_households     - total number of households
#   family_households  - percentage of households classified as a `family'
#                        (domestic partners, married couples, and one or more
#                        parents with children)
#   family_w_kids      - percentage of households with children under the age
#                        of 18
#   owner_ratio        - ratio of households that own or mortgage their
#                        primary residence
#   mean_travel_time   - average commute time
#   percent_walk       - percentage of commuters who walk to work (0-100)
#   median_income      - median household income
#   perc_20_units      - percentage of residential buildings with 20 or more
#                        units

##############################################################################
# 03. As before, it will be useful to group summarize the dataset and join the
# metadata.

crimes_ca <- group_summarize(crimes, area_number)
crimes_ca <- left_join(crimes_ca, ca)

# You may need to re-run this with additional groups or filters depending on
# your question for today.

##############################################################################
# 04. Address one of the following prompts. Your end goal should be to produce
# a data visualization (make sure to include labels) and a 1-2 sentence thesis
# statement. Straight from Wikipedia, a thesis statement: "offers a concise
# summary of the main point or claim of the essay, research paper, ect."
# Export your graph

# Note, these questions are jumping off points. You can deviate or extend
# from them if something related strikes your interest.



# (A) How is the rate of battery crimes (that is the number of crimes per
# household) effected by how central a neighborhood is to the city of Chicago?
# Centrality can be measured by several variables, including the percentage
# of people who walk to work, number of households living in buildings with
# 20+ units, or total commute time. You may want to differentiate between
# crimes at night and those during the day.



# (B) What proportion of narcotics violations result in an arrest by neighborhood?
# Do any features of a neighborhood seem to effect this rate? If you see any
# outliers try to document and explain these.



# (C) What is the relationship between the overall arrest rate and the
# crime rate in a given neighborhood? Does income effect or correlate
# with these in any expected or unexpected ways?



# (D) How does the relationship between income and the rate of burglaries
# change between day and nighttime? You may want to highlight 1-2 particular
# neighborhoods to make your point.



# (E) Robbery and theft are similar crimes, the difference being that robbery
# involves taking something by force whereas theft is simply the taking of
# another's property. Considering only crimes at night, how does the ratio
# of robberies to the number robberies and thefts relate to demographics
# in each neighborhood. Try to find a particularly interesting or predictive
# demographic.



# (F) There are 6 community areas where over 47% of households have
# children. How does the relationship between the number of crimes
# that occur and night and the arrest rate in each neighborhood compare
# between these 9 areas and the others?



# (G) How does the relationship between income and the rate of assault
# change between day and nighttime? You may want to highlight any particularly
# interesting outliers.



