new_directory <- "C:\\Users\\c2067811\\Downloads\\"
library(dplyr)
setwd(new_directory)
url_flight_list <- c(
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2012_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2013_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2014_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2015_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2016_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2017_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2018_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2019_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2020_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_12.zip",

  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_1.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_2.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_3.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_4.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_5.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_6.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_7.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_8.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_9.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_10.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_11.zip",
  "https://www.transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2022_12.zip"

)

url_weather_urls <- c(
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2012_c20221216.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2013_c20230118.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2014_c20230330.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2015_c20220425.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2016_c20220719.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2017_c20230317.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2018_c20230616.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2019_c20230118.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2020_c20230417.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2021_c20230516.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2022_c20230616.csv.gz",
  "https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2023_c20230616.csv.gz"
)

# Download flight from path
destination_dir <- "C:\\Users\\c2067811\\Downloads\\Flight_data\\"
for (url in url_flight_list) {
  filename <- basename(url)
  dest_file <- file.path(destination_dir,filename)
  download.file(url, destfile = dest_file)
}
# Download weather from path
destination_dir <- "C:\\Users\\c2067811\\Downloads\\Weather_data\\"
for (url in url_weather_urls) {
  filename <- basename(url)
  dest_file <- file.path(destination_dir,filename)
  download.file(url, destfile = dest_file)
}

# Crawl table of airline in web url and save to dataframe
install.packages("rvest")
library(rvest)
url <- "https://www.bts.gov/topics/airlines-and-airports/airline-codes"

webpage <- read_html(url)
airline_data <- data.frame()
airline_data <- html_table(html_nodes(webpage, "table")[[1]], fill = TRUE)
# Drop first and secnd rows because of false of html table frame
airline_data <- airline_data[-c(1,2),]
# Colect only 2 first columns code and airline name
airline_data <- airline_data[, c("Code", "Airline")]

# extract  flights dataset
zip_files <- list.files(path = "C:\\Users\\c2067811\\Downloads\\Flight_data\\", pattern = "\\.zip$", full.names = TRUE)
for (zip_file in zip_files) {
  unzip(zip_file, exdir = "C:\\Users\\c2067811\\Downloads\\Flight_data")
}
# Drop and Merge flight files
flight_csv_files <- list.files(path = "C:\\Users\\c2067811\\Downloads\\Flight_data\\", pattern = "\\.csv$", full.names = TRUE)
flight_lists <- data.frame()
list_drop_flight_column <- c('Quarter',
                             'DayOfWeek',
                             'IATA_CODE_Reporting_Airline',
                             'Tail_Number',
                             'OriginAirportSeqID',
                             'OriginStateFips',
                             'OriginWac',
                             'DestAirportSeqID',
                             'DestStateFips',
                             'DestWac',
                             'DepDel15',
                             'DepartureDelayGroups',
                             'DepTimeBlk',
                             'TaxiOut',
                             'WheelsOff',
                             'WheelsOn',
                             'TaxiIn',
                             'ArrDel15',
                             'ArrTimeBlk',
                             'ArrivalDelayGroups',
                             'Diverted',
                             'CRSElapsedTime',
                             'ActualElapsedTime',
                             'AirTime',
                             'Flights',
                             'Distance',
                             'DistanceGroup',
                             'FirstDepTime',
                             'TotalAddGTime',
                             'LongestAddGTime',
                             'DivAirportLandings',
                             'DivReachedDest',
                             'DivActualElapsedTime',
                             'DivArrDelay',
                             'DivDistance',
                             'Div1Airport',
                             'Div1AirportID',
                             'Div1AirportSeqID',
                             'Div1WheelsOn',
                             'Div1TotalGTime',
                             'Div1LongestGTime',
                             'Div1WheelsOff',
                             'Div1TailNum',
                             'Div2Airport',
                             'Div2AirportID',
                             'Div2AirportSeqID',
                             'Div2WheelsOn',
                             'Div2TotalGTime',
                             'Div2LongestGTime',
                             'Div2WheelsOff',
                             'Div2TailNum',
                             'Div3Airport',
                             'Div3AirportID',
                             'Div3AirportSeqID',
                             'Div3WheelsOn',
                             'Div3TotalGTime',
                             'Div3LongestGTime',
                             'Div3WheelsOff',
                             'Div3TailNum',
                             'Div4Airport',
                             'Div4AirportID',
                             'Div4AirportSeqID',
                             'Div4WheelsOn',
                             'Div4TotalGTime',
                             'Div4LongestGTime',
                             'Div4WheelsOff',
                             'Div4TailNum',
                             'Div5Airport',
                             'Div5AirportID',
                             'Div5AirportSeqID',
                             'Div5WheelsOn',
                             'Div5TotalGTime',
                             'Div5LongestGTime',
                             'Div5WheelsOff',
                             'Div5TailNum',
                             'X')


