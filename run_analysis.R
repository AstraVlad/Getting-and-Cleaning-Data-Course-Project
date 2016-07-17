run_analyis <- function(){
#Loading train dataset
train <- read.table("./UCI/train/X_train.txt")
#Making column names comprehensible
cnames <- read.table("./UCI/features.txt")
colnames(train) <- cnames$V2
#Loading test dataset
test <- read.table("./UCI/test/X_test.txt")
#Making column names comprehensible
colnames(test) <- cnames$V2
#Loading subjects and activities names for train dataset
train_subjects <- read.table("./UCI/train/subject_train.txt")
train_y <- read.table("./UCI/train/y_train.txt")
#Making column names comprehensible
colnames(train_subjects) <- "subjects"
colnames(train_y) <- "activities"
#Combining subjects, activities and actual data for training dataset
train_all <- cbind(train_subjects, train_y, train)
#Loading subjects and activities names for test dataset
test_subjects <- read.table("./UCI/test/subject_test.txt")
test_y <- read.table("./UCI/test/y_test.txt")
#Making column names comprehensible
colnames(test_subjects) <- "subjects"
colnames(test_y) <- "activities"
#Combining subjects, activities and actual data for testing dataset
test_all <- cbind(test_subjects, test_y, test)
#Merging train and test datasets
all_data <- rbind(train_all, test_all)
#Extracting measurements on the mean and standard deviation for each measurement
mean_std_data <- all_data[ ,grepl("mean\\(\\)|std\\(\\)|activities|subjects", colnames(all_data))]
#Loading activities
activities <- read.table("./UCI/activity_labels.txt")
#Making column names comprehensible
colnames(activities) <- c("activities", "activity_name")
#Adding descriptive activity names
mean_std_data <- merge(mean_std_data, activities)
#Aggregating data and calculating average values
agg_output<-aggregate(mean_std_data, list(activity = mean_std_data$activity_name, subject = mean_std_data$subjects), mean)
#Removing unneeded columns
agg_output <- select(agg_output, -(3:4))
agg_output <- select(agg_output, -69)
#Writing data do disk
write.csv(agg_output, "output.csv")
agg_output
}