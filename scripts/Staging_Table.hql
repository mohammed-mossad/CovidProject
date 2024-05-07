-- Memory Allocation (Adjust as needed)
SET mapreduce.map.memory.mb=4096;
SET mapreduce.reduce.memory.mb=4096;
SET mapreduce.map.java.opts=-Xmx4g;
SET mapreduce.reduce.java.opts=-Xmx4g;

-- Database and Table Creation
CREATE DATABASE IF NOT EXISTS covid_db;
USE covid_db;

DROP TABLE covid_staging;
-- Staging Table (for CSV Data)
CREATE TABLE IF NOT EXISTS covid_staging (
  Country STRING,
  Total_Cases DOUBLE,
  New_Cases DOUBLE,
  Total_Deaths DOUBLE,
  New_Deaths DOUBLE,
  Total_Recovered DOUBLE,
  Active_Cases DOUBLE,
  Serious DOUBLE,
  Tot_Cases_per_M DOUBLE,
  Deaths_per_M DOUBLE,
  Total_Tests_per_M DOUBLE,
  Tests DOUBLE,
  CASES_per_Test DOUBLE,
  Death_in_Closed_Cases STRING,
  Rank_by_Testing_rate DOUBLE,
  Rank_by_Death_rate DOUBLE,
  Rank_by_Cases_rate DOUBLE,
  Rank_by_Death_of_Closed_Cases DOUBLE
  )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/cloudera/ds/Hive_schema/Basic_Table';

-- Load Data from Hadoop File
LOAD DATA INPATH '/user/cloudera/ds/COVID_HDFS_LZ/covid-19.csv' INTO TABLE covid_db.covid_staging;



