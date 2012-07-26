#!/bin/bash

function write_diff_result() {
  DIFF=$1
  if [ -z "$DIFF" ];
  then
    echo "OK"
  else
    echo "ERROR"
  fi
}

function test_and_compare () {
  number=$1
  test_script=$2
  test_output=$3
  if [ -f "$test_script" ]; then
    printf "test %04d: Running %s... " $number $test_script
    DIFF=`./$test_script 2>&1 | diff - $test_output 2>&1`
    printf "Done.\t\t(output == %s) ?                   " $test_output
    write_diff_result "$DIFF"
  fi 
}

function test_and_compare_file() {
  number=$1
  test_script=$2
  test_log=$3
  current_test_log="test"$number"_current.log"
  if [ -f "$test_log" ]; then
	rm $current_test_log
	eval "./$test_script" 2>&1 > /dev/null
    printf "test %04d: Running test%04d.sh... " $number $number
	diff test"$number"_current.log test$number.log 2>&1
    DIFF=`diff test"$number"_current.log test$number.log 2>&1`
    printf "Done.\t\t(test%04d_current.log == test%04d.log) ?     " $number $number
    write_diff_result "$DIFF" 
  fi
}
  
function test_full() {
  number=$1
  test_script="test$number.sh"
  test_output="test$number.out"
  test_log="test$number.log"

  test_and_compare $number $test_script $test_output
  if [ -f $test_log ]; then
	  test_and_compare_file $number $test_script $test_log
  fi
}

for index in `seq -f "%04g" 1 1000`; do
	test_full $index
done 