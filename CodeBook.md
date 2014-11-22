CodeBook for the summarized data set
====
## Original Data Source
The original data has been obtained from:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Please refer to this site to see the detailed description of the data.

## Codebook for the Summarized Data
As I explained in README.md and run_analysis.R files,
the data file "features_summary_data.txt" is a summary of the original data.  
This file has the following fields:  
* **activityLabel** The name of the activity.  
* **subjectId** Subject Id.  
* **mean(XXX)** The mean value of XXX summarized by **activityLabel** and **subjectId**. Training and test data sets are merged together before summarizing.    
Here, **XXX** is the feature name written in "features.txt" file in the original data.  
Please note that not all the features are summarized -- only those feature names containg "mean" and "std" are extracted from the original data and summarized.  
Please further note that **XXX** contains only alphanumeric characters, as I removed away symbol characters such as hyphens, parenthesis and commas from the original feature names when creating summary field names **mean(XXX)**.  There is no theory, just my preference.


