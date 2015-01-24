library('plyr');

features<-read.csv('features.txt', sep = '', header = FALSE);

x_test<-read.csv('test//X_test.txt', sep = '', header = FALSE);
colnames(x_test)<-features[[2]];

x_train<-read.csv('train//X_train.txt', sep = '', header = FALSE);
colnames(x_train)<-features[[2]];

#1. merged test and training data
mergedData<-rbind(x_test,x_train);

varNames<-colnames(mergedData);
meanAndStdCols<-varNames[grep('(.*-mean.*)|(.*-std.*)',varNames)];

#2. Extracted only information of mean and standard deviation
filteredData<-subset(mergedData, select = meanAndStdCols);

activity_labels<-read.csv('activity_labels.txt', sep = '', header = FALSE);
colnames(activity_labels)<-c('activity.id','activity.label');

y_test<-read.csv('test/y_test.txt', sep = '', header = FALSE);
y_train<-read.csv('train/y_train.txt', sep = '', header = FALSE);
yMerged<-append(y_test[[1]], y_train[[1]]);

filteredData$activity<-yMerged

#3. descriptive names added tp show the activity of each record.
filteredData<-merge(filteredData, activity_labels, by.x = "activity", by.y = "activity.id");


#Add subject variable to dataframe
subject_test<-read.csv('test//subject_test.txt', sep = '', header = FALSE);
subject_train<-read.csv('train//subject_train.txt', sep = '', header = FALSE);
filteredData$subject<-append(subject_test[[1]], subject_train[[1]]);

#5 created a seperate tidy data to record mean of each variable for activity and subject
tidyData<-ddply(filteredData, .(activity.label, subject), function(x){colMeans(x[,2:80])});

write.table(tidyData, 'tidyData.txt', row.names = FALSE);