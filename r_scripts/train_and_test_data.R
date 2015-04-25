source("r_scripts/functions.R")

#----------------------------------------------------------------------
# Test Data
#----------------------------------------------------------------------
load_test_data <- function(features, generate_intermediate_files = FALSE) {
  # Read X Data from Test
  test_data <- read.table("UCI HAR Dataset/test//X_test.txt")
  # Name the columns as the features names
  names(test_data) <- features$name
  # Read activities
  test_activities <- read.table("UCI HAR Dataset/test//y_test.txt")
  test_data$activity_code <- test_activities$V1
  test_data$activity_name <- translate_activity_codes(test_activities$V1)
  # Read Test subjects
  test_subjects <- read.table("UCI HAR Dataset/test//subject_test.txt")
  test_data$subject <- test_subjects$V1
  # Add extra info to know which data set the info is from
  test_data$train_or_test = "TEST"
  if(generate_intermediate_files == TRUE) {
    write_data_to_csv_file(test_data, "test.csv")
  }
  test_data
}

#----------------------------------------------------------------------
# Train Data
#----------------------------------------------------------------------
load_train_data <- function(features, generate_intermediate_files = FALSE) {
  # Read X Data from Train
  train_data <- read.table("UCI HAR Dataset/train//X_train.txt")
  # Name the columns as the features names
  names(train_data) <- features$name
  # Read activities
  train_activities <- read.table("UCI HAR Dataset/train//y_train.txt")
  train_data$activity_code <- train_activities$V1
  train_data$activity_name <- translate_activity_codes(train_activities$V1)
  # Read Train subjects
  train_subjects <- read.table("UCI HAR Dataset/train//subject_train.txt")
  train_data$subject <- train_subjects$V1
  # Add extra info to know which data set the info is from
  train_data$train_or_test = "TRAIN"
  if(generate_intermediate_files == TRUE) {
    write_data_to_psv_file(train_data, "train.psv")
  }
  train_data
}



