
############################### Global variables ###############################

NUM_ARGS=$#
BASENAME=$0
WRONG_NUMBER_OF_ARGUMENTS_ERROR=1

################################## Functions ###################################



###################### Assert number of command line args ######################
# Usage: assert_number_of_arguments EXPECTED_NUMBER
#  e.g.  assert_numner_of_arguments 3
#        assert_numner_of_arguments 0

assert_num_args() {
  # Credit: http://www.linuxweblog.com/bash-argument-numbers-check
  EXPECTED_NUM_ARGS=$1
  if [ $NUM_ARGS -ne $EXPECTED_NUM_ARGS ]
  then
    if [ "$NUM_ARGS" -eq "1" ];
    then
      MSG="Expected 1 argument (got $NUM_ARGS)"
    else
      MSG="Expected $EXPECTED_NUM_ARGS arguments (got $NUM_ARGS)"
    fi
    printf "Usage: `basename $BASENAME`\n$MSG\n"
    exit $WRONG_NUMBER_OF_ARGUMENTS_ERROR
  fi
}

########################## Run command, exit on error ##########################
# Usage: exit_on_error "COMMAND"
# e.g. : exit_on_error "ls"
#        exit_on_error 'echo "1+2" | bc'

exit_on_error() {
  COMMAND=$1
  eval "$COMMAND"
  RETCODE=$?
  if [ $RETCODE -eq 0 ];
  then
    return
  else
    exit $RETCODE
  fi
}

######################### Convert string to lower case #########################
# Usage: to_lower "String in quotes" RESULT_VARIABLE_NAME
# e.g. : to_lower "Cheese shop" l1
#        echo $l1  # "cheese shop"

function to_lower()
{
  local  __resultvar=$2
  eval $__resultvar=$(echo "'$1'" | tr '[A-Z]' '[a-z]' )
}

######################### Convert string to UPPER case #########################
# Usage: to_upper "String in quotes" RESULT_VARIABLE_NAME
# e.g. : to_upper "Cheese shop" l1
#        echo $l1  # "CHEESE SHOP"

function to_upper()
{
  local  __resultvar=$2
  eval $__resultvar=$(echo "'$1'" | tr '[a-z]' '[A-Z]' )
}
