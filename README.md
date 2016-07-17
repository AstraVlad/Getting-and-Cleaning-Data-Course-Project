# Getting-and-Cleaning-Data-Course-Project
Course project script

You can find project script in "run_analysis.R" file. 

It is made as a single function you can run by sourcing file into R-Studio and calling run_analyis().

Script logic assumes that you have all data in the "UCI HAR Dataset" subdirectory of your R working directory. It automatically loads all necessary data, performs all permutations and writes output data into the working directory. It also returns a resulting dataset so you can call it as "output <- run_analyis()" and get a resulting dataset without need to manually load it from file.

I have to note, that loading output file into R by "new_output <- read.table("output.txt", header = TRUE)" command at my system produses strange results omitting "()" parts of variable names ("tBodyAcc-mean()-X" transfoms to "tBodyAcc.mean...X") while import to Excel works as intended and in the file itself all variable names are presented in the original form. I was not able to do anything with this.
