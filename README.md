#CleanData_CourseProject

In order to process the data downloaded for this assignment, run the run_analysis.R script with the data files in your working directory (in the 'data' directory).

**Assignment Step 1 - Merge the data**

This step merges the disparate files into a single data frame for further processing.

  1. Load all test data into six separate data frames (subject, x, and y for both test and train data)
  2. Check that the data is clean and can be assembled (no NAs, same dimensions prior to binding)
  3. Merge the test and train data separately using cbind() to create a single data frame for test and one for train
  4. Combine the test and train data frames using rbind() to create a single data set

**Assignment Step 4- Use appropriate variable names**

Performing this step out of order, allowed an easier mapping of the data columns which already existed in a file

  1. Load the features.txt file into a DF to apply to full data frame column names
  2. Prepend the list of features with "Subject" and "Activity" to ensure columns lineup with names
  3. Make sure the lengths match before doing so

**Assignment Step 2 - Extract only measures with mean and std dev**

I chose to include the angle variables based on research in the class forum - there is some debate whether they should be

  1. Using a regex to find any column name with "Subject", "Activity", "Mean", or "Std" and produce a selection vector
  2. Apply the vector to subset the merged data frame, yielding only the correct columns (see code book below for definitions)

**Assignment Step 3 - Use descriptive Activity Names**

Again, I used the a lookup for this, the activities_label.txt file

  1. Load the lookup file
  2. Apply this short vector against the entire data frame's Activity column and change them from numbers to factors

**Assignment Step 5 - Create unique tidy data set with average of each variable for each activity and subject**

Using the reshape library, we build a new tidy data set

  1. Melt the data frame using Subject and Activity as ID variables, the rest as measures
  2. Use ddply to apply a summarizing pass using the mean function on all data
  3. dcast the results into a small data frame by collapsing the data by Subject and Activity - averaging all data
  4. Write the tidy data set to disk


#Code Book
*All measures normalized and bounded within [-1,1]*
*All 't' measures denote Time domain signals*
*All 'f' measures denote Frequency domain signals*

**Categorical Variables**
- Subject - The subject performing the activity - 30 subjects
- Activity - The activity the subject was performing - 6 activity factors

**Body Acceleration Measures (Time)**
- tBodyAcc-mean()-X - Mean X value of Body Acceleration measure
- tBodyAcc-mean()-Y - Mean Y value of Body Acceleration measure
- tBodyAcc-mean()-Z - Mean Z value of Body Acceleration measure
- tBodyAcc-std()-X - Mean of Std. Dev. of X value of Body Acceleration measure
- tBodyAcc-std()-Y - Mean of Std. Dev. of Y value of Body Acceleration measure
- tBodyAcc-std()-Z - Mean of Std. Dev. of Z value of Body Acceleration measure

**Gravity Acceleration Measures (Time)**
- tGravityAcc-mean()-X - Mean X value of Gravity Acceleration measure
- tGravityAcc-mean()-Y - Mean Y value of Gravity Acceleration measure
- tGravityAcc-mean()-Z - Mean Z value of Gravity Acceleration measure
- tGravityAcc-std()-X - Mean of Std. Dev. of X value of Gravity Acceleration measure
- tGravityAcc-std()-Y - Mean of Std. Dev. of Y value of Gravity Acceleration measure
- tGravityAcc-std()-Z - Mean of Std. Dev. of Z value of Gravity Acceleration measure

**Body Acceleration Jerk Measures (Time)**
- tBodyAccJerk-mean()-X - Mean X value of Body Acceleration Jerk measure
- tBodyAccJerk-mean()-Y - Mean Y value of Body Acceleration Jerk measure
- tBodyAccJerk-mean()-Z - Mean Z value of Body Acceleration Jerk measure
- tBodyAccJerk-std()-X - Mean of Std. Dev. of X value of Body Acceleration Jerk measure
- tBodyAccJerk-std()-Y - Mean of Std. Dev. of Y value of Body Acceleration Jerk measure
- tBodyAccJerk-std()-Z - Mean of Std. Dev. of Z value of Body Acceleration Jerk measure