# Drop flight columns
dropped_flight_list <- list()
for (flight_file in flight_csv_files) {
  data <- read.csv(flight_file)
  df <-   subset(data, select = !names(data) %in% list_drop_flight_column )
  if (is.null(dropped_flight_list)) {
    dropped_flight_list <- list(df)
  }
  else
  {
    dropped_flight_list <- c(dropped_flight_list, list(df))
  }
  print(flight_file)
}
# Merge flight column
merged_flight_data <- do.call(rbind, dropped_flight_list)
dropped_flight_list<- NULL




# Drop 2rd times

list_drop_flight_column_2<- c(
  "DayofMonth",
  "Flight_Number_Reporting_Airline",
  "DOT_ID_Reporting_Airline",
  "OriginCityMarketID",
  "Origin",
  "OriginState",
  "DestCityMarketID",
  "Dest",
  "DestState",
  "DepDelay",
  "ArrDelay",
  "CarrierDelay",
  "NASDelay",
  "SecurityDelay",
  "LateAircraftDelay"
)
cp_merged_flight_data <- merged_flight_data[, !names(merged_flight_data) %in% list_drop_flight_column_2]
rm(data)


# Extract files weather dataset and merge weather dataset

gz_files <- list.files(path = "C:\\Users\\c2067811\\Downloads\\Weather_data\\", pattern = "\\.csv.gz$", full.names = TRUE)
merged_data <- NULL
for (gz_file in gz_files){
  gz <- read.csv(file = gz_file)
  if (is.null(merged_data)) {
    merged_data <- gz
  } else {
    merged_data <- merge(merged_data, gz, all = TRUE)
  }
  print(gz_file)
}
unique_values_eposide_id <- unique(merged_data$EPISODE_ID)
length(unique_values_eposide_id)
unique_values_event_id <- unique(merged_data$EVENT_ID)
length(unique_values_event_id)
rm(unique_values_eposide_id, unique_values_event_id)

# Drop weather column name
list_drop_weather_column <- c(
  "EVENT_ID",
  "EPISODE_ID",
  "YEAR",
  "MONTH_NAME",
  "CZ_TYPE",
  "CZ_FIPS",
  "CZ_NAME",
  "WFO",
  "STATE_FIPS",
  "CZ_TIMEZONE",
  "BEGIN_YEARMONTH",
  "BEGIN_DAY",
  "BEGIN_TIME",
  "END_YEARMONTH",
  "END_DAY",
  "END_TIME",
  "INJURIES_DIRECT",
  "INJURIES_INDIRECT",
  "DEATHS_DIRECT",
  "DEATHS_INDIRECT",
  "DAMAGE_PROPERTY",
  "DAMAGE_CROPS",
  "FLOOD_CAUSE",
  "SOURCE",
  "MAGNITUDE",
  "MAGNITUDE_TYPE",
  "CATEGORY",
  "TOR_F_SCALE",
  "TOR_LENGTH",
  "TOR_WIDTH",
  "TOR_OTHER_WFO",
  "TOR_OTHER_CZ_STATE",
  "TOR_OTHER_CZ_FIPS",
  "TOR_OTHER_CZ_NAME",
  "BEGIN_RANGE",
  "BEGIN_AZIMUTH",
  "BEGIN_LOCATION",
  "END_RANGE",
  "END_AZIMUTH",
  "END_LOCATION",
  "BEGIN_LAT",
  "BEGIN_LON",
  "END_LAT",
  "END_LON",
  "EPISODE_NARRATIVE",
  "EVENT_NARRATIVE",
  "DATA_SOURCE"
)
weather_dropped_column <- merged_data[, !names(merged_data) %in% list_drop_weather_column]
rm(merged_data,gz)
uniq_weather_dropped_column <- unique(weather_dropped_column$STATE)
View(weather_dropped_column)





