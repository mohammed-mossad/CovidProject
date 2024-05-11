# covid data pipeline project
## objective
 Create an automated pipeline workflow from ingestion till 
visualization for COVID dataset
## business requirments 
* show on a map the top 10 ranking countries in 
death rate
* show on a map the top 10 ranking countries in 
testing rate
* show the top 10 ranking countries in testing rate on 
a pie chart
* Add a custom chart of your choice in the empty 
section of the dashboard
## used tools
* Cloudera VM: A pre-configured virtual machine with Hadoop ecosystem components like HDFS, Hive, and Oozie.
* WinSCP: A popular SFTP and SCP client for Windows that enables secure file transfers between local and remote computers.
* PowerBI
## steps
* file creation on the vm in my case Cloudera Home :
 Create necessary files within Cloudera home directory using the command line.
* upload the dataset using WinSCP.
* Shell Script for Data Upload to HDFS:
Prepare a shell script to upload COVID data to HDFS.
* Create database on Hive and create schema for each Hive loading stage.
* partitioned Table for Further Analysis.
* Create an Oozie workflow actions from (Cloudera HUE in VM) to run the HDFS 
shell script and execute the Hive queries (HDFS and Hive actions).
* Data Transfer from HDFS to Local Directory:
Move data from the "Covid_final_output" table in HDFS to your local directory at /home/cloudera/covid_project/.
* Power BI Visualization:
Create visualizations in Power BI based on the business requirements.
## files
## dataset
* covid-19.csv : the original csv file.
* finaloutput.csv : The processed data after applying transformations.
## scripts
* scripts for creating and Hive tables, partitioning and processing data.
## Visualization
* report.pbix Power BI file for creating visualizations based on the business requirements.
## result
<img width="481" alt="Capture" src="https://github.com/mohammed-mossad/CovidProject/assets/56560535/b30ced98-6efe-4881-8779-6734a8531f8f">




