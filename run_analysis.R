print("Welcome to Getting and Cleaning Data Course Project by Hazim Hanif")


# Load Training data
print("Loading training data...")
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_label <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load Testing data
print("Loding testing data....")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_label <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Load features,activity labels & grep mean/std features list 
print("Loading the features & activity labels..")
features <- read.table("UCI HAR Dataset/features.txt", sep = " ", stringsAsFactors = F)
act_label <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = F)

print("Extracting the mean and standard deviation features only..")
mean_list <- grep("mean",features[,2])
std_list <- grep("std",features[,2])

# Merge training n testing set
# Insert column(features) names
print("Merging training set and testing set..")
data_all <- rbind((cbind(train_data,train_label,subject_train)),(cbind(test_data,test_label,subject_test)))
names(data_all) <- features[,2]
names(data_all)[562] <- "Activity"
names(data_all)[563] <- "Subject"

print("Extract the measurements on the mean and standard deviation for each measurement.")
ext_features_pos <- c(mean_list,std_list)
data_ext <- data_all[,c(563,562,ext_features_pos)]

print("Replace the value of Activity from id into descriptive (string)")
for(i in act_label[,1]){
data_ext$Activity <- replace(data_ext$Activity,data_ext$Activity %in% act_label[i,1],act_label[i,2])
}

print("Removing NA values")
data_ext <- na.omit(data_ext)

# Tidy Dataset
# Extract the average of each variable based on each activity based on each subject
# Names the columns
print("Creating Tidy dataset")
tidy_data <- as.data.frame(c())
  
for(sub in 1:30){
  for(act in act_label[,2]){
    temp <- as.numeric(sapply(data_ext[which((data_ext$Subject==sub) & (data_ext$Activity==act)),3:length(data_ext)],mean))
    tidy_data <- rbind(tidy_data,cbind(sub,act,rbind(temp[1:79])))
  }
}
names(tidy_data) <- names(data_ext)

print("Output the Tidy Data into a text file")
write.table(tidy_data, "tidy.txt", row.names = FALSE, quote = FALSE)

print("Script ending...")
