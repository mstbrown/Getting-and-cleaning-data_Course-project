Getting-and-cleaning-data_Course-project
========================================
A script for producing a tidy dataset that has 180 rows and 
68 columns. The 180 rows represent smartphone data collected
from 30 subjects while they wore the smartphones and performed
6 activities; walking, walking_upstairs, walking_downstairs, 
sitting, standing, and laying.


The dataset includes the following files:
========================================

- 'README.md'

- 'run_analysis.R': A script that performs the transformations from 
  the original database to the tidy dataset. There are extensive
  comments within the script. The following files must be moved
  to the working directory: X_test.txt X_train.txt y_test.txt 
  y_train.txt subject_test.txt subject_train.txt

- 'CodeBook.md': describes the variables, data, and transformations 
  that I performed to clean up the data. The units of the data are 
  listed in the CodeBook.


Notes: 
========================================
- the output of the 'run_analysis.R' script is a tidy dataset with 
  the average of each variable for each activity and each subject.

-the original database is:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
