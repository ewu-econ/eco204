

## Loading Packages,

library(readxl)
library(dplyr)
library(ggplot2)
library(stargazer)

# to avoid scientific notation
options(scipen = 100)                                                     



## Load the data directly

showtime_data <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/6_Summer_2025/ECO204/eco204_summer_25_private/problem_sets/ps_4/sample_problem_set_solution/Showtime_New.xlsx")


# Display the showtime_data
View(showtime_data)



# Convert age-category to factor (this needs to be done for categorical predictors)
showtime_data$age_category_factor <- factor(showtime_data$age_category, 
                                            levels = c(1, 2, 3), 
                                            labels = c("Teen", "Middle", "Aged"))


# Run Multiple linear regression excluding age-category
model_full<- lm(revenue ~ tv + newspaper + magazines + leaflets, data = showtime_data)
summary(model_full)

# Nice regression table output
stargazer(model_full, type = "text", ci = TRUE, ci.level = 0.95, 
          title = "Regression Results", 
          dep.var.labels = "Revenue",
          covariate.labels = c("TV Advertising", "Newspaper Advertising", "Magazine Advertising", "Leaflet Advertising"))


# Similar ANOVA table like Excel

# fit the null model
model_null <- lm(revenue ~ 1, data = showtime_data)  # Null model with only intercept

# anova function will compare between two models
anova(model_null, model_full)




# Restricted F-test
# Reduced model without magazines and leaflets

restricted_model <- lm(revenue ~ tv + newspaper, data = showtime_data)
anova(restricted_model, model_full)




# Prediction .... 
# Create new data for prediction
new_data <- data.frame(tv = 3.5, newspaper = 2.3, magazines = 1.0, leaflets = 0.5)

# Make prediction
predicted_revenue <- predict(model_full, new_data)
predicted_revenue

new_data2 <- data.frame(tv = c(3.5, 3.7), newspaper = c(2.3, 2.8), magazines = c(1.0, 1.3), leaflets = c(0.5, 0.7))
predicted_revenue2 <- predict(model_full, new_data2)
predicted_revenue2

predict(model_full)



# Dummy variable regression


dummy_model <- lm(revenue ~ age_category_factor, data = showtime_data)
summary(dummy_model)


# groupwise average

group_means <- showtime_data %>%
  group_by(age_category_factor) %>%
  summarise(mean_revenue = mean(revenue))

group_means
