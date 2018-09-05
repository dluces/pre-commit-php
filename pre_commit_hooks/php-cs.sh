#!/bin/bash

# Bash PHP Codesniffer Hook
# This script fails if the PHP Codesniffer output has the word "ERROR" in it.
# Does not support failing on WARNING AND ERROR at the same time.
#
# Exit 0 if no errors found
# Exit 1 if errors were found
#
# Requires
# - php
#
# Arguments
# - None

# Possible command names of this tool
local_command="phpcs.phar"
vendor_command="phpcs"
global_command="phpcs"

# Print a welcome and locate the exec for this tool
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/helpers/colors.sh
source $DIR/helpers/formatters.sh
source $DIR/helpers/welcome.sh
source $DIR/helpers/locate.sh

files="${@:2}"
args=$1
# Without this escape field, the parameters would break if there was a comma in it
full_command="$exec_command $args $files"

# Run the command
echo -e "${txtgrn}  $full_command${txtrst}"

command_result=`eval $full_command`

if [ $? -ne 0 ]; then
    echo -en "${txtred}Errors detected by PHP CodeSniffer${txtrst}\n"
    echo "$command_result"
    exit 1
fi

exit 0