**Body Gyro Measures (Time)**
- tBodyGyro-mean()-X - Mean X value of Body Gyro measure
- tBodyGyro-mean()-Y - Mean Y value of Body Gyro measure
- tBodyGyro-mean()-Z - Mean Z value of Body Gyro measure
- tBodyGyro-std()-X - Mean of Std. Dev. of X value of Body Gyro measure
- tBodyGyro-std()-Y - Mean of Std. Dev. of Y value of Body Gyro measure
- tBodyGyro-std()-Z - Mean of Std. Dev. of Z value of Body Gyro measure

**Body Gyro Jerk Measures (Time)**
- tBodyGyroJerk-mean()-X - Mean X value of Body Gyro Jerk measure
- tBodyGyroJerk-mean()-Y - Mean Y value of Body Gyro Jerk measure
- tBodyGyroJerk-mean()-Z - Mean Z value of Body Gyro Jerk measure
- tBodyGyroJerk-std()-X - Mean of Std. Dev. of X value of Body Gyro Jerk measure
- tBodyGyroJerk-std()-Y - Mean of Std. Dev. of Y value of Body Gyro Jerk measure
- tBodyGyroJerk-std()-Z - Mean of Std. Dev. of Z value of Body Gyro Jerk measure

**Body Acceleration Magnitude Measures (Time)**
- tBodyAccMag-mean() - Mean value of Body Acceleration Magnitude measure
- tBodyAccMag-std() - Std. Dev. value of Body Acceleration Magnitude measure

**Gravity Acceleration Magnitude Measures (Time)**
- tGravityAccMag-mean() - Mean value of Gravity Acceleration Magnitude measure
- tGravityAccMag-std() - Std. Dev. value of Gravity Acceleration Magnitude measure

**Body Acceleration Jerk Magnitude Measures (Time)**
- tBodyAccJerkMag-mean() - Mean value of Body Acceleration Jerk Magnitude measure
- tBodyAccJerkMag-std() - Std. Dev. value of Body Acceleration Jerk Magnitude measure

**Body Gyro Magnitude Measures (Time)**
- tBodyGyroMag-mean() - Mean value of Body Gyro Magnitude measure
- tBodyGyroMag-std() - Std. Dev. value of Body Gyro Magnitude measure

**Body Gyro Jerk Magnitude Measures (Time)**
- tBodyGyroJerkMag-mean() - Mean value of Body Gyro Jerk Magnitude measure
- tBodyGyroJerkMag-std() - Std. Dev. value of Body Gyro Jerk Magnitude measure

**Body Acceleration Measures (Frequency)**
- fBodyAcc-mean()-X - Mean X value of Body Acceleration measure
- fBodyAcc-mean()-Y - Mean Y value of Body Acceleration measure
- fBodyAcc-mean()-Z - Mean Z value of Body Acceleration measure
- fBodyAcc-std()-X - Mean of Std. Dev. of X value of Body Acceleration measure
- fBodyAcc-std()-Y - Mean of Std. Dev. of Y value of Body Acceleration measure
- fBodyAcc-std()-Z - Mean of Std. Dev. of Z value of Body Acceleration measure
- fBodyAcc-meanFreq()-X - Weighted average of the frequency components of X value of Body Acceleration measure
- fBodyAcc-meanFreq()-Y - Weighted average of the frequency components of Y value of Body Acceleration measure
- fBodyAcc-meanFreq()-Z - Weighted average of the frequency components of Z value of Body Acceleration measure

