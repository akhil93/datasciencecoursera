#First lets load the data into R.
#Setting the Path for the Project
read <- function(x) {
     # path to project directory
     directory <- "C:/Users/Akhilkumar/Documents/Books/coursera/DS/UCI HAR Dataset/"
     read.table(paste0(directory, x))
     }

#Loading Train datasets
subject_train <- read("train/subject_train.txt")
train_label <- read("train/y_train.txt")
train <- read("train/X_train.txt")

#Loading Test datasets
subject_test <- read("test/subject_test.txt")
test_label <- read("test/y_test.txt")
test <- read("test/X_test.txt")

#Loading Labels
activity_labels <- read("activity_labels.txt")
features <- myread("features.txt")

#Merges the training and the test sets to create one data set
dat <- rbind(train, test)

#Extracts only the measurements on the mean and standard deviation for each measurement.

inds <- grep("mean()|std()", features[, 2])
dat <- dat[, inds]

## Tidy feature names and rename dat
clean_features <- sapply(features[, 2], function(x) gsub("[()]", "", x))
clean_features <- sapply(clean_features, function(x) gsub("[-,]", "_", x))
names(dat) <- clean_features[inds]

#Appropriately labels the data set with descriptive activity names. 
dat$subject <- c(subject_train[,1], subject_test[,1])
dat$activity <- c(train_label[,1], test_label[,1])
dat$activity <- sapply(dat$activity, function(x) activity_labels[x, 2])

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(plyr)
avgs <- ddply(dat, .(subject, activity), function(x) {
     cols <- !names(x) %in% c("activity", "subject")
     apply(x[, cols], 2, function(y) mean(as.numeric(y)))
 } )

#Writing Data
write.csv(avgs, "averages.csv")
