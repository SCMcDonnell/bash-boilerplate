#!/bin/bash

source ../boilerplate.sh

rm test_log_file

# Write to stdout and log file.
DEBUG_LOG_FILE="test_log_file"
DEBUG_SHELL="Yes"
decho -n "Screen and "
decho    "file."

# Write to stdout only.
DEBUG_LOG_FILE=""
DEBUG_SHELL="1"
decho -n "Screen "
decho    "only."

# Write to log file only.
DEBUG_LOG_FILE="test_log_file"
DEBUG_SHELL="Off"
decho -n "File "
decho    "only."

# Write nothing
DEBUG_LOG_FILE=""
DEBUG_SHELL="0"
decho -n "You should never"
decho    "see this."

