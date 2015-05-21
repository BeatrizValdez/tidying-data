####### loading data
# setting directory
setwd('~tidyingDataProject')

#loading data



#reading training set
X_train <- read.table('./train/X_train.txt')

# reading training label
Y_train <- read.table('./train/Y_train.txt')

# reading subject train
subject_train <-read.table('./train/subject_train.txt')

# reading test data
X_test <- read.table('./test/X_test.txt')

# reading test label
Y_test <- read.table('./test/Y_test.txt')

# reading subject test
subject_test <-read.table('./test/subject_test.txt')

# reading activity labels
activity_labels <-read.table('./activity_labels.txt')

# reading features names
features <- read.table('./features.txt')
features[,2]<-tolower(features[,2])

# exploring data

dim(X_train); dim(Y_traing)
dim(X_test); dim(Y_test)

# joining datasets
# 1) joining  activity levels
y <-rbind(y_train, y_test)

# giving descriptive names to this vector

y[y==1] <-'WALKING'
y[y==2] <-'WALKING_UPSTAIR'
y[y==3] <-'WALKING_DOWNSTAIRS'
y[y==4] <-'SITTING'
y[y==5] <-'STANDING'
y[y==6] <-'LAYING'
table(y)

# joining subjets
subject <- rbind(subject_train, subject_test)

# joining subjects and activities
actLabels <-cbind(subject, y)
names(actLabels) <-c('subject','activity')
                        

# joining datasets
data <- rbind(X_train, X_test)

#naming data
names(data)<-features[,2]

# joining actLabels and data
dataset <-cbind(actLabels, data)

#selecting variables
subSet<-grep('mean|std', names(dataset), perl=TRUE)
dataRequired <- dataset[,subSet]


#  creating a second, independent tidy data set with the average of each variable for each activity and each subject

# fixing some names

# to avoid some problems with expressions as mean()
# in the variable, I fix it

#removing parantheses
names(dataRequired) <-gsub('\\(\\)', '', 
                           names(dataRequired))
# changing '-' into '_'
names(dataRequired) <-gsub('-', '_', 
                           names(dataRequired))

#Loading needed packages
require(dplyr)
require(tidyr)
require(magrittr)

# adding subject  and activities to a new dataset
tidyData <- cbind(dataset[, 1:2], dataRequired)

# converting 'activity' and 'subject' into factors
tidyData[,1]<-as.factor(tidyData[,1])
tidyData[,2]<-as.factor(tidyData[,2])

# grouping by 'subject' and 'activity' and sumarizing 
# each column by mean
tidyData %<>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))


#saving this dataset in 
write.table(tidyData, 'tidyData.txt', row.names=FALSE)




