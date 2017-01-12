#!/bin/bash -
#
# task 4 - Use the contents of the `sample.csv` file to create a folder structure in the current directory with the follwing format: `./<date>/<dc>/<job>/count[<error_count>]`, where the first three levels are folders and the last one is an empty file (i.e.:  `20160801,JOBD_MIL,80` should generate `./20160801/MIL/JOBD/count[80]`)
#
# requires 'sample.csv'
#
# author: dudley burrows
#

csv="sample.csv"

if [ ! -f $csv ] ; then
	printf "please run task1.sh first\n"
else
	IFS=","
	printf "task 4: create folder structure\n"
	while read day job_dc error_count ; do
		job=$(echo $job_dc | cut -f1 -d"_")
		datacentre=$(echo $job_dc | cut -f2 -d"_")
		mkdir -p $day/$datacentre/$job
		filename=$day/$datacentre/$job/count[$error_count]
		touch $filename
	done < $csv
fi