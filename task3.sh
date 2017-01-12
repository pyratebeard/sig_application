#!/bin/bash -
#
# task 3 - For each data center, report the day where the total error count was the highest (also report total error count).
#
# requires 'sample.csv'
#
# author: dudley burrows
#

csv="sample.csv"

if [ ! -f $csv ] ; then
	printf "please run task1.sh first\n"
else
	dcs=$(cat $csv | awk -F, '{print $2}' | cut -f2 -d"_")
	days=$(cat $csv | awk -F, '{print $1}' | sort | uniq)
	highest_day=""
	for datacentre in $(printf "$dcs\n" | sort | uniq) ; do
		total=$(grep $datacentre $csv | awk -F, '{x+=$3;}END{print x}')
		day_total=""
		for day in $days; do
			daily_total=$(grep -e "$day.*$datacentre" $csv | awk -F, '{x+=$3;}END{print x}')
			if [[ "$daily_total" -gt "$day_total" || "$daily_total" == "$day_total" ]] ; then
				day_total=$daily_total
				highest_day=$day
			fi
		done
		printf "=== %s ===\n\
highest error count:\t%s on %s\n\
total error count:\t\t%s\n" $datacentre $day_total $highest_day $total
	done
fi
