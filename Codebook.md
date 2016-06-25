# Codebook for produced data

This codebook provides explanations of the structure of the produced
data set.

## Description
The resulting data are a 180 row, 88 column table. This can be read in
using the following code:

``` R
readInGrp <- read.table(file = 'grouped.tbl', header = TRUE)
### View a little data
head(readInGrp)
```

## Rows

Each row contains the following:

* A subject number, an `int`
* An activity level factor variable, labeled using the `activity_labels.txt`
  from the data
* The `mean` of each measurement containing `mean` or `stdev` (case-insensitive).
  Data were normalized pre-arithmetic mean to be between [-1, 1].

The 180 rows represent each 30 subjects under each of the 6 activities.

## Columns
The following columns exist in the data set. Be aware that many have
`XYZ` dimensions, indicating whether the sensor was measuring in the
`X`, `Y`, or `Z` axis.

Columns with `mean` in the name represent the arithmetic mean. Columns
with `stdev` represent the standard deviation. Recall that a mean was
run over all these columns to produce the data, so each column begins
with `mean_`.

* `Subject` - an `int` identifying the subject
* `ActivityDuringMeasurement` - a factor variable labeling the activity that
  the subject was undergoing during the measurement
* `mean_tBodyAcc_mean_[XYZ]` - three columns representing the mean acceleration
  in the three axes.
* `mean_tGravityAcc_mean_XYZ` - three columns representing the gravity
  acceleration in 3 axes.
* `mean_tBodyAccJerk_mean_XYZ` - jerk signals derived from the body
  linear acceleration and angular momentum in 3 axes via the
  accelerometer.
* `mean_tBodyGyro_mean_XYZ` - three columns representing the gyroscope
  in 3 axes.
* `mean_tBodyGyroJerk_mean_XYZ` - jerk signals derived from the body
  linear acceleration and angular momentum in 3 axes via the
  gyroscope.
* `mean_tBodyAccMag_mean` - magnitude of the three-dimensional signal
  from `tBodyAcc` via a Euclidean norm.
* `mean_tGravityAccMag_mean` - magnitude of the three-dimensional signal from
  `tGravityAcc` via a Euclidean norm.
* `mean_tBodyAccJerkMag_mean` - magnitude of the three-dimensional signal from
  `tGravityAcc` via a Euclidean norm.
* `mean_tBodyGyroMag_mean` - magnitude of the three-dimensional signal from
  `tGravityAcc` via a Euclidean norm.
* `mean_tBodyGyroJerkMag_mean` - magnitude of the three-dimensional signal from
  `tGravityAcc` via a Euclidean norm.
* `mean_fBodyAcc_mean_XYZ` - Fast Fourier Transform (FFT) on `tBodyAcc`.
* `mean_fBodyAccJerk_mean_XYZ` - FFT on `tBodyAccJerk`.
* `mean_fBodyGyro_mean_XYZ` - FFT on `tBodyGyro`.
* `mean_fBodyAccMag_mean` - FFT on `tBodyAccMag`.
* `mean_fBodyAccJerkMag_mean` - FFT on `tBodyAccJerkMag`.
* `mean_fBodyGyroMag_mean` - FFT on `tBodyGyroMag`.
* `mean_fBodyGyroJerkMag_mean` - FFT on `tBodyGyroJerkMag`.

The next columns are all represented above, but instead of means, they
represent the standard deviations.

* `mean_tBodyAcc_std_X`
* `mean_tBodyAcc_std_Y`
* `mean_tBodyAcc_std_Z`
* `mean_tGravityAcc_std_X`
* `mean_tGravityAcc_std_Y`
* `mean_tGravityAcc_std_Z`
* `mean_tBodyAccJerk_std_X`
* `mean_tBodyAccJerk_std_Y`
* `mean_tBodyAccJerk_std_Z`
* `mean_tBodyGyro_std_X`
* `mean_tBodyGyro_std_Y`
* `mean_tBodyGyro_std_Z`
* `mean_tBodyGyroJerk_std_X`
* `mean_tBodyGyroJerk_std_Y`
* `mean_tBodyGyroJerk_std_Z`
* `mean_tBodyAccMag_std`
* `mean_tGravityAccMag_std`
* `mean_tBodyAccJerkMag_std`
* `mean_tBodyGyroMag_std`
* `mean_tBodyGyroJerkMag_std`
* `mean_fBodyAcc_std_X`
* `mean_fBodyAcc_std_Y`
* `mean_fBodyAcc_std_Z`
* `mean_fBodyAccJerk_std_X`
* `mean_fBodyAccJerk_std_Y`
* `mean_fBodyAccJerk_std_Z`
* `mean_fBodyGyro_std_X`
* `mean_fBodyGyro_std_Y`
* `mean_fBodyGyro_std_Z`
* `mean_fBodyAccMag_std`
* `mean_fBodyBodyAccJerkMag_std`
* `mean_fBodyBodyGyroMag_std`
* `mean_fBodyBodyGyroJerkMag_std`