# Check values of weather using sumary
summary(weather_dropped_column)
library(lubridate)
# convert date-time type
weather_dropped_column$BEGIN_DATE_TIME <- as.POSIXct(weather_dropped_column$BEGIN_DATE_TIME, format = "%d-%b-%y %H:%M:%S")
weather_dropped_column$BEGIN_DATE_TIME <- format(weather_dropped_column$BEGIN_DATE_TIME, "%Y-%m-%d %H:%M:%S")
weather_dropped_column$BEGIN_DATE_TIME <- ymd_hms(weather_dropped_column$BEGIN_DATE_TIME)
weather_dropped_column$END_DATE_TIME <- as.POSIXct(weather_dropped_column$END_DATE_TIME, format = "%d-%b-%y %H:%M:%S")
weather_dropped_column$END_DATE_TIME <- format(weather_dropped_column$END_DATE_TIME, "%Y-%m-%d %H:%M:%S")
weather_dropped_column$END_DATE_TIME <- ymd_hms(weather_dropped_column$END_DATE_TIME)
# Change name of State type from all of upper case to title
library(stringr)
weather_dropped_column$STATE <-  str_to_title(weather_dropped_column$STATE)
#View(weather_dropped_column)

# Save dataset of weather and airport in csv
install.packages("openxlsx")
library(openxlsx)
desktop_path <- "C:\\Users\\c2067811\\Desktop\\"
# Save to an Excel file using the 'openxlsx' package
write.xlsx(weather_dropped_column,file = paste0(desktop_path, "weather_merged.xlsx"))
write.xlsx(airline_data,file = paste0(desktop_path, "airline_cleaned.xlsx"))
write.xlsx(merged_flight_data,file = paste0(desktop_path, "flight_merged.xlsx"))


summary(merged_flight_data)

# check before change  state name
uniq_weather_dropped_column <- unique(weather_dropped_column$STATE)
print(uniq_weather_dropped_column)
uniq_flight_column <- unique(merged_flight_data$OriginStateName)
print(uniq_flight_column)

# check region state airport doensnt have in weather forecast
states_not_in_weather <- setdiff(uniq_flight_column, uniq_weather_dropped_column)
print(states_not_in_weather)
# change cell name of 'U.S. Virgin Islands' into 'Virgin Islands'


cp_merged_flight_data$OriginStateName <- ifelse(cp_merged_flight_data$OriginStateName == 'U.S. Virgin Islands', 'Virgin Islands', cp_merged_flight_data$OriginStateName)

# change cell name of 'U.S. Pacific Trust Territories and Possessions' into Guam
# check by
View(cp_merged_flight_data[cp_merged_flight_data$OriginStateName %in% 'U.S. Pacific Trust Territories and Possessions', ])
cp_merged_flight_data$OriginStateName <- ifelse(cp_merged_flight_data$OriginStateName == 'U.S. Pacific Trust Territories and Possessions', 'Trust Territory', cp_merged_flight_data$OriginStateName)
View(cp_merged_flight_data[cp_merged_flight_data$OriginStateName %in% 'Trust Territory', ])
rm(dropped_flight_list)

# check after change state name
uniq_weather_dropped_column <- unique(weather_dropped_column$STATE)
print(uniq_weather_dropped_column)
uniq_flight_column <- unique(cp_merged_flight_data$OriginStateName)
print(uniq_flight_column)

unique_state <- unique(cp_merged_flight_data$OriginStateName)
rm(filtered_weather)

weather_dropped_column <- weather_dropped_column %>%
  filter(STATE %in% unique_state)


# change type of date time in flight
library(lubridate)
cp_merged_flight_data$CRSDepTime <- sprintf("%04d", as.integer(cp_merged_flight_data$CRSDepTime))
hours <- substr(cp_merged_flight_data$CRSDepTime, 1, 2)
minutes <- substr(cp_merged_flight_data$CRSDepTime, 3, 4)
cp_merged_flight_data$Planed_time <- paste(hours, minutes, sep = ":")
cp_merged_flight_data$Planed_time <- paste(cp_merged_flight_data$Planed_time, ":00",sep = "")
cp_merged_flight_data$Planed_Date_Time <- paste(cp_merged_flight_data$FlightDate, cp_merged_flight_data$Planed_time, sep = " ")
cp_merged_flight_data$Planed_Date_Time <- ymd_hms(cp_merged_flight_data$Planed_Date_Time)


cp_merged_flight_data$FlightDate <- ymd(cp_merged_flight_data$FlightDate)


View(cp_merged_flight_data)

# Convert time type
install.packages("chron")
library(chron)
cp_merged_flight_data$CRSDepTime <- times(cp_merged_flight_data$Planed_time)
cp_merged_flight_data$DepTime <-sprintf("%04d", as.integer(cp_merged_flight_data$DepTime))
hours <- substr(cp_merged_flight_data$DepTime, 1, 2)
minutes <- substr(cp_merged_flight_data$DepTime, 3, 4)
cp_merged_flight_data$Temp_time <- paste(hours, minutes, sep = ":")
cp_merged_flight_data$Temp_time <- paste(cp_merged_flight_data$Temp_time, ":00",sep = "")
cp_merged_flight_data$DepTime <- times(cp_merged_flight_data$Temp_time)


cp_merged_flight_data$ArrTime <-sprintf("%04d", as.integer(cp_merged_flight_data$ArrTime))
hours <- substr(cp_merged_flight_data$ArrTime, 1, 2)
minutes <- substr(cp_merged_flight_data$ArrTime, 3, 4)
cp_merged_flight_data$Temp_time <- paste(hours, minutes, sep = ":")
cp_merged_flight_data$Temp_time <- paste(cp_merged_flight_data$Temp_time, ":00",sep = "")
cp_merged_flight_data$ArrTime <- times(cp_merged_flight_data$Temp_time)


cp_merged_flight_data$CRSArrTime <-sprintf("%04d", as.integer(cp_merged_flight_data$CRSArrTime))
hours <- substr(cp_merged_flight_data$CRSArrTime, 1, 2)
minutes <- substr(cp_merged_flight_data$CRSArrTime, 3, 4)
cp_merged_flight_data$Temp_time <- paste(hours, minutes, sep = ":")
cp_merged_flight_data$Temp_time <- paste(cp_merged_flight_data$Temp_time, ":00",sep = "")
cp_merged_flight_data$CRSArrTime <- times(cp_merged_flight_data$Temp_time)

rm(hours,minutes)
cp_merged_flight_data$Temp_time <- NULL
cp_merged_flight_data$Planed_time <- NULL

# Replace NA values in CarrierDelay WeatherDelay NASDelay SecurityDelay LateAircraftDelay
cp_merged_flight_data$WeatherDelay[is.na(cp_merged_flight_data$WeatherDelay)] <- 0
cp_merged_flight_data$DepDelayMinutes[is.na(cp_merged_flight_data$DepDelayMinutes)] <- 0
cp_merged_flight_data$ArrDelayMinutes[is.na(cp_merged_flight_data$ArrDelayMinutes)] <- 0
# Replace "" in Cancelation code X , C(NA system)-> N , A(Carrier) -> C, B(weather) -> W, D(Security) -> S
# check unique Cancelation
print(unique(cp_merged_flight_data$CancellationCode))

cp_merged_flight_data$CancellationCode <- gsub("^$", "X", cp_merged_flight_data$CancellationCode)
cp_merged_flight_data$CancellationCode <- gsub("C", "N", cp_merged_flight_data$CancellationCode)
cp_merged_flight_data$CancellationCode <- gsub("A", "C", cp_merged_flight_data$CancellationCode)
cp_merged_flight_data$CancellationCode <- gsub("B", "W", cp_merged_flight_data$CancellationCode)
cp_merged_flight_data$CancellationCode <- gsub("D", "S", cp_merged_flight_data$CancellationCode)

# Remove after "," of OriginCityName, DestCityName
cp_merged_flight_data$OriginCityName<- sub(",.*", "", cp_merged_flight_data$OriginCityName)
cp_merged_flight_data$DestCityName<- sub(",.*", "", cp_merged_flight_data$DestCityName)


