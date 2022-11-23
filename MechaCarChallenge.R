# Load dplyr package
library(dplyr)

# Import mpg data
car_mpg <- read.csv("MechaCar_mpg.csv")

# Linear Model with all five factors

mpg_lm <- lm(car_mpg$mpg ~ car_mpg$vehicle_length+car_mpg$vehicle_weight+
               car_mpg$spoiler_angle+car_mpg$ground_clearance+
               car_mpg$AWD, data=car_mpg)
# Display results in console
summary(mpg_lm)

# Add charts

plot(mpg_lm)


##################################
# Suspension
##################################

# Import data

coil <- read.csv("Suspension_Coil.csv")

# Create Total Summary

total_summary <- coil %>% summarise(Mean_PSI=mean(PSI))
total_summary <- total_summary %>% mutate(Median_PSI=median(coil$PSI))
total_summary <- total_summary %>% mutate(Var_PSI=var(coil$PSI))
total_summary <- total_summary %>% mutate(StD_PSI=sd(coil$PSI))
print(total_summary)

# Create Lot Summary

lot_summary <- coil %>% 
  group_by(Manufacturing_Lot) %>% 
  summarise(Mean_PSI=mean(PSI),
            Median_PSI=median(PSI),
            Var_PSI=var(PSI),
            Std_PSI=sd(PSI),
            .groups = 'keep')

print(lot_summary)


# Coil Spring T-Test

# Total

t.test(coil$PSI,mu=1500)

# By Manufacturing_Lot 

# Lot1

Lot1_t <- t.test(PSI ~ 1, mu = 1500, data = coil,
                 subset = Manufacturing_Lot == "Lot1")
Lot1_t

# Lot2

Lot2_t <- t.test(PSI ~ 1, mu = 1500, data = coil,
                 subset = Manufacturing_Lot == "Lot2")
Lot2_t

# Lot3

Lot3_t <- t.test(PSI ~ 1, mu = 1500, data = coil,
                 subset = Manufacturing_Lot == "Lot3")
Lot3_t
