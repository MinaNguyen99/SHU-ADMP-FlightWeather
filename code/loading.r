install.packages("odbc")
install.packages("Rcpp")
library(DBI)
library(odbc)
library(sparklyr)
con <- DBI::dbConnect(odbc::odbc(),
                      .connection_string = "Driver={Cloudera ODBC Driver for Apache Hive};",
                      Host = "sandbox-hdp.hortonworks.com",
                      UID = "hive",
                      PWD= "",
                      Port= 10000
)

dbSendQuery(con, "CREATE DATABASE admp_flight")
dbSendQuery(con, "USE admp_flight")

dbSendQuery(con, "DROP TABLE airline_dim")
dbSendQuery(con, "DROP TABLE weather_dim")
dbSendQuery(con,"CREATE TABLE airline_dim (
              Code STRING,
              Airline STRING
            )
            ROW FORMAT DELIMITED
            FIELDS TERMINATED BY ';'
            STORED AS TEXTFILE")
airline_load_path <- "LOAD DATA INPATH '//sandbox-hdp.hortonworks.com:8020/user/maria_dev/admp_data/airline_data.csv' INTO TABLE airline_dim"
dbSendQuery(con, airline_load_path)




dbSendQuery(con,"CREATE TABLE weather_dim(
                  STATE STRING,
                  EVENT_TYPE STRING,
                  BEGIN_DATE_TIME TIMESTAMP,
                  END_DATE_TIME TIMESTAMP
              )
              ROW FORMAT DELIMITED
              FIELDS TERMINATED BY ','
              STORED AS TEXTFILE;")
weather_load_path <- "LOAD DATA INPATH '//sandbox-hdp.hortonworks.com:8020/user/maria_dev/admp_data/weather_data.csv' INTO TABLE weather_dim"
dbSendQuery(con, weather_load_path)

dbSendQuery(con, "DROP TABLE airport_dim")
dbSendQuery(con,"CREATE TABLE airport_dim(
                  OriginAirortID INT,
                  OriginCityName STRING,
                  OriginStateName STRING
              )
              ROW FORMAT DELIMITED
              FIELDS TERMINATED BY ','
              STORED AS TEXTFILE;")
airport_load_path <- "LOAD DATA INPATH '//sandbox-hdp.hortonworks.com:8020/user/maria_dev/admp_data/airport_data.csv' INTO TABLE airport_dim"
dbSendQuery(con, airport_load_path)


create_table_query <- "
  CREATE TABLE flight_dim (
    Year INT,
    Month INT,
    FlightDate DATE,
    AirlineCode STRING,
    OriginAirportID INT,
    OriginCityName STRING,
    OriginStateName STRING,
    DestAirportID INT,
    DestCityName STRING,
    DestStateName STRING,
    CRSDepTime STRING,
    DepTime STRING,
    DepDelayMinutes DOUBLE,
    CRSArrTime STRING,
    ArrTime STRING,
    ArrDelayMinutes DOUBLE,
    WeatherDelay DOUBLE,
    Planed_Date_Time TIMESTAMP
  )
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  STORED AS TEXTFILE"
dbSendQuery(con, create_table_query)
flight_load_path <- "LOAD DATA INPATH '//sandbox-hdp.hortonworks.com:8020/user/maria_dev/admp_data/flight_data/' INTO TABLE flight_dim"
dbSendQuery(con, flight_load_path)

# Query question 1


question_1 <- "
SELECT
    YEAR(f.planed_date_time) AS Year,
    MONTH(f.planed_date_time) AS Month,
    AirlineCode,
    a.Airline,
    COUNT(*) AS No_Flights
FROM
    flight_dim f
JOIN
    airline_dim a ON f.AirlineCode = a.Code
GROUP BY
    YEAR(f.planed_date_time), MONTH(f.planed_date_time), AirlineCode, a.Airline
ORDER BY
    Year, Month, No_Flights DESC;
"
result1 <- dbSendQuery(con, question_1)
df1 <- dbFetch(result1)
write.table(df1, "question1_airline_data.csv", row.names = FALSE, col.names = FALSE, sep = ",", quote = FALSE)



create_fct1 <- "
  CREATE TABLE fct1_1 (
    Year INT,
    Month INT,
    Airline_code STRING,
    AIRLINE_name STRING,
    No_flights INT
  )
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  STORED AS TEXTFILE"

dbSendQuery(con, create_fct1)
q1_load_path <- "LOAD DATA INPATH '//sandbox-hdp.hortonworks.com:8020/user/maria_dev/admp_data/question1_airline_data.csv' INTO TABLE fct1_1"
dbSendQuery(con, q1_load_path)



question_1_ap <- "
SELECT
    YEAR(f.planed_date_time) AS Year,
    MONTH(f.planed_date_time) AS Month,
   OriginCityName AS Departure_Airport,
    COUNT(*) AS No_Flights
FROM
    flight_dim f
JOIN
    airline_dim a ON f.AirlineCode = a.Code
GROUP BY
    YEAR(f.planed_date_time), MONTH(f.planed_date_time), OriginCityName
ORDER BY
    Year, Month, No_Flights DESC;
"
result1_2 <- dbSendQuery(con, question_1_ap)
df1_2 <- dbFetch(result1_2)
write.table(df1, "question1_airport_data.csv", row.names = FALSE, col.names = FALSE, sep = ",", quote = FALSE)


question_2 <- "
SELECT
    f.year AS Year,
    f.month AS Month,
    OriginCityName AS Departure_Airport,
    AirlineCode,
    a.Airline,
    w.event_type,
    AVG(f.DepDelayMinutes) AS Average_Dep_Delay
FROM
    flight_dim f
JOIN
    airline_dim a ON f.AirlineCode = a.Code
JOIN
    weather_dim w ON f.OriginStateName = w.state AND f.planed_date_time BETWEEN w.begin_date_time AND w.end_date_time
WHERE
    f.DepDelayMinutes > 0
GROUP BY
    f.year, f.month, OriginCityName, AirlineCode, a.Airline, w.event_type
ORDER BY
    Year, Month, Average_Dep_Delay DESC
"
result2 <- dbSendQuery(con, question_2)
df2 <- dbFetch(result2)


dbClearResult(result1)


dbDisconnect(con)