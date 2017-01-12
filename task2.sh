#!/bin/bash -
#
# task 2 - For each data center, report the total count of job executions where the error count was non zero, across all days.
#
# requires 'sample.csv'
#
# author: dudley burrows
#

csv="sample.csv"

if [ ! -f $csv ] ; then
	printf "please run task1.sh first\n"
else
	printf "task 2: total non zero executions in each data centre are:\n"
	awk -F, '{print $2" "$3}' $csv | egrep -v "\ 0$" | cut -f 2 -d "_" | awk '{print $1}' | sort | uniq -c | awk '{print $2" with "$1" executions"}'
fi