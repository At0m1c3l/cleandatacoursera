---
title: "README"
author: "Alexander Yang"
date: "7/18/2020"
output: html_document
---

## README: Information on Analysis Script 

### Introduction 

This markdown file contains information on each part of the analysis script "runanalysis.R", and how each part connects to effectively clean the raw dataset. 

### PRE-STEP 

Lines 4-11 of the script read files from the "UCI HAR Dataset" into R as data frames. Additionally, in the reading process, column names are added to their respective files. This is essential preparation for the main script. 

### STEP 1: Merging

To merge the data frames effectively, rbind and cbind are used. rbind() is used for combining the X Test / X Train, Y Test / Y Train, and Subject Train / Subject Test data frames, since the test and train sets for their respective variables (X, Y or subject) have the same class of measurements in them. When combining all of these sets together, however, cbind() must be used since each combined set doesn't have the same class of measurements. 

Combining the datasets early will make the process of extracting data / renaming it far simpler, which is why this is the first step. 
 
#### Why aren't you using merge()? 

merge() is unnecessary. The main goal of Step 1 is to combine all of the data into one large data frame, so combining columns doesn't make sense at this point.

### STEP 2: Extracting Deviation / Mean Measurements

To extract mean and standard deviation measurements, grep() is used to find column names that contain "mean" or "std" (the abbreviation for standard deviation). These names areplaced in a character vector, to be used in a moment. An issue is encountered for means where grep will also extract column names with "meanfreq" from the dataframes. Therefore, an additional line of code is used to remove them. 

The character vectors are then used to create separate dataframes containing the columns equivalent to names in the character vetors. These dataframes are merged to complete Step 2. 

Two final lines of code are also present in Step 2 - these manually add the Subject ID and Activity columns to the data frame, which were removed in the extraction process. 

This step extracts only the data we're interested in for the final dataset, which will ultimately be useful, as the extraction significantly reduces the size of the dataframe. 

### STEP 3: Renaming Variables in Activity Column 

A single line of code is used to rename variables in the Activity column of the data frame appropriately. This code replaces all variables with the variables from column 2 of the activities data frame. 

This step cleans the Activity column for the final dataset, which ensures viewers can easily determine which activity was performed during measurements for each row. 

### STEP 4: Renaming Column Names 

In Step 4, two manual renamings are conducted, with the remaining renamings conducted using gsub(). The manual renamings are used to rename the Activity and Subject ID columns, which had previous names that were disorganized due to manually adding them in Step 2. The gsub() renamings automatically replace poorly abbreviated elements of column names. For instance, Gryo is replaced by Gyroscope. 

This step improves the legibility of the final dataset for viewers. 

### STEP 5: Second (Final) Dataset

In Step 5, the aggregate() command is used to take the means of data for every activity / subject, and to import those means into the final data frame. The two identifying columns are specifically removed from this process and imported in their current state. Finally, the write.table() command downloads the final dataset as a file that can be pushed to the project repository. 

This step summarizes the data as requested by the assignment. 









