# Coursera-Getting-Cleaning-Data-Project
Getting &amp; Cleaning Data Project

This repository is created for Getting & Cleaning Data course project by Coursera.

The name of the R script is `run_analysis.R`.

### Descriptions about `run_anaylsis.R` script

1. Load Training data
2. Load Testing data
3. Load features & activity labels from the text file provided
4. Grep mean & std features from the features list.
5. Extract mean and standard deviation features only
6. Merge training n testing set while inserting the column names
7. Extract the measurements on the mean and standard deviation for each measurement
8. Replace the value of Activity from id into descriptive (string)
9. Remove NA values
10. Create Tidy dataset
11. Output the Tidy Data into a text file called `tidy.txt`
12. Script end


### Instructions for running `run_analysis.R` script

1. Download the dataset provided by coursera into the working directory.
2. Extract the data
3. Source run_analysis.R
4. Enjoy

### Example of output when running `run_analysis.R` script

```
[1] "Welcome to Getting and Cleaning Data Course Project by Hazim Hanif"
[1] "Loading training data..."
[1] "Loding testing data...."
[1] "Loading the features & activity labels.."
[1] "Extracting the mean and standard deviation features only.."
[1] "Merging training set and testing set.."
[1] "Extract the measurements on the mean and standard deviation for each measurement."
[1] "Replace the value of Activity from id into descriptive (string)"
[1] "Removing NA values"
[1] "Creating Tidy dataset"
[1] "Output the Tidy Data into a text file"
[1] "Script ending..."
```


