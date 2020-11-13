source("main.R")

reviews %>%
  filter(business_id %in% top_reviewed_restaurants) %>%
  unnest_tokens(word, text) %>%
  filter(!word %in% stop_words$word) %>%
  filter(!word %in% c('food','restaurant')) %>%
  count(word,sort = TRUE) %>%
  ungroup() %>%
  mutate(word = factor(word, levels = rev(unique(word)))) %>%
  head(20) %>%
  
  ggplot(aes(x = word,y = n)) +
  geom_bar(stat='identity',colour="white", fill =fillColor) +
  geom_text(aes(x = word, y = 1, label = paste0("(",n,")",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'Word', y = 'Word Count', 
       title = 'Word Count') +
  coord_flip() + 
  theme_bw()
