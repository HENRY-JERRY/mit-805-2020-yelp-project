library(tidyverse)   #data manipulation and graphs
library(stringr)     #string manipulation
library(lubridate)   #date manipulation
library(wordcloud)   #wordcloud
library(tidytext)    #tidy implementation of NLP methods
library(DT)          #table format display of data
library(leaflet)     #maps
library(igraph)      #graphs
library(ggraph)      #graphs
library(topicmodels) #for LDA topic modelling 
library(tm)          #text mining functions, making document term matrixes
library(SnowballC)   #for stemming
library(data.table)  #for efficiency of Importing Large CSV files
library(textcat)
library(readr)

fillColor = "#F8C471"
fillColor2 = "#82E0AA"

# import the datasets
reviews <- read_csv('../data/review.csv')
business <- read_csv("../data/business.csv")
restuarants <- read_csv('../data/restaurants.csv')

# most 5 reviewed restaurants
top_reviewed_restaurants = c("4JNXUYY8wbaaDmk3BPzlWw", "RESDUcs7fIiihp38-d6_6g",
                             "faPVqws-x-5k2CQKDNtHxw", "vHz2RLtfUMVRPFmd7VBEHA",
                             "JDZ6_yycNQFTpUZzLIKHUg")
