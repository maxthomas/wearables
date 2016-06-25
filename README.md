# Assignment README
This file describes the steps taken to complete the course
project for getting and cleaning data.

## Requirements
This script makes use of the `dplyr` libraries. Please make sure
you have it installed if you wish to reproduce the work.

Additionally, please make sure you have downloaded the
wearables data and have changed your working directory
to the unzipped directory. Example:

``` R
download.file(url = '...', dest = 'data.zip')
unzip('data.zip)
setwd('UCI HAR Dataset')
```

## Codebook
Please see [Codebook.md](Codebook.md) for detailed explanations
of the produced data set.

## Reading in the produced data table
An individual can easily read in the generated data
with the following command. Be sure to use `header = TRUE`.

```R
readInGrp <- read.table(file = 'grouped.tbl', header = TRUE)
head(readInGrp)
```

## Script
The included script, `run_analysis.R`, performs the following at
a high level:

1. Reads in `features.txt` and assigns meaningful column names.
2. Makes a unique set of names (the data contains duplicate column names).
3. Reads in `activity_labels.txt` and assigns meaningful column names.
4. Reads in the `X_train.txt` file, using the column names from
   the unique set of names generated earlier.
5. Creates the `ActivityDuringMeasurement` column by first reading in
   `y_train.txt`, then creating a factor variable by calling `factor`.
6. Adds the subject information by reading in `subject_train.txt`.
7. Perform the above steps, but this time for the test data.
8. Merge the data using `rbind` to create one data set (completes
   first assignment).
9. Filter down to only columns with `mean` or `stdev` using `select`
   (completes second task).
10. Group by the correct columns, `Subject` and `ActivityDuringMeasurement`,
    in order to support the final task, creating the tidy data set.
11. Perform the aggregation. This runs `summarize_each` over each non-grouped
    column (that is, every column except `Subject` and `ActivityDuringMeasurement`.
    It applies the `mean` function to each of these columns. This effectively
    generates the average measurement for each subject, for each activity,
    for each numerical measurement.
12. Make the column names a bit more readable.
13. Finally, the table is written out.
