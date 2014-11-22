How run_analysis.R script works
========
## Prerequisites
You must first download data file from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and unzip it in your working directory.  
Your working directory should contain following files.  

* features.txt
* activity_labels.txt
* train/X_train.txt
* train/y_train.txt
* train/subject_train.txt
* test/X_test.txt
* test/y_test.txt
* test/subject_test.txt

## Do Analysis
Go to your working directory and run "run_analysis.R" script.  
The script reads in above files and outputs a summarized file
called "features_summary_data.txt" in the same directory.  

Please read the comments written in the script if you want
to know what the script does and how it works in more detail.
