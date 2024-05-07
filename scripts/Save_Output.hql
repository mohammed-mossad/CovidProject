set hive.exec.dynamic.partition=true;
SET hive.exec.boolean.evaluation=nonstrict;
set hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.max.dynamic.partitions=100000;
SET hive.exec.max.dynamic.partitions.pernode=100000;
use covid_db;
INSERT OVERWRITE DIRECTORY '/home/covid_project_output' ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
) 
select * from covid_db.covid_final_output; 