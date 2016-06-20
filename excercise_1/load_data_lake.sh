#download file
wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip

#move file
mv Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary dl.zip 

#unzip file
unzip dl.zip -d hospital_files

#make directory for no header files to go into
mkdir hospital_files/no_head

#take header off of files and move to no header directory
tail -n +2 hospital_files/'Hospital General Information.csv' > hospital_files/no_head/hospitals.csv
tail -n +2 hospital_files/'Timely and Effective Care - Hospital.csv' > hospital_files/no_head/effective_care.csv
tail -n +2 hospital_files/'Readmissions and Deaths - Hospital.csv' > hospital_files/no_head/readmissions.csv
tail -n +2 hospital_files/'Measure Dates.csv' > hospital_files/no_head/Measures.csv
tail -n +2 hospital_files/'hvbp_hcahps_05_28_2015.csv' > hospital_files/no_head/surveys_responses.csv

#check to make sure the no header files are in the no header directory
ls hospital_files/no_head/

#make hdfs directory for no header files 
hdfs dfs -mkdir /user/w205/hospital_compare

#put files into new hdfs directory
hdfs dfs -put hospital_files/no_head/* /user/w205/hospital_compare

#check files have been moved
hdfs dfs -ls /user/w205/hospital_compare
