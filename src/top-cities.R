source("main.R")

# cities with most restuarants
restuarants %>%
  group_by(city) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(City = reorder(city,Count)) %>%
  head(10) %>%
  
  ggplot(aes(x = City,y = Count)) +
  geom_bar(stat='identity',colour="white", fill =fillColor) +
  geom_text(aes(x = City, y = 1, label = paste0("(",round(Count/1e3)," K )",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'City', y = 'Count of Reviews', 
       title = 'Top Ten Cities with the most Business parties in Yelp') +
  coord_flip() + 
  theme_bw()
