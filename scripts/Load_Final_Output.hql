
set hive.exec.dynamic.partition=true;
SET hive.exec.boolean.evaluation=nonstrict;
set hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.max.dynamic.partitions=100000;
SET hive.exec.max.dynamic.partitions.pernode=100000;

use covid_db;
INSERT OVERWRITE TABLE covid_db.covid_final_output PARTITION(COUNTRY_NAME)
SELECT Country,Total_Cases,New_Cases,Total_Deaths,New_Deaths,Total_Recovered,
		Active_Cases,Serious,Tot_Cases,Deaths,Total_Tests,Tests,CASES_per_Test,Death_in_Closed_Cases,
		Rank_by_Testing_rate,Rank_by_Death_rate,Rank_by_Cases_rate,Rank_by_Death_of_Closed_Cases,
		ROW_NUMBER() OVER (PARTITION BY Country ORDER BY Total_Deaths DESC) AS Top_Death,
		ROW_NUMBER() OVER (PARTITION BY Country ORDER BY Total_Tests DESC) AS Top_Test,
		Country
FROM covid_partitioned;
