---
title: Homework Assignment - Scripting
number-sections: yes
...

# Shell Scripting

The attached `sample.csv` file contains lines of the following format:

```
date,job_dc,error_count
```

Where:

- `job_dc` is an id corresponding to the execution of a `job` on a particular data center `dc`.
- `error_count` is the aggregate number of errors extracted from the job log in a given `date`.
- `date` is the date the job ran in format `YYYYMMDD`.


Tasks
-----

Using _only_ command-line tools found in the Linux environment, provide answers to the following:

- The top 3 days containing the highest count of job executions reporting zero errors, across all data centers.
- For each data center, report the total count of job executions where the error count was non zero, across all days.
- For each data center, report the day where the total error count was the highest (also report total error count).
- Use the contents of the `sample.csv` file to create a folder structure in the current directory with the follwing format: `./<date>/<dc>/<job>/count[<error_count>]`, where the first three levels are folders and the last one is an empty file (i.e.:  `20160801,JOBD_MIL,80` should generate `./20160801/MIL/JOBD/count[80]`)
- Traverse the structure generated in the previous step and rename the files with `dc = MIL` and `error_count < 10` from `count[<error_count>]` to `low[<error_count>]` (i.e.:  `./20160801/MIL/JOBD/count[5]` should become `./20160801/MIL/JOBD/low[5]`)

Rules
-----

- Scripts are allowed but only in `bash`, and using text processing tools available from the shell like `sed`, `awk`, `grep`.
- Avoid implementing a solution to parse the files in another programming language such as `python`, `perl` or `java`.

# Job Scheduling

You are tasked with scheduling the periodic execution of a program under your Linux account. The program:

```
/usr/bin/do_something
```

Needs to run according to the following schedule:

- Mon-Fri, every 15 minutes.
- Saturdays, once at noon.

Tasks
-----

1. Write a wrapper shell (bash) script for the above program with the following characteristics:

- The wrapper script can be scheduled via `cron` and executes the program with the same environment variables as the logged in user.
- The wrapper script saves both `stdout` and `stderr` script outputs to a log file under:
```
/var/log/do_something_YYYYMMDD_HHMMSS.log
```
Where `YYYYMMDD` is the date and `HHMMSS` the time the script started.

- The wrapper script sends an email with the log file in the email body to the root user if `do_something` completes with a non-zero return code.

2. Give the crontab entries that satisfy the above schedule. You can assume your wrapper script is deployed under `/usr/bin`.

3. Bonus points:

- Extend your wrapper script such that only a single instance of the script is allowed to run at any point. For example, if the previous instance of the script ran for over 15 minutes, the next scheduled run should be skipped. Assume the script runs from a single host.
