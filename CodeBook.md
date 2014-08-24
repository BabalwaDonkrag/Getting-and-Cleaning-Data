### Getting and Cleaning Data Project

## Source Data
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

##Section 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt
Assign column names and merge to create one data set.

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement.

Create a logical vector that contains TRUE values for the ID, mean and std columns and FALSE values for the others.
Subset this data to keep only the necessary columns.

## Section 3. Use descriptive activity names to name the activities in the data set

Activities read from activity_labels.txt
walking
walkingupstairs
walkingdownstairs
sitting
standing
laying

## Section 4. Appropriately label the data set with descriptive activity names.

The script will label the data set with descriptive names: 
tbodyacc-mean-x
tbodyacc-mean-y
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

The script will create a tidy data set with the average of each measurement for each activity and each subject.
The result is saved as 'Tidy Data Averages.txt'.

Babalwa