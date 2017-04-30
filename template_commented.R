# This file provides basic template code for running a cost model using the costmodelr pacakge.
# For further details, including examples of the assumptions files which have been filled out, see the package vignettes,
# by typing browseVignettes("costmodelr") into your console

# Run these if not already installed
# install.packages("devtools")
# install.package("readr)
# install_github("RobinL/costmodelr")

library(costmodelr)
library(readr)

# The 'key dates' file specifies the time period over which the cost model produces estimates
# Input costs outside this date range will be ignored
key_dates <- readr::read_csv("assumptions/key_dates.csv", col_types=readr::cols())

# Read in assumptions from files
oneoff_costs <- readr::read_csv("assumptions/oneoff_costs.csv", col_types=readr::cols())

recurring_costs <-  readr::read_csv("assumptions/recurring_cost.csv", col_types=readr::cols())

staff_utilisation <- readr::read_csv("assumptions/staff_utilisation.csv", col_types=readr::cols())
rate_card <- readr::read_csv("assumptions/rate_card.csv", col_types=readr::cols())

user_variable_costs <- readr::read_csv("assumptions/user_variable_costs.csv", col_types =readr::cols())
users <- readr::read_csv("assumptions/num_users.csv", col_types=readr::cols())  #The model will linearly interpolate between dates

# Add each set of assumptions to model - include only the lines where you're providing a populated assumption file.

cost_model <- create_cost_model(key_dates) %>%
#                 add_oneoff_costs(oneoff_costs) %>%
#                 add_recurring_cost(recurring_costs) %>%
#                 add_user_variable_costs(num_users, user_variable_costs) %>%
#                 add_staff_utilisation(staff_utilisation, rate_card)


# Run model
cost_model <- run_cost_model(cost_model)

# Extract cost dataframe from model - this is a tidy dataset on which you can then perform your own analysis, aggregations and breakdowns
cost_model$cost_dataframe

# Run Shiny app
