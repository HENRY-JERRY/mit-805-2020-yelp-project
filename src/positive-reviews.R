source("main.R")

# investigate positive reviews
display_pos_sentiments <- function(sentiment_lines,review_text)
{
  pos_sentiment_lines = sentiment_lines %>%
    arrange(desc(sentiment))  %>%
    top_n(10, sentiment) %>%
    inner_join(review_text, by = "review_id") %>%
    select(date,sentiment,text) 
  
  datatable(pos_sentiment_lines, style="bootstrap", class="table-condensed", options = list(dom = 'tp',scrollX = TRUE))
  
}

display_pos_sentiments(sentiment_lines,mon_ami_gabi_reviews)
