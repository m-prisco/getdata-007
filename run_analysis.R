run_analysis = function() {

    # data structure
    # subject | activity | tBodyAcc-mean()-X | ... | angle(Z,gravityMean)
    # 7352 train set records
    # 2947 test set records

    headerX = read.table("UCI HAR Dataset/features.txt", colClasses = c("numeric", "character"))
    headerX = headerX$V2
    headerSet = c("subject", "activity", headerX)
    
    ############## train set ##############
    subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt",
                             header = FALSE,
                             col.names = "subject")
    
    activityTrain = read.table("UCI HAR Dataset/train/y_train.txt",
                          header = FALSE,
                          col.names = "activity")
    
    dataTrain = read.table("UCI HAR Dataset/train/X_train.txt",
                          header = FALSE,
                          sep = "",
                          col.names = headerX)
    
    trainSet = data.frame(subjectTrain, activityTrain, dataTrain)
    
    ############## test set ##############
    subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt",
                              header = FALSE,
                              col.names = "subject")
    
    activityTest = read.table("UCI HAR Dataset/test/y_test.txt",
                               header = FALSE,
                               col.names = "activity")
    
    dataTest = read.table("UCI HAR Dataset/test/X_test.txt",
                           header = FALSE,
                           sep = "",
                           col.names = headerX)
    
    testSet = data.frame(subjectTest, activityTest, dataTest)
    
    ############## complete set ##############
    dataSet = rbind(trainSet, testSet)
    
    # extract columns with mean() and std()
    extCols = numeric()
    for (n in 0:4) {
        for (i in 1:6) {
            extCols = c(extCols, 40*n+i)
        }
    }
    for (n in 0:4) {
        for (i in 1:2) {
            extCols = c(extCols, 200+13*n+i)
        }
    }
    for (n in 0:2) {
        for (i in 1:6) {
            extCols = c(extCols, 265+79*n+i)
        }
    }
    for (n in 0:3) {
        for (i in 1:2) {
            extCols = c(extCols, 502+13*n+i)
        }
    }
    # add "subject" and "activity" columns
    extCols = extCols + 2
    extCols = c(1, 2, extCols)
    
    extractData = dataSet[, extCols]
    
    # use descriptive activity names to name the activities in the data set
    activNames = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                 "SITTING", "STANDING", "LAYING")
    for (i in 1:6) {
        extractData$activity[extractData$activity == i] = activNames[i]
    }
    
    headerNames = c("subject", "activity")
    
    headerNames = c(headerNames, "time body accelerometer x mean", 
                    "time body accelerometer y mean",
                    "time body accelerometer z mean")
    headerNames = c(headerNames, "time body accelerometer x standard deviation", 
                    "time body accelerometer y standard deviation",
                    "time body accelerometer z standard deviation")
    headerNames = c(headerNames, "time gravity accelerometer x mean",
                    "time gravity accelerometer y mean",
                    "time gravity accelerometer z mean")
    headerNames = c(headerNames, "time gravity accelerometer x standard deviation",
                    "time gravity accelerometer y standard deviation",
                    "time gravity accelerometer z standard deviation")
    headerNames = c(headerNames, "time body accelerometer jerk x mean",
                    "time body accelerometer jerk y mean",
                    "time body accelerometer jerk z mean")
    headerNames = c(headerNames, "time body accelerometer jerk x standard deviation",
                    "time body accelerometer jerk y standard deviation",
                    "time body accelerometer jerk z standard deviation")
    headerNames = c(headerNames, "time body gyroscope x mean",
                    "time body gyroscope y mean",
                    "time body gyroscope z mean")
    headerNames = c(headerNames, "time body gyroscope x standard deviation",
                    "time body gyroscope y standard deviation",
                    "time body gyroscope z standard deviation")
    headerNames = c(headerNames, "time body gyroscope jerk x mean",
                    "time body gyroscope jerk y mean",
                    "time body gyroscope jerk z mean")
    headerNames = c(headerNames, "time body gyroscope jerk x standard deviation",
                    "time body gyroscope jerk y standard deviation",
                    "time body gyroscope jerk z standard deviation")
    headerNames = c(headerNames, "time body accelerometer magnitude mean",
                    "time body accelerometer magnitude standard deviation",
                    "time gravity accelerometer magnitude mean",
                    "time gravity accelerometer magnitude standard deviation",
                    "time body accelerometer jerk  magnitude mean",
                    "time body accelerometer jerk  magnitude standard deviation")
    headerNames = c(headerNames, "time body gyroscope magnitude mean",
                    "time body gyroscope magnitude standard deviation",
                    "time body gyroscope jerk  magnitude mean",
                    "time body gyroscope jerk  magnitude standard deviation")
    headerNames = c(headerNames, "frequency body accelerometer x mean",
                    "frequency body accelerometer y mean",
                    "frequency body accelerometer z mean")
    headerNames = c(headerNames, "frequency body accelerometer x standard deviation",
                    "frequency body accelerometer y standard deviation",
                    "frequency body accelerometer z standard deviation")
    headerNames = c(headerNames, "frequency body accelerometer jerk x mean",
                    "frequency body accelerometer jerk y mean",
                    "frequency body accelerometer jerk z mean")
    headerNames = c(headerNames, "frequency body accelerometer jerk x standard deviation",
                    "frequency body accelerometer jerk y standard deviation",
                    "frequency body accelerometer jerk z standard deviation")
    headerNames = c(headerNames, "frequency body gyroscope x mean",
                    "frequency body gyroscope y mean",
                    "frequency body gyroscope z mean")
    headerNames = c(headerNames, "frequency body gyroscope x standard deviation",
                    "frequency body gyroscope y standard deviation",
                    "frequency body gyroscope z standard deviation")
    headerNames = c(headerNames, "frequency body accelerometer magnitude mean",
                    "frequency body accelerometer magnitude standard deviation",
                    "frequency bodybody accelerometer jerk magnitude mean",
                    "frequency bodybody accelerometer jerk magnitude standard deviation")
    headerNames = c(headerNames, "frequency bodybody gyroscope magnitude mean",
                    "frequency bodybody gyroscope magnitude standard deviation",
                    "frequency bodybody gyroscope jerk magnitude mean",
                    "frequency bodybody gyroscope jerk magnitude standard deviation")
    colnames(extractData) = headerNames
    
    #extractData[extractData$activity == "WALKING"]
    tidyData = data.frame()
    aves = numeric()
    for (i in 1:30) {
        for (j in 1:6) {
            newRecord = data.frame(i, activNames[j])
            for (n in 3:ncol(extractData)) {
                aves = mean(extractData[,n]
                     [extractData$activity==activNames[j] & extractData$subject==i])
                newRecord = data.frame(newRecord, aves)
            }
            tidyData = rbind(tidyData, newRecord)
        }
    }
    colnames(tidyData) = colnames(extractData)
    
    write.table(tidyData, file = "tidyData.txt", row.names=FALSE)
        
}