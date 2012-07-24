#!/bin/bash

source ../boilerplate.sh

rm -f test_log_file

# Write to stdout and log file.
DEBUG_LOG_FILE="test_log_file"
DEBUG_SHELL="Yes"
decho "Screen and file."

# Write to stdout only.
DEBUG_LOG_FILE=""
DEBUG_SHELL="1"
decho "Screen only."

# Write to log file only.
DEBUG_LOG_FILE="test_log_file"
DEBUG_SHELL="Off"
decho "File only."

# Write nothing
DEBUG_LOG_FILE=""
DEBUG_SHELL="0"
decho "You should never see this line."

