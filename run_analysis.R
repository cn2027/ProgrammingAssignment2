#Properly label the the measured data
#Assign column names for the signals in the Feature Selection file "features.txt"
features.signals <- read.csv("/Users/ChannyNic/UCI HAR Dataset/features.txt", 
                                header=FALSE,
                                col.names = c('feature.ID', 'signal'),
                                sep = ' ');
#Assign column names for the activity names in the Activity Labels file "activity_labels.txt"
activity.labels <- read.csv("/Users/ChannyNic/UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names = c('activity.ID','activity.Name'),sep = ' ');
#Create/tidy up the test set data
#Read the three test files: "subject_test.txt","X_test.txt", and "y_test.txt" and label columns
#'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
subject.test <- read.csv("/Users/ChannyNic/UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names = c('subject.ID'));
#'test/X_test.txt': Test set.
test.set <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"");
#test/y_test.txt': Test labels.
test.labels <- read.csv("/Users/ChannyNic/UCI HAR Dataset/test/y_test.txt",header=FALSE, col.names = c('activity.ID'));
#Use features signal names for test.set data
test.set.names <- features.signals[,2]
colnames(test.set) <- test.set.names
full.test.set <- cbind(subject.test,test.labels, test.set.names)
#Create/tidy up the trainiing set data
#Read the three training files: "subject_train.txt","X_train.txt", and "y_train.txt" and label columns
#'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
subject.train <- read.csv("/Users/ChannyNic/UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names = c('subject.ID'));
#'train/X_train.txt': Training set.
train.set <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"");
#'train/y_train.txt': Training labels.
train.labels <- read.csv("/Users/ChannyNic/UCI HAR Dataset/train/y_train.txt",header=FALSE, col.names = c('activity.ID'));
train.set.names <- features.signals[,2]
colnames(train.set) <- train.set.names
full.train.set <- cbind(subject.train,train.labels, train.set)
#1.Merge the training and the test sets to create one data set.
dataset <- rbind(full.train.set,full.test.set)
#2Extract only the measurements on the mean and standard deviation for each measurement. 
selected.features.mean<-features.signals[grep("-mean",features.signals$measurementName),]
selected.features.Mean<-features.signals[grep("Mean",features.signals$measurementName),]
selected.features.std<-features.signals[grep("std",features.signals$measurementName),]
all.feature.mean.std<-rbind(selected.features.mean,selected.features.Mean,selected.features.std)
View(all.feature.mean.std)
write.table(all.feature.mean.std,"mean.std.txt",row.name=FALSE)

