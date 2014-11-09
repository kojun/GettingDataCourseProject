library(dplyr)
library(tidyr)

#
# We are only intereted in measurements on the mean and standard deviation,
# so we first extract feature labels containing either "mean" or "std".
#
featureLabels <- read.table("features.txt", stringsAsFactors=FALSE)[[2]]
featureIndexesOnInterest <- grep("[Mm]ean|std", featureLabels)
featureLabelsOnInterest <- grep("[Mm]ean|std", featureLabels, value=TRUE)

#
# We then modify extracted feature names so that they only contain
# alphanumeric characters.
# This may not be necessary but I prefer not using special characters
# for column names...
#
featureLabelsOnInterest <- gsub("[^a-zA-Z0-9]", "", featureLabelsOnInterest)
featureLabelsOnInterest <- gsub("std", "Std", featureLabelsOnInterest)
featureLabelsOnInterest <- gsub("mean", "Mean", featureLabelsOnInterest)

#
# Read the training and test feature data, selecting only columns we are
# intereted in.
#
features <- rbind(
  read.table("train/X_train.txt")[,featureIndexesOnInterest],
  read.table("test/X_test.txt")[,featureIndexesOnInterest])
names(features) <- featureLabelsOnInterest

#
# Read the training and test activity data and convert them to
# descriptive names as defined in activity_labels.txt.
#
activities <- rbind(
  read.table("train/y_train.txt"),
  read.table("test/y_test.txt"))
activityLabels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)[[2]]
activities[[1]] <- activityLabels[activities[,1]]
names(activities) <- c("activityLabel")

#
# Read the training and test subject data
#
subjects <- rbind(
  read.table("train/subject_train.txt"),
  read.table("test/subject_test.txt"))
names(subjects) <- c("subjectId")

#
# We then combine those three data sets (they all 
# have same row size) to create final features object
# which is ready to be analyzed later on. 
# We already have labeled each data set in the
# previous steps, so at this point we have successfully
# completed step 1 thru 4 of the course project.
#
features <- cbind(activities, subjects, features)

#
# Now let's move on to step 5 of our course project.
# We apply 'group_by' and 'summarise_each' function from dplyr package,
# and then modify column names to make it easy to understand that
# these columns have been applied 'mean' function.
#
featuresSummary <- features %>%
  group_by(activityLabel, subjectId) %>%
  summarise_each(funs(mean))
names(featuresSummary)[3:length(featuresSummary)] <-
  paste0("mean(", names(featuresSummary)[3:length(featuresSummary)], ")")

write.table(featuresSummary, file="features_summary_data.txt", row.name=FALSE)

#
# Just for fun, we can create the 'tall' version of the summary data.
# by applying 'gather' function from tidyr package.
#
featuresSummaryTall <- featuresSummary %>%
  gather(feature, value, -(activityLabel:subjectId))
