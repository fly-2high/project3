# get the file url
today = as.Date(Sys.time())
Samsungurl = paste('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', sep='')
# create a temporary directory
td = tempdir()
# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")
# download into the placeholder file
download.file(Samsungurl, tf)

# get the path of Train file
# get the name of train file in the zip archive
trainame = unzip(tf\train, list=TRUE)$Name[X_train.txt]
# unzip the Train file to the temporary directory
unzip(tf, files=trainame, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
trainpath = file.path(td, trainame)

# get the path of Test file
# get the name of Test file in the zip archive
testname = unzip(tf, list=TRUE)$Name[X_test.txt]
# unzip the Test file to the temporary directory
unzip(tf, files=testname, exdir=td, overwrite=TRUE)
# fpath is the full path to the extracted file
testpath = file.path(td, testname)


# Read Train data file
traindata<-read.table(trainpath,sep=" ",header=TRUE)
#  Read Test data file
testdata<-read.table(testpath,sep=" ",header=TRUE)

# Merge Train & Test data sets
MD=merge(traindata,testdata,all=True)

# Calculate the mean of each column
MDMean=sapply(MD,mean)

# Export the MDMean data set to MergeData.txt file in main directory  
write.table( MDMean , " MergeData.txt" , sep="\t")
