# Import necessary libraries.
library(dplyr)

# Create vector with labels for feature # and label
featureHeaders <- c("FeatureNumber", "FeatureLabel")

# Load the feature labels.
featureLabels <- fread('features.txt', 
                       sep = " ", 
                       col.names = featureHeaders, 
                       header = FALSE)

uniNames <- make.unique(featureLabels$FeatureLabel)

# Load the activity labels.
activityLabels <- fread('activity_labels.txt',
                        sep = " ",
                        header = FALSE,
                        col.names = c("ActivityNumber", "ActivityName"))

# Load the train set.
train <- fread('train/X_train.txt',
               sep = " ",
               header = FALSE,
               col.names = uniNames)

train$ActivityDuringMeasurement <- fread('train/y_train.txt', sep = " ", header = FALSE)
train$ActivityDuringMeasurement <- factor(train$ActivityDuringMeasurement, 
                                          labels = activityLabels$ActivityName)

# Append subject column.
train$Subject <- read.csv(file = 'train/subject_train.txt', sep = "", header = FALSE)

# Load the test set.
test <- fread('test/X_test.txt',
              sep = " ",
              header = FALSE,
              col.names = uniNames)

# Merge with existing test DF.
test$Subject <- read.csv(file='test/subject_test.txt', sep = "", header = FALSE)

# Add activity.
test$ActivityDuringMeasurement <- fread('test/y_test.txt', sep = " ", header = FALSE)
test$ActivityDuringMeasurement <- factor(test$ActivityDuringMeasurement, 
                                         labels = activityLabels$ActivityName)

# Merge names. Completes step 1.
combo <- rbind(test, train)

# Filter on stddev and mean. Completes step 2.
meanStdDev <- select(combo, 
                     contains("mean"), contains("std"),
                     contains("Subject"), contains("Activity")) %>%
  select(-starts_with("angle"), -contains("meanFreq"))

# The activity names are already in the data set from above
# (see ActivityDuringMeasurement column); completes step 3.
# The column names in the data have already been added; completes step 4.

# The data should be grouped by subject and activity in order to produce
# the target tidy data set. So perform that now.
# Get columns to group by.
groupByCols <- c("Subject", "ActivityDuringMeasurement")

# Now group the data
grouped <- meanStdDev %>% 
  # This does the actual grouping
  group_by(Subject, ActivityDuringMeasurement) %>%
  # this runs mean over each of the non-grouped columns
  summarize_each(funs(mean))

## Rename the data to be a little more clear.
# this basically replaces - with _, () with nothing,
# and prepends mean_ to the front.
groupedNames <- c("Subject", "ActivityDuringMeasurement", 
                    paste0("mean_", 
                            gsub("-", "_", 
                                 gsub("\\(\\)", "", names(grouped[3:68])))))

names(grouped) <- groupedNames
  
# Write out the data table to submit.
write.table(grouped, 
            file="grouped.tbl",
            append = FALSE,
            row.names = FALSE,
            col.names = TRUE,
            fileEncoding = "UTF8")