**Body Acceleration Jerk Measures (Frequency)**
- fBodyAccJerk-mean()-X - Mean X value of Body Acceleration Jerk measure
- fBodyAccJerk-mean()-Y - Mean Y value of Body Acceleration Jerk measure
- fBodyAccJerk-mean()-Z - Mean Z value of Body Acceleration Jerk measure
- fBodyAccJerk-std()-X - Mean of Std. Dev. of X value of Body Acceleration Jerk measure
- fBodyAccJerk-std()-Y - Mean of Std. Dev. of Y value of Body Acceleration Jerk measure
- fBodyAccJerk-std()-Z - Mean of Std. Dev. of Z value of Body Acceleration Jerk measure
- fBodyAccJerk-meanFreq()-X - Weighted average of the frequency components of X value of Body Acceleration Jerk measure
- fBodyAccJerk-meanFreq()-Y - Weighted average of the frequency components of Y value of Body Acceleration Jerk measure
- fBodyAccJerk-meanFreq()-Z - Weighted average of the frequency components of Z value of Body Acceleration Jerk measure

**Body Gyro Measures (Frequency)**
- fBodyGyro-mean()-X - Mean X value of Body Gyro measure
- fBodyGyro-mean()-Y - Mean Y value of Body Gyro measure
- fBodyGyro-mean()-Z - Mean Z value of Body Gyro measure
- fBodyGyro-std()-X - Mean of Std. Dev. of X value of Body Gyro measure
- fBodyGyro-std()-Y - Mean of Std. Dev. of Y value of Body Gyro measure
- fBodyGyro-std()-Z - Mean of Std. Dev. of Z value of Body Gyro measure
- fBodyGyro-meanFreq()-X - Weighted average of the frequency components of X value of Body Gyro measure
- fBodyGyro-meanFreq()-Y - Weighted average of the frequency components of Y value of Body Gyro measure
- fBodyGyro-meanFreq()-Z - Weighted average of the frequency components of Z value of Body Gyro measure

**Body Acceleration Magnitude Measures (Frequency)**
- fBodyAccMag-mean() - Mean value of Body Acceleration Magnitude measure
- fBodyAccMag-std() - Std. Dev. value of Body Acceleration Magnitude measure
- fBodyAccMag-meanFreq() - Weighted average of the frequency components of value of Body Acceleration Magnitude measure

**Body Body Acceleration Jerk Magnitude Measures (Frequency)**
- fBodyBodyAccJerkMag-mean() - Mean value of Body Acceleration Jerk Magnitude measure
- fBodyBodyAccJerkMag-std() - Std. Dev. value of Body Acceleration Jerk Magnitude measure
- fBodyBodyAccJerkMag-meanFreq() - Weighted average of the frequency components of value of Body Acceleration Jerk Magnitude measure

**Body Body Gyro Magnitude Measures (Frequency)**
- fBodyBodyGyroMag-mean() - Mean value of Body Gyro Magnitude measure
- fBodyBodyGyroMag-std() - Std. Dev. value of Body Gyro Magnitude measure
- fBodyBodyGyroMag-mean() - Weighted average of the frequency components of value of Body Gyro Magnitude measure

**Body Body Gyro Jerk Magnitude Measures (Frequency)**
- fBodyBodyGyroJerkMag-mean() - Mean value of Body Gyro Jerk Magnitude measure
- fBodyBodyGyroJerkMag-std() - Std. Dev. value of Body Gyro Jerk Magnitude measure
- fBodyBodyGyroJerkMag-mean() - Weighted average of the frequency components of value of Body Gyro Jerk Magnitude measure

**Angle Measures**
- angle(tBodyAccMean,gravity) - Angle between tBodyAccMean and gravity vectors
- angle(tBodyAccJerkMean,gravityMean) - Angle between tBodyAccJerkMean and gravityMean vectors
- angle(tBodyGyroMean,gravityMean) - Angle between tBodyGyroMean and gravityMean vectors
- angle(tBodyGyroJerkMean,gravityMean) - Angle between tBodyGyroJerkMean and gravityMean vectors
- angle(X,gravityMean) - Angle between X and gravityMean vectors
- angle(Y,gravityMean) - Angle between Y and gravityMean vectors
- angle(Z,gravityMean) - Angle between Z and gravityMean vectors
