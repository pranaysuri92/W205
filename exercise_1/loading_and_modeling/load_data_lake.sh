#Loading and modeling exercise 1

#renamed files on local directory to elimnate spaces and capitalization
#removed title lines in AWS instance using a script
tail -n +2 Hospital\ General\ Information.csv > geninfo.csv
tail -n +2 Measure\ Dates.csv > codemapping.csv
tail -n +2 Timely\ and\ Effective\ Care\ -\ Hospital.csv > proceduretec.csv
tail -n +2 hvbp_hcahps_05_28_2015.csv > survey.csv
tail -n +2 Readmissions\ and\ Deaths\ -\ Hospital.csv > procedurerd.csv

#created a folder in hdfs called hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare

#loaded my files into the hdfs folder
hdfs dfs -put geninfo.csv /user/w205/hospital_compare
hdfs dfs -put codemapping.csv /user/w205/hospital_compare
hdfs dfs -put proceduretec.csv /user/w205/hospital_compare
hdfs dfs -put survey.csv /user/w205/hospital_compare
hdfs dfs -put procedurerd.csv /user/w205/hospital_compare
