#!/bin/bash
#
# wrapper script for running /usr/bin/do_something via cron
#
# program is run:
#	mon-fri, every 15 minutes
#	saturdays, once at noon
#
# author: dudley burrows
#
source $HOME/.bash_profile
date=$(date +%Y%m%d)
time=$(date +%H%M%S)
log_file="/var/log/do_something_"$date"_"$time".log"

if [[ -z $(pgrep do_something) ]]; then
	/usr/bin/do_something > $log_file 2>&1 || mail -s "do_something error" root@localhost < $log_file
else
	exit 1
fi