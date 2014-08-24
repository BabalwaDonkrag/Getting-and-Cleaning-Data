
X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X_Dat <- rbind(X_train, X_test)
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
S_Dat <- rbind(subject_train, subject_test)
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
Y_Dat <- rbind(y_train, y_test)
features <- read.table("features.txt")
MeanStd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_Dat <- X_Dat[, MeanStd]
names(X_Dat) <- features[MeanStd, 2]
names(X_Dat) <- gsub("\\(|\\)", "", names(X_Dat))
names(X_Dat) <- tolower(names(X_Dat))  
act_labels <- read.table("activity_labels.txt")
act_labels[, 2] = gsub("_", "", tolower(as.character(act_labels[, 2])))
Y_Dat[,1] = act_labels[Y_Dat[,1], 2]
names(Y_Dat) <- "Activity_Des"
names(S_Dat) <- "Subject_id"
cleaned <- cbind(S_Dat, Y_Dat, X_Dat)
write.table(cleaned, "Tidy Data Labels.txt")
uniqueSubjects = unique(S_Dat)[,1]
numSubjects = length(unique(S_Dat)[,1])
numActivities = length(act_labels[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = act_labels[a, 2]
        tmp <- cleaned[cleaned$Subject_id==s & cleaned$Activity_Des==act_labels[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "Tidy Data Averages.txt",row.name=FALSE)