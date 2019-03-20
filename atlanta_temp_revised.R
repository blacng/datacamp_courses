# load packages
library(ggplot2)
library(stringr)
library(tidyr)
library(dplyr)
library(lubridate)
library(scales)
library(here)

#Read data
tempdata <- here(read.table("https://d37djvu3ytnwxt.cloudfront.net/assets/courseware/v1/592f3be3e90d2bdfe6a69f62374a1250/asset-v1:GTx+ISYE6501x+3T2017+type@asset+block/temps.txt", header = T)) 

#Remove 'X' in the variable names
colnames(tempdata) <- str_replace(colnames(tempdata), "X", "")

# check
glimpse(tempdata)

##Use tidyr() to restructure temp_df
tidy_temp_atlanta <- gather(tempdata, YEAR, TEMP, -DAY)

# set day to date:
tidy_temp_atlanta$DAY <- as.Date(tidy_temp_atlanta$DAY, format = "%d-%b")

glimpse(tidy_temp_atlanta)

##Plot geom_line with facet
ggplot(tidy_temp_atlanta, aes(DAY, TEMP, group = 1)) +
  geom_line(colour = "blue") +
  facet_wrap(~YEAR, ncol = 4)

# use scale_x_date() to adjust labels, etc.
