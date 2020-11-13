source("main.R")

positiveWordsBarGraph <- function(SC) {
  contributions <- SC %>%
    unnest_tokens(word, text) %>%
    count(word,sort = TRUE) %>%
    ungroup() %>%
    
    inner_join(get_sentiments("afinn"), by = "word") %>%
    group_by(word) %>%
    summarise(n = n(),
              contribution = sum(value))
  
  contributions %>%
    top_n(20, abs(contribution)) %>%
    mutate(word = reorder(word, contribution)) %>%
    head(20) %>%
    ggplot(aes(word, contribution, fill = contribution > 0)) +
    geom_col(show.legend = FALSE) +
    coord_flip() + theme_bw()
}

positiveWordsBarGraph(reviews %>%
                        filter(business_id %in% top_reviewed_restaurants))
