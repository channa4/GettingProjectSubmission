---
title: "README"
author: "Chris"
date: "August 15, 2016"
output: html_document
---

There is a single script that does all of the uploading and processing of the data.

#### General flow of the script is as follows:

1. Change to working directory with the files for the analyis

2. Load and combine the training and test sets

3. Load the features information and assign those as the column names for the combined set

4. Filter the combined data set into a variable to hold only the mean and standard deviation data columns

5. Load the activity labels table to be used to reference against the training labels

6. Load and combine the training and test labels 

7. Generate row names related to the activity based on the combined training/test labels

8. Modify the row labels so that they are unique

9. Create the new tidy data set based on the project requirements

10. Label the rows and columns

11. Export the two tidy data sets
    a. tidyset1.txt is the first cleaned data set required by the project
    b. tidyset2.txt is the second cleaned data set required by the project

