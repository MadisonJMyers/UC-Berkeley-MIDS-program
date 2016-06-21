##DDL SQL statements for files loaded into HDFS (see load_data_lake.sh)

#Statement for Hospitals

DROP TABLE IF EXISTS hospitals;
CREATE EXTERNAL TABLE hospitals (PROVIDER_ID INT, HOSPITAL_NAME varchar(500), ADDRESS varchar(500), CITY varchar(500), STATE varchar(500), ZIP_CODE varchar(500), COUNTY_NAME varchar(500), PHONE_NUMBER varchar(500), HOSPITAL_TYPE varchar(500), HOSPITAL_OWNERSHIP varchar(500), EMERGENCY_SERVICES varchar(500)) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
stored as textfile
LOCATION '/user/w205/hospital_compare/hospitals';


#Statement for Effective Care

DROP TABLE IF EXISTS effective_care;
CREATE EXTERNAL TABLE effective_care (PROVIDER_ID INT,HOSPITAL_NAME varchar(500),ADDRESS varchar(500),CITY varchar(500),STATE varchar(500),ZIP_CODE varchar(500),COUNTY_NAME varchar(500),PHONE_NUMBER varchar(500),CONDITION varchar(500),MEASURE_ID varchar(500),MEASURE_NAME varchar(500),SCORE INT,SAMPLE INT,FOOTNOTE varchar(500),MEASURE_START_DATE DATE,MEASURE_END_DATE DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
stored as textfile
LOCATION '/user/w205/hospital_compare/effective_care';


#Statement for Readmissions

DROP TABLE IF EXISTS readmissions;
CREATE EXTERNAL TABLE readmissions (PROVIDER_ID INT,HOSPITAL_NAME varchar(500),ADDRESS varchar(500),CITY varchar(500),STATE varchar(500),ZIP_CODE varchar(500),COUNTY_NAME varchar(500),PHONE_NUMBER varchar(500),CONDITION varchar(500),MEASURE_NAME varchar(500),MEASURE_ID varchar(500), COMPARED_TO_NATIONAL varchar(500), DENOMINATOR INT, SCORE INT, LOWER_ESTIMATE varchar(500), HIGHER_ESTIMATE varchar(500), FOOTNOTE varchar(500),MEASURE_START_DATE DATE, MEASURE_END_DATE DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
stored as textfile
LOCATION '/user/w205/hospital_compare/readmissions';

#Statement for Measures
DROP TABLE IF EXISTS surveys_responses;
CREATE EXTERNAL TABLE surveys_responses (Provider_ID INT, Hospital_Name VARCHAR(500), Address VARCHAR(500), City VARCHAR(500), State VARCHAR(500), ZIP_Code VARCHAR(500), County_Name VARCHAR(500), Phone_Number VARCHAR(500), Measure_Name VARCHAR(500), Measure_ID VARCHAR(500), Measure_Response VARCHAR(500), Footnote VARCHAR(500), Measure_Start_Date VARCHAR(500), Measure_End_Date VARCHAR(500))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
stored as textfile
LOCATION '/user/w205/hospital_compare/Measures';

#Statement for Survey Responses
DROP TABLE IF EXISTS surveys_responses;
CREATE EXTERNAL TABLE surveys_responses (Provider_ID INT, Hospital_Name VARCHAR(500), Address VARCHAR(500), City VARCHAR(500), State VARCHAR(500), ZIP_Code VARCHAR(500), County_Name VARCHAR(500), Communication_with_Nurses_Achievement_Points VARCHAR(500), Communication_with_Nurses_Improvement_Points VARCHAR(500), Communication_with_Nurses_Dimension_Score VARCHAR(500), Communication_with_Doctors_Achievement_Points VARCHAR(500), Communication_with_Doctors_Improvement_Points VARCHAR(500), Communication_with_Doctors_Dimension_Score VARCHAR(500), Responsiveness_of_Hospital_Staff_Achievement_Points VARCHAR(500), Responsiveness_of_Hospital_Staff_Improvement_Points VARCHAR(500), Responsiveness_of_Hospital_Staff_Dimension_Score VARCHAR(500), Pain_Management_Achievement_Points VARCHAR(500), Pain_Management_Improvement_Points VARCHAR(500), Pain_Management_Dimension_Score VARCHAR(500), Communication_about_Medicines_Achievement_Points VARCHAR(500), Communication_about_Medicines_Improvement_Points VARCHAR(500), Communication_about_Medicines_Dimension_Score VARCHAR(500), Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points VARCHAR(500), Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points VARCHAR(500), Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score VARCHAR(500), Discharge_Information_Achievement_Points VARCHAR(500), Discharge_Information_Improvement_Points VARCHAR(500), Discharge_Information_Dimension_Score VARCHAR(500), Overall_Rating_of_Hospital_Achievement_Points VARCHAR(500), Overall_Rating_of_Hospital_Improvement_Points VARCHAR(500), Overall_Rating_of_Hospital_Dimension_Score VARCHAR(500), HCAHPS_Base_Score INT, HCAHPS_Consistency_Score INT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = '"',
   "escapeChar"    = '\\'
)
stored as textfile
LOCATION '/user/w205/hospital_compare/surveys_responses';
