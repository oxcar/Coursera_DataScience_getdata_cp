source("r_scripts/functions.R")

merge_train_and_test <- function(train_data, test_data, generate_intermediate_files = TRUE) {
  # Merge of Train and Test Data
  merged_data <- rbind(train_data, test_data)
  if(generate_intermediate_files == TRUE) {
    write_data_to_csv_file(merged_data, "merged.csv")
  }
  merged_data
}



