# JohnHopkins--Data--Science--3
Getting and Cleaning Data Course

In general, the run_analysis.R script takes the various files for the data and feature labels of the UCI HAR Dataset,
combines them into one file, and then creates a separate tidy dataset from them.

The steps are:

1) The y_train.txt and y_test.txt files are read for the activity data.
2) The subject_train.txt and subject_test.txt are read for the subject data.
3) The feature test and train data are read for the feature labels.
4) The subject train/test and activity train/test datasets are combined
5) The feature train/test data is combined.
6) The column names for the subject and activity data sets are set.
7) The feature titles are extracted from the combined feature data set.
8) The subject and activity data sets are combined.
9) The aforementioned combined data(subject and activity) are combined with the combined feature set.
10) All of this data is read into a data frame.
11) A grep is performed to find all features matching the 'std' or mean' titles
12) Each of the activity fields are replaced with their stringified names (WALKING,STANDING, etc).
13) Each of the the feature names with abbreviations such as Acc, Mag, are given longer names (Accelerometer,etc).
14) An aggregation of the combined data is performed and a mean is performed on the Subject and Activity fields.
15) The data is ordered.
16) The "tidydataset.txt" file is created from the write.table() function with row.name=FALSE
