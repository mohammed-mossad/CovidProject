SET hive.exec.max.dynamic.partitions=100000;
SET hive.exec.max.dynamic.partitions.pernode=100000;
SET mapreduce.map.memory.mb=4096;
SET mapreduce.reduce.memory.mb=4096;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;


USE covid_db;
drop table covid_db.covid_final_output;

CREATE EXTERNAL TABLE IF NOT EXISTS covid_db.covid_final_output (
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
  Rank_by_Death_of_Closed_Cases DOUBLE,
  Top_Death STRING,
  Top_Test STRING
)
PARTITIONED BY (COUNTRY_NAME STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
) 
STORED as TEXTFILE
LOCATION '/user/cloudera/ds/COVID_FINAL_OUTPUT';



