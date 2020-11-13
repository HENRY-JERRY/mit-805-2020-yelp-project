source("main.R")

calculate_sentiment <- function(review_text)
{
  sentiment_lines  =  review_text %>%
    filter(textcat(text) == "english") %>%
    unnest_tokens(word, text) %>%
    inner_join(get_sentiments("afinn"), by = "word") %>%
    group_by(review_id) %>%
    summarize(sentiment = mean(value),words = n()) %>%
    ungroup() %>%
    filter(words >= 5) 
  
  return(sentiment_lines)
  
}

mon_ami_gabi_reviews = reviews %>%
  filter(business_id == "4JNXUYY8wbaaDmk3BPzlWw")

sentiment_lines = calculate_sentiment(mon_ami_gabi_reviews)

head(sentiment_lines)
