set hive.exec.dynamic.partition=true;
SET hive.exec.boolean.evaluation=nonstrict;
set hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.max.dynamic.partitions=100000;
SET hive.exec.max.dynamic.partitions.pernode=100000;

-- Load Data from Staging to Partitioned Table
INSERT INTO TABLE covid_db.covid_partitioned PARTITION (Country_Name)
SELECT *, country AS Country_Name
FROM covid_db.covid_staging
WHERE country IS NOT NULL AND Country != "World";