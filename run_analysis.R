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
    
    #################### RENAME VARIABLES
    #################### colnames(extractData)
    ####################
    
    #extractData[extractData$activity == "WALKING"]
    tidyData = data.frame()
    aves = numeric()
    for (i in 1:30) { ##### 30
        for (j in 1:6) { ##### 6
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