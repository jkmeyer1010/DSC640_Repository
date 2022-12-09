# DSC 640 Data Presentation & Visualization (DSC640-T302 2231-1)
# Bellevue University
# 1.2 Exercises: Charts
# Author: Jake Meyer
# Date: 12/03/2022

# Assignment Instructions: Submit 1 bar chart, 1 stacked bar chart, 1 pie chart,
# and 1 donut chart with R.

# Check your current working directory using `getwd()`
getwd()

# List the contents of the working directory with the `dir()` function
dir()

# Use `setwd()` if needed
setwd("C:/Users/jkmey/Documents/Github/DSC640_Course_Assignments/DSC640_Repository")

# Load the `readxl` library
library(readxl)

# Start by importing the hotdog_contest_winners, hotdog-places, and 
# obama_approval_ratings data.
df1 <- read_excel("weeks1&2/hotdog-contest-winners.xlsm")
df2 <- read_excel("weeks1&2/hotdog-places.xlsm")
df3 <- read_excel("weeks1&2/obama-approval-ratings.xls")

## Load the ggplot2, tidyverse, plotly, and IRdisplay libraries
library(ggplot2)
library(tidyverse)
theme_set(theme_minimal())

# Create a Bar Chart
# https://ggplot2.tidyverse.org/reference/geom_bar.html
# Using `geom_bar()` plot a bar chart of the number of winners by country.
ggplot(df1, aes(x = Country, color = Country)) + geom_bar() + xlab('Country') +
  ylab('Count') + ggtitle('Number of Hot Dog Winners by Country')


# Create a Stacked Bar Chart
# Using geom_bar plot a stacked bar chart.
x = df1$Country
y = df1$`Dogs eaten`
df1$`New record`=as.factor(df1$`New record`)
group = df1$`New record`


ggplot(df1, aes(x = group, y = y, fill = x)) + 
  geom_bar(position = 'stack', stat='identity') + 
  xlab('New Record (0-No, 1-Yes)') + ylab('Number of Hot Dogs Eaten') + 
  ggtitle('Number of Hot Dogs Eaten by Country (New Record Breakdown)') +
  guides(fill = guide_legend(title = "Country")) 

# Create a percent table and data frame for the Pie and Donut Charts
percent_table <- table(c(df1$Country))
x_percent <- percent_table / length(df1$Country)
countries <- unique(df1$Country)
df_percent <- data.frame(x_percent)
colnames(df_percent) <- c('Countries', 'Percent')
y_new = df_percent$Percent
x_new = df_percent$Countries

# Create a Pie Chart
ggplot(df_percent, aes(x = "", y = y_new, fill = x_new)) + geom_col() + 
  coord_polar(theta = "y", start = 1) + 
  ggtitle('Percentage of Hot Dog Eating Champions by Country') +
  geom_text(aes(label = paste0(round(y_new*100), "%")),
             position = position_stack(vjust = 0.5)) +
  guides(fill = guide_legend(title = "Country"))

# Create a Donut Chart
ggplot(df_percent, aes(x=2, y=y_new, fill = x_new)) + geom_col() + 
  coord_polar("y", start = 1) + 
  geom_text(aes(label = paste0(round(y_new*100), "%")),
            position = position_stack(vjust = 0.5)) +
  theme(panel.background = element_blank(), 
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(hjust = 0.5, size =18)) + 
  ggtitle("Percentage of Hot Dog Eating Champions by Country") + xlim(0.5, 2.5) +
  guides(fill = guide_legend(title = "Country"))


