#!/bin/bash -
#
# task 1 - The top 3 days containing the highest count of job executions reporting zero errors, across all data centers.
#
# requires 'Sample csv.csv'
#
# author: dudley burrows
#

csv="Sample csv.csv"

# csv file provided in dos format (CRLF line terminators)
# change to unix format for ease
if file "$csv" | grep CRLF >/dev/null ; then
	tr -d '\r' < "$csv" > sample.csv
	csv=sample.csv
fi

printf "task 1: the top 3 days with zero errors are:\n"
awk -F, '{print $3" "$1}' $csv | sort | egrep ^0 | uniq -c | sort -nr | head -n3 | awk '{print $3" with "$1" days"}'