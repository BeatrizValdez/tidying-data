# tidying-data
Different steps to tidy a dataset

## Content of run_analysis. R

In this script you will find small script chunks to:

        
1. set directory: set the directory to where the files are
2. load data: loads the different files
3. explore data: to understand the dimensions of the uploaded files
4. join datasets:
-  activity levels, and
-  give descriptive names to the activity levels
-  join subjets
-  join subjects and activities
-  join datasets
-  name the dataset
-  join the above dataset with subject and activity levels
-  select variables: to obtain only those measures related to mean and standard deviation, using grep() and subsetting the dataset
- remove some characters such as () and '-' to avoid problems when grouping and summarizing variables
- load and use packages dplyr, tidyr and magrittr to group and summarize the dataset and creating a new one
- write a tidy dataset called 'tidyData'

