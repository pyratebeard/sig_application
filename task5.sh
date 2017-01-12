#!/bin/bash -
#
# task 5 - Traverse the structure generated in the previous step and rename the files with `dc = MIL` and `error_count < 10` from `count[<error_count>]` to `low[<error_count>]` (i.e.:  `./20160801/MIL/JOBD/count[5]` should become `./20160801/MIL/JOBD/low[5]`)
#
# author: dudley burrows
#

printf "task 5: rename filenames for low errors in MIL\n"
find ./*/MIL/ -type f -iname "count\[[0-9]\]" -exec sh -c 'mv "$0" "$(echo "$0" | sed 's/count/low/g')"' {} \;