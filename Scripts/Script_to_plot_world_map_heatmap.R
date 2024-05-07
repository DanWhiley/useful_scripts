# Load reqiured R libraries
library(tidyr)
library(tidyverse)
# Read in the csv file containing the country list and number of NHPH isolates in the NCBI database. Please find associated data file in the repo/directory.
read_csv('NHPH_world_map.csv') -> number_of_NHPH_data
# Now, map the data to country
joinData <- joinCountryData2Map( number_of_NHPH_data,
+                                  joinCode = "NAME",
+                                  nameJoinColumn = "country")
# plot the world map and visualise it
theMap <- mapCountryData( joinData, nameColumnToPlot="number_of_NHPH_genomes", addLegend=FALSE )
do.call( addMapLegend, c(theMap, legendWidth=1, legendMar = 2))
