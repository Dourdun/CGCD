
setwd("C:/Users/Peter/Google Drive/R/Coursera-Cleaning Data/Peer-Assignment")
require(dplyr)


# Get the data ------------------------------------------------------------

########## Training Data  ############

training_x  <- read.table("X_train.txt")
training_y  <- read.table("y_train.txt")
training_subj  <- read.table("subject_train.txt")
features <- read.table("features.txt")

## Setting some names for the variables according to the README.txt

colnames(training_x) <- features$V2
colnames(training_y) <- "activity"
colnames(training_subj) <- "subject"


## Bind everything together

training  <- cbind(training_subj,training_y,training_x)

## Convert the activity variable into a factor

training$activity  <- factor(training$activity,levels=c(1:6),
                                labels=c("WALKING",
                                        "WALKING_UPSTAIRS",
                                        "WALKING_DOWNSTAIRS",
                                        "SITTING",
                                        "STANDING",
                                        "LAYING"))


########## Test Data  ############

test_x  <- read.table("X_test.txt")
test_y  <- read.table("y_test.txt")
test_subj  <- read.table("subject_test.txt")


## Setting some names for the variables according to the README.txt

colnames(test_x) <- features$V2
colnames(test_y) <- "activity"
colnames(test_subj) <- "subject"


## Bind everything together

test  <- cbind(test_subj,test_y,test_x)

## Convert the activity variable into a factor (names from the activity_labels.txt file)

test$activity  <- factor(test$activity,levels=c(1:6),
                             labels=c("WALKING",
                                      "WALKING_UPSTAIRS",
                                      "WALKING_DOWNSTAIRS",
                                      "SITTING",
                                      "STANDING",
                                      "LAYING"))


# 1. Connecting both datasets together (it's not merging....) ---

test_train <- rbind(test,training)


# 2. Extracts only the measurements on the mean and sd --------


tt0 <- test_train[c(1,2)]
tt1  <- test_train [,grepl("mean", colnames(test_train ))]
tt2  <- test_train [,grepl("std", colnames(test_train ))]

tt  <- cbind(tt0,tt1,tt2)



# 3. Uses descriptive activity names to name the activities in the data set ---

# was already done in the beginning


# 4.Appropriately labels the data set with descriptive variable names ----

# was already done in the beginning


# Create  tidy data set with the average of each variable for each subject and activiy

tt <- tbl_df(tt)
tt <-  group_by(tt,subject,activity) 
tt <- summarise_each(tt,funs(mean))