# Check unique because too much column



# Count value of Cancelation code == 1
temp <- sum(cp_merged_flight_data$Cancelled == 1, na.rm = TRUE)
# Because we just concern about delays reason so I drop cancelled flight
dropped_cancel_flight  <- cp_merged_flight_data[cp_merged_flight_data$Cancelled !=1,]


# check to drop
temp<- unique(cp_merged_flight_data[cp])
temp <- length(cp_merged_flight_data[cp_merged_flight_data$Year == 2012, ])
print(temp)

temp <- cp_merged_flight_data[is.na(cp_merged_flight_data$DepTime),]
View(temp)
print(unique(temp$CancellationCode))

#Drop NA Planed date time => Drop 4847037 recordas
cp_merged_flight_data <- cp_merged_flight_data[complete.cases(cp_merged_flight_data$Planed_Date_Time), ]




# Remove duplicate rows from the DataFrame
rm(dropped_flight_list)

# Done from 6729125 to 6729124
flight_data_2022 <- cp_merged_flight_data[cp_merged_flight_data$Year==2022, ]
temp<- unique(flight_data_2022)
flight_data_2022 <- temp

# Done fom 5995387 to 5995397
flight_data_2021 <- cp_merged_flight_data[cp_merged_flight_data$Year==2021, ]
temp<- unique(flight_data_2021)
flight_data_2021 <- temp
# Done duplicate part
flight_data_2020 <- cp_merged_flight_data[cp_merged_flight_data$Year==2020, ]
temp<- unique(flight_data_2020)
flight_data_2020 <- temp
# Done from 7222037 to 7422032
flight_data_2019 <- cp_merged_flight_data[cp_merged_flight_data$Year==2019, ]
temp<- unique(flight_data_2019)
flight_data_2019 <- temp
# Done from 7206195 to 7206191
flight_data_2018 <- cp_merged_flight_data[cp_merged_flight_data$Year==2018, ]
temp<- unique(flight_data_2018)
flight_data_2018 <- temp

# Done from 5674621 to 5674621
flight_data_2017 <- cp_merged_flight_data[cp_merged_flight_data$Year==2017, ]
temp<- unique(flight_data_2017)
flight_data_2017 <- temp



# Done from 5617658 to 5617658
flight_data_2016 <- cp_merged_flight_data[cp_merged_flight_data$Year==2016, ]
temp<- unique(flight_data_2016)
flight_data_2016 <- temp





# Done from 5819079 to 5819078
flight_data_2015 <- cp_merged_flight_data[cp_merged_flight_data$Year==2015, ]
temp<- unique(flight_data_2015)
flight_data_2015 <- temp



# Done from 5298931 to 5298931
flight_data_2014 <- cp_merged_flight_data[cp_merged_flight_data$Year==2014, ]
temp<- unique(flight_data_2014)
flight_data_2014 <- temp

# Done from 6369482 to 6369482
flight_data_2013 <- cp_merged_flight_data[cp_merged_flight_data$Year==2013, ]
temp<- unique(flight_data_2013)
flight_data_2013 <- temp

# Done from 6096762 to 6096759
flight_data_2012 <- cp_merged_flight_data[cp_merged_flight_data$Year==2012, ]
temp<- unique(flight_data_2012)
flight_data_2012 <- temp

# Drop duplicate in weather
temp <- unique(weather_dropped_column)
weather_dropped_column <- temp

# Try to merge them with weather
library(dplyr)
flight_data_2020$ID
temp <- head(flight_data_2020,100000)
weather_2020 <- filter(weather_dropped_column, year(BEGIN_DATE_TIME) == 2020 & year(END_DATE_TIME) == 2020)

result <- temp %>%
  left_join(weather_2020, by = c("OriginStateName" = "STATE")) %>%
  mutate(
    WeatherEvent = ifelse(
      WeatherDelay == 0,
      NA,
      ifelse(Planed_Date_Time >= BEGIN_DATE_TIME & Planed_Date_Time <= END_DATE_TIME, EVENT_TYPE, NA)
    )
  ) %>%
  select(all_of(names(temp)), WeatherEvent)
