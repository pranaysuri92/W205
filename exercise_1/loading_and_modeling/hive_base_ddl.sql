DROP TABLE geninfo;
CREATE EXTERNAL TABLE IF NOT EXISTS geninfo 
(provider_id string, hospital_name string, 
address string, city string, state string, zip_code string, country_name string, phone_number string, 
hospital_type string, hospital_ownership string, emergency_services string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/geninfo';

SELECT COUNT(*) FROM geninfo;

DROP TABLE codemapping;
CREATE EXTERNAL TABLE IF NOT EXISTS codemapping
(measure_name string, measure_id string,
measure_start_quarter string, measure_start_date string, 
measure_end_quarter string, measure_end_date string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/codemapping';

select count(*) from codemapping;


DROP TABLE procedurerd;
CREATE EXTERNAL TABLE IF NOT EXISTS procedurerd
(provider_id string, hospital_name string,
address string, city string, state string, zip_code string, country_name string, phone_number string,
measure_name string, measure_id string, compare_to_national string, denominator string, 
score string, lower_estimate string, higher_estimate string, footnote string, measure_start_date string, 
measure_end_date string )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/procedurerd';

select count(*) from procedurerd;

DROP TABLE proceduretec;
CREATE EXTERNAL TABLE IF NOT EXISTS proceduretec
(provider_id string, hospital_name string,
address string, city string, state string, zip_code string, country_name string, phone_number string,
condition string, measure_id string, measure_name string, score string, sample string, footnote string, measure_start_date string, measure_end_date string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/proceduretec';

select count(*) from proceduretec;


DROP TABLE survey;
CREATE EXTERNAL TABLE IF NOT EXISTS survey
(provider_id string, hospital_name string,
address string, city string, state string, zip_code string, country_name string,
NAP string, NIP string, NDS string, DAP string, DIP string, DDS string, SAP string, SIP string,
SDS string, PAP string, PIP string, PDS string, MMAP string, MMIP string, MMDS string, EAP string, EIP string,
EDS string, DIAP string, DIIP string, DIDS string, OAP string, OIP string, ODS string, base_score string, 
consistency_score string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey';

select count(*) from survey;
