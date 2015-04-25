# Functions to translate Activity Code to Activity Label
translate_activity_code <- function(activity_code, activity_labels) {
  activity_labels[activity_labels$V1 == activity_code, 2]
}
translate_activity_codes <- function(activity_codes) {
  # Read Activity Labels to translate activities
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  sapply(activity_codes, translate_activity_code, activity_labels = activity_labels)
}

write_data_to_psv_file <- function(data, file_name) {
  base_path <- "./generated_files"
  if(!file.exists(base_path)) {
    dir.create(base_path)
  }
  path <- paste(base_path, file_name, sep = "/")
  write.table(data, path, sep = "|", row.names = FALSE)
}

write_data_to_csv_file <- function(data, file_name) {
  base_path <- "./generated_files"
  if(!file.exists(base_path)) {
    dir.create(base_path)
  }
  path <- paste(base_path, file_name, sep = "/")
  write.table(data, path, sep = ",", row.names = FALSE)
}
