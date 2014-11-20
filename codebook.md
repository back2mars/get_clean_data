VARIABLES:
x_train, y_train, subject_train: table from "./train/X(/y/subject)_train.txt"
x_test, y_test, subject_test: table from "./test/X(/y/subject)_test.txt"
x_set, y_set and subject_set: merged table from x(/y/subject)_train and x(/y/subjct)_test 
features: correct names for x_set, from "./features.txt"
activities: correct name for y_set, from "./activity_labels.txt"
mean_std: names containing mean() or std() from features 
data_set: merged data from x(/y/subject) set
data_average: desired averages of each variable of each activity and each subject 

TRANSFORMATIONS:
rbind() function is used to merge data from x(/y/subject)_train and x(/y/subject)_test to x(/y/subject)_set
grep() function is used to extract all names containing mean() or std() from names in features variable
cbind() function is used to merge x(/y/subject) data with corrected names into a new dataset called data_set
ddply() function is used to extract the averages of desired variables
write.table() function is used to write the output
