source("main.R")

# types of reviews in the most 5 star reviewed restaurant
mon_ami_gabi_reviews = reviews %>%
  filter(business_id %in% top_reviewed_restaurants)

mon_ami_gabi_reviews %>%
  group_by(useful) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(useful = reorder(useful, Count)) %>%
  head(10) %>%
  
  ggplot(aes(x = useful,y = Count)) +
  geom_bar(stat='identity',colour="white", fill = fillColor) +
  geom_text(aes(x = useful, y = 1, label = paste0("(",Count,")",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'Useful Reviews', 
       y = 'Count', 
       title = 'Useful Reviews and Count') +
  coord_flip() +
  theme_bw()
