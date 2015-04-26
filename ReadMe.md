
# Course Project

## Script

The Script is separated among various files:

```
run_script.R
r_scripts/
|__functions.R
|__features.R
|__train_and_test_data.R
|__merge.R
|__subset.R
|__summarise.R
```
The main script file is in `run_script.R`. It sources the R files in `r_scripts/` folder and uses the functions declared in those files.


#### functions.R

Contains functions shared by the rest of R files.

`write_data_to_psv_file(data, file_name)` : 

* Writes the data frame `data` to file with file name `file_name`

`translate_activity_codes(activity_codes)` : 

* Reads the activity labels from file and uses them to translate `activity_codes`
* Returns a vector with the translations.

`translate_activity_code(activity_code, activity_labels)` : 

* Search for `activity_code` inside `activity_labels`

#### features.R

`load_features(generate_intermediate_files = FALSE)` : 

* Reads the features file `UCI HAR Dataset//features.txt` to a data frame. 
* Optionally it saves the features as PSV.
* Returns the features data frame

#### train_and_test_data.R

`load_train_data(features, generate_intermediate_files = FALSE)` : 

* Reads the train data file `UCI HAR Dataset/train/X_train.txt` to a data frame. 
* Changes the train data frame columns names using the `features` data frame. 
* Reads the activity codes file `UCI HAR Dataset/train/y_train.txt` and adds a new column `activity_code` to the train data frame. 
* Adds a new column `activity_name` with the `activity_code`column translated to text.
* Reads `UCI HAR Dataset/train/subject_train.txt` and adds a new column `subject` to the train data frame.
* Optionally it saves train data set to a PSV
* Returns the train data frame.

`load_test_data(features, generate_intermediate_files = FALSE)` : 

* Reads the test data file `UCI HAR Dataset/test/X_test.txt` to a data frame. 
* Changes the test data frame columns names using the `features` data frame. 
* Reads the activity codes file `UCI HAR Dataset/test/y_test.txt` and adds a new column `activity_code` to the test data frame. 
* Adds a new column `activity_name` with the `activity_code`column translated to text.
* Reads `UCI HAR Dataset/test/subject_test.txt` and adds a new column `subject` to the test data frame.
* Optionally it saves test data set to a PSV
* Returns the test data frame.

#### merge.R

`merge_train_and_test(train_data, test_data, generate_intermediate_files = TRUE)` :

* Merges tran and tes data frames using row binding
* Optionally it saves the merged data frame to PSV

#### subset.R

`subset(data, features, generate_intermediate_files = TRUE)` : 

* Reads the features data frame and extracts the features with `mean()` and `std()` in its names.
* Is selects only the columns with features of `mean()`, `std()` and the new columns added in `train_and_test_data.R`: `activity_code`, `activity_name`, `subject`, `train_or_test`
* Optionally it saves the new data frame to PSV
* Returns the new data frame

#### summarise.R

`summarise_data(data, generate_intermediate_files = TRUE)` :
* Reads data, gorups it by activity and subject, and calculates the mean for every variable, except for the grouped ones.
* Saves the data to file

