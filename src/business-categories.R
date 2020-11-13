source("main.R")

# types of businesses in yelp dataset
categories = str_split(business$categories,";")
categories = as.data.frame(unlist(categories))
colnames(categories) = c("Name")

categories %>%
  group_by(Name) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(Name = reorder(Name,Count)) %>%
  head(10) %>%
  
  
  ggplot(aes(x = Name,y = Count)) +
  geom_bar(stat='identity',colour="white", fill =fillColor2) +
  geom_text(aes(x = Name, y = 1, label = paste0("(",Count,")",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'Name of Category', y = 'Count', 
       title = 'Top 10 Categories of Business') +
  coord_flip() + 
  theme_bw()
