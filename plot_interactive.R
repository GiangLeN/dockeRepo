# Libraries
library(dygraphs)
library(xts) # To make the convertion data-frame / xts format

# Format 3: Several variables for each date
data <- data.frame(
  time=seq(from=Sys.Date()-40, to=Sys.Date(), by=1 ), 
  value1=runif(41), 
  value2=runif(41)+0.7
)

# Then you can create the xts format:
don=xts( x=data[,-1], order.by=data$time)

# Chart
p <- dygraph(don)
p

# save the widget
library(htmlwidgets)
saveWidget(p, file=paste0( getwd(), "/dygraphs316-3.html"))
