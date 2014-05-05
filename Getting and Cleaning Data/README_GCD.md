Given that the R working directory contains an unpacked copy of the original data, the script will

* extract the  original column headers names
* determine the index's value of the desired -mean() and -std() columns
* extract the subject and activity identifiers for the measurements
* extract the desired values from the original data
* then merge the  identifier columns on to the values
* combine the values for a given activity and subject
* replace English descriptions for activity identifiers
* write the tidy data to a file of comma-separated values
