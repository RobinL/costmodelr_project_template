library("costmodelr")
library("readr")

key_dates <- readr::read_csv("assumptions_example/key_dates.csv")
oneoff_costs <- readr::read_csv("assumptions_example/oneoff_costs.csv")
recurring_costs <-  readr::read_csv("assumptions_example/recurring_cost.csv")
staff_utilisation <- readr::read_csv("assumptions_example/staff_utilisation.csv")
rate_card <- readr::read_csv("assumptions_example/rate_card.csv")
user_variable_costs <- readr::read_csv("assumptions_example/user_variable_costs.csv")
num_users <- readr::read_csv("assumptions_example/num_users.csv")  

cost_model <- create_cost_model(key_dates) %>%
  add_oneoff_costs(oneoff_costs) %>%
  add_recurring_cost(recurring_costs) %>%
  add_user_variable_costs(num_users, user_variable_costs) %>%
  add_staff_utilisation(staff_utilisation, rate_card) %>%
  run_cost_model()

shiny_vis(cost_model)
shiny_bubble(cost_model)
