library(dplyr)
source("r_scripts/functions.R")

summarise_data <- function(data, generate_intermediate_files = TRUE) {

  summarised <- data %>%
    dplyr::group_by(activity_code, activity_name, subject) %>%
    dplyr::summarise_each(funs(mean))
  
  if(generate_intermediate_files == TRUE) {
    write_data_to_csv_file(summarised, "summarised.csv")
  }
  summarised
  
}



