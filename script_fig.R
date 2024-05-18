library(knitr)
x = read.csv("data/processed/all_covariates.csv")


table = x %>% group_by(LOFEXIDINE) %>% 
  summarise(AGE = mean(AGE), OPIOD_USE = mean(OPIOD_DAYS),
            PROP_MALE = mean(MALE), 
            TOBACCO_USE = mean(sum_highest_avg_uses_per_day), 
            PROP_CENTER1 = mean(CENTER1), PROP_CENTER2 = mean(CENTER2), 
            PROP_CENTER3 = mean(CENTER3),
            BP = mean(BP_SYS_DAY2)) %>% 
  mutate(Group = if_else(LOFEXIDINE == 0, "PLACEBO", "LOFEXIDINE")) %>% 
  select(Group, AGE, OPIOD_USE, PROP_MALE, TOBACCO_USE, PROP_CENTER1, PROP_CENTER2, PROP_CENTER3, BP)

totals = x %>% summarise(AGE = mean(AGE), OPIOD_USE = mean(OPIOD_DAYS),
                         PROP_MALE = mean(MALE), 
                         TOBACCO_USE = mean(sum_highest_avg_uses_per_day), 
                         PROP_CENTER1 = mean(CENTER1), PROP_CENTER2 = mean(CENTER2), 
                         PROP_CENTER3 = mean(CENTER3),
                         BP = mean(BP_SYS_DAY2)) %>% 
  mutate(Group = "TOTAL") %>% 
  select(Group, AGE, OPIOD_USE, PROP_MALE, TOBACCO_USE, PROP_CENTER1, PROP_CENTER2, PROP_CENTER3, BP)


final = rbind(table, totals)

kable(final)

