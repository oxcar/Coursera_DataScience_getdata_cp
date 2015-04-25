source("r_scripts/functions.R")

load_features <- function(generate_intermediate_files = FALSE) {
  # Read the features from file
  features <- read.table("UCI HAR Dataset//features.txt")
  # Rename the columns
  names(features) <- c("id", "name")
  if(generate_intermediate_files == TRUE) {
    write_data_to_csv_file(features, "features.csv")
  }
  features
}


