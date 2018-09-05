#!/bin/bash

# Bash PHP Unit Task Runner
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
local_command="phpunit.phar"
vendor_command="phpunit"
global_command="phpunit"

# Print a welcome and locate the exec for this tool
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/helpers/colors.sh
source $DIR/helpers/formatters.sh
source $DIR/helpers/welcome.sh
source $DIR/helpers/locate.sh

# Run the command
echo -e "${txtgrn}  $exec_command${txtrst}"

command_result=`eval $exec_command`

if [ $? -ne 0 ]; then
    echo -en "${txtred}Errors detected by PHPUnit${txtrst}\n"
    echo "$command_result"
    exit 1
fi
exit 0