Given that the R working directory contains an unpacked copy of the original data, the script will

1- extract the  original column headers names
2- determine the index's value of the desired -mean() and -std() columns
3- extract the subject and activity identifiers for the measurements
4- extract the desired values from the original data
5- then merge the  identifier columns on to the values
6- combine the values for a given activity and subject
7- replace English descriptions for activity identifiers
8- write the tidy data to a file of comma-separated values
