source("main.R")

# map of Toronto showing the location of restuarants
TorontoCoords = restuarants %>% filter(city == "Toronto")

center_lon = median(TorontoCoords$longitude,na.rm = TRUE)
center_lat = median(TorontoCoords$latitude,na.rm = TRUE)

leaflet(TorontoCoords) %>% addProviderTiles("Esri.NatGeoWorldMap") %>%
  addCircles(lng = ~longitude, lat = ~latitude,radius = ~sqrt(review_count))  %>%
  
# controls
setView(lng=center_lon, lat=center_lat,zoom = 13)

