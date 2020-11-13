source("main.R")

# top restuarants in Toronto 
toronto_res = restuarants %>%
  filter(city == "Toronto") %>%
  arrange(desc(review_count,stars)) %>%
  select(name,address,review_count,stars) %>%
  head(10)

toronto_res
