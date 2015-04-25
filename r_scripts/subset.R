source("r_scripts/functions.R")

subset <- function(data, features, generate_intermediate_files = TRUE) {
  # Which columns are mean()
  means <- grep("mean[()]", features$name)
  # Which columns are std()
  stds <- grep("std[()]", features$name)
  # Extra columns: activity_code, activity_name, subject, train_or_test
  extras <- c(562:565)
  
  columns <- c(means, stds, extras)
  
  subset_merged <- data[, columns]
  
  if(generate_intermediate_files == TRUE) {
    write_data_to_csv_file(subset_merged, "subset_merged.csv")
  }
  
  subset_merged
}

