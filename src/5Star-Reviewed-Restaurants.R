source("main.R")

# most 5 star reviewed companies
top5StarCompanies = reviews %>%
  filter(stars == 5) %>%
  group_by(business_id) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(BusinessID = reorder(business_id,Count)) %>%
  head(10)

top5StarCompanies = inner_join(top5StarCompanies, restuarants)

top5StarCompanies %>%
  mutate(name = reorder(name,Count)) %>%
  ggplot(aes(x = name,y = Count)) +
  geom_bar(stat='identity',colour="white", fill = fillColor) +
  geom_text(aes(x = name, y = 1, label = paste0("(",Count,")",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'Name of the Restuarant', 
       y = 'Count', 
       title = 'Name of the Restuarant and Count') +
  coord_flip() +
  theme_bw()
