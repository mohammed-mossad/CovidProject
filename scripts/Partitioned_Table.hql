-- Dynamic Partitioning Settings
set hive.exec.dynamic.partition=true
set hive.exec.dynamic.partition.mode=nonstrict
SET hive.exec.max.dynamic.partitions=100000;
SET hive.exec.max.dynamic.partitions.pernode=100000;
USE covid_db;
DROP TABLE covid_partitioned;
-- Partitioned Table for Further Analysis
CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_partitioned (
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
PARTITIONED BY (Country_Name STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/cloudera/ds/Hive_schema/Partition_Table';

