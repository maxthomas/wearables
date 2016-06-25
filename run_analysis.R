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
meanStdDev <- select(combo, contains("mean"), contains("std"))