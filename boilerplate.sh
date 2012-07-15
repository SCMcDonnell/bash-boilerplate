
############################### Global variables ###############################

NUM_ARGS=$#
BASENAME=$0
WRONG_NUMBER_OF_ARGUMENTS_ERROR=1

################################## Functions ###################################

# Usage: assert_number_of_arguments EXPECTED_NUMBER
#  e.g.  assert_numner_of_arguments 3
#        assert_numner_of_arguments 0

assert_number_of_arguments() {
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



