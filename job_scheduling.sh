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

date=$(date +%Y%m%d)
time=$(date +%H%M%S)
log_file="/var/log/do_something_"$date"_"$time".log"
email="root@localhost"