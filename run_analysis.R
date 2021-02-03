#library(downloader)
#library(dplyr)


#Directory prep and data download
#Check if the directory exists, if not, create it. set working directory
if(!file.exists("./assignmentdata")) {
        dir.create("./assignmentdata")
}
#Set the URL from which to download* the zipped data folder, download, unzip
#*This code does use the downloader package, but the installation and calling of it are included**
#**It also is coded to detach itself
dataURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#install.packages("downloader")
download(dataURL, dest="./assignmentdata/dataset.zip", mode="wb") 
setwd("./assignmentdata")
#Unzip the newly downloaded file in the created working directory for this assignment
unzip ("./dataset.zip")
#Set working directory to the unzipped folder to be ready to go
setwd("./UCI HAR Dataset")


        
#Find indices of measures that are just mean and standard deviation
                #NUMBER TWO OF THE ASSIGNMENT
{
meanindices<-grep("[m][e][a][n][(][)]", readLines("features.txt"))
stdindices<-grep("[s][t][d]", readLines("features.txt"))
measureindices<-sort(c(meanindices, stdindices))
rm(meanindices) ; rm(stdindices)
#These are needed to only extract the necessary data from x_train and x_test
#This does mean that steps 1 and 2 of the assignment are technically done backwards
}

#set the labels for the measures pulled from x_train and x_test
measuretitles<-c(readLines("features.txt")[measureindices])

#prep the activity labels factor, it will be needed shortly
activitylabels<-c(read.table("activity_labels.txt")[,2])

#build TRAIN data frame of necessary data
                #NUMBER THREE INCLUDED HERE
{
#Start with read x_train and assigning it the proper column titles
traindata1<-as.data.frame(read.table("train/x_train.txt")[measureindices])
colnames(traindata1)<-measuretitles
#Read the activities performed file and assign it to a variable as a factor
Activity<-factor(readLines("train/y_train.txt"))
#Label the activities according to the activity labels file
levels(Activity)<-activitylabels
#Turn this into a one column data frame
traindata2<-as.data.frame(Activity)
#Merge the measures data onto the activity data frame and remove old data frames
traindata<-cbind(traindata2, traindata1)
rm(traindata1);rm(traindata2)
#do the same for the subject ID
subjectID<-factor(readLines("train/subject_train.txt"))
traindata3<-as.data.frame(subjectID)
#add a column to define data type as train
traindata3$DataType<-c(rep("train"))
#rebind
traindata<-cbind(traindata3, traindata)
rm(traindata3)
#Now you have a final traindata data frame
}

#Build TEST data frame of necessary data
                #NUMBER THREE INCLUDED HERE
{
#Start with read x_test and assigning it the proper column titles
testdata1<-as.data.frame(read.table("test/x_test.txt")[measureindices])
colnames(testdata1)<-measuretitles
#Read the activities performed file and assign it to a variable as a factor
Activity<-factor(readLines("test/y_test.txt"))
#Turn this into a one column data frame
levels(Activity)<-activitylabels
#Turn this into a one column data frame
testdata2<-as.data.frame(Activity)
#Merge the measures data onto the activity data frame and remove old data frames
testdata<-cbind(testdata2, testdata1)
rm(testdata1);rm(testdata2)
#do the same for the subject ID
subjectID<-factor(readLines("test/subject_test.txt"))
testdata3<-as.data.frame(subjectID)
#Add a column to define data type as test
testdata3$DataType<-c(rep("test"))
#rebind
testdata<-cbind(testdata3, testdata)
rm(testdata3)
#Now you have a final testdata data frame
}

#merge data frames into long format
                #NUMBER ONE FOR THE ASSIGNMENT IS HERE
{
if ((all(c(colnames(testdata)) == c(colnames(traindata)))) == TRUE) {
        alldata<-rbind(traindata, testdata)
}
rm(testdata);rm(traindata)
}

#Descriptive Variable names
#Need to change the variable names of all columns other than the first 3
#subjectID, Activity, and DataType are the correct descriptive labels
                #NUMBER FOUR OF THE ASSIGNMENT IS HERE
{
splittitles<-strsplit(measuretitles, split = " ")
secondelem<-function(x){x[2]}
firstelem<-function(x){x[1]}
splittitles<-sapply(splittitles, secondelem)
#Alter the column names to be more descriptive

newtitles<-splittitles %>% 
        gsub("Body", " Body",.) %>% 
        gsub("Acc", " Accelerometer",.) %>% 
        gsub("Gravity", " Gravity",.) %>% 
        gsub("Jerk", " Jerking motion",.) %>% 
        gsub("Mag", " Magnitude",.) %>% 
        gsub("Gyro", " Gyroscope",.) %>% 
        gsub("\\()", "",.) %>% 
        gsub("std", " standard deviation",.) %>% 
        gsub("mean", " mean",.) %>%
        gsub("X", " X direction",.) %>% 
        gsub("Y", " Y direction",.) %>% 
        gsub("Z", " Z direction",.) %>% 
        gsub("^f", "f:",.) %>% 
        gsub("^t", "t:",.) %>% 
        sub("\\-", "\\:",.) %>%
        sub("\\-", "\\ -",.) 
oldtitles<-colnames(alldata)[1:3]
finaltitles<-c(oldtitles, newtitles)
colnames(alldata)<-finaltitles
alldata$subjectID<-as.character(alldata$subjectID)
}
#Now the measure titles have the number removed, and describe the measure
#and, where applicable, the direction

#Sort the alldata dataframe so that the final data output is already in a nicely sorted format
alldata$subjectID<-as.integer(alldata$subjectID)
alldata<-alldata[order(alldata$subjectID),]
alldata$subjectID<-as.character(alldata$subjectID)

#Second data set with summary data per subject per measure
                #NUMBER FIVE IS GENERATED HERE
Finaldata<-data.frame()
for (i in unique(alldata$subjectID)) {
        subject<-as.data.frame(split(alldata, alldata$subjectID)[i])
        colnames(subject)<-finaltitles
        subject<-select(subject, -subjectID)
        ID<-rep(i,6)
        Exportdata<-data.frame()
        for (j in 1:6) {
                tempdat<-as.data.frame(split(subject, subject$Activity)[j])
                colnames(tempdat)<-finaltitles[2:69]
                DT<-select(tempdat, DataType)
                DT<-DT[1:6,]
                tempdat<-select(tempdat, -DataType, -Activity)
                meandat<-data.frame()
                meandat<-rbind(meandat, as.data.frame(summarize_all(tempdat, mean)))
                datinfo<-cbind(ID, DT)
                datinfo<-cbind(datinfo, activitylabels)
                Exportdata<-cbind(datinfo, meandat)
        }
Finaldata<-rbind(Finaldata, Exportdata)
}
rm(subject) ; rm(meandat); rm(tempdat); rm(datinfo); rm(Exportdata)
colnames(Finaldata)<-finaltitles
Meanofoldtitles <- paste("Mean of", newtitles, sep = "_")
Meanoffinaltitles <- c(oldtitles, Meanofoldtitles)
colnames(Finaldata)<-Meanoffinaltitles

#This saves the Finaldata dataframe as a .txt file
write.table(Finaldata, file = "./Finaldata.txt", row.names = FALSE)