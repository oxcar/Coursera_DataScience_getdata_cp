
source("r_scripts/features.R")
source("r_scripts/train_and_test_data.R")
source("r_scripts/merge.R")
source("r_scripts/subset.R")
source("r_scripts/summarise.R")

features <- load_features()
train_data <- load_train_data(features)
test_data <- load_test_data(features)
merged_data <- merge_train_and_test(train_data, test_data)
subset_merged <- subset(merged_data, features)
summarised_data <- summarise_data(subset_merged)

