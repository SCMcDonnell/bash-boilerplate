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
  if [ -f "test$number.out" ]; then
    printf "test %-4d\tRunning test%d.sh...    " $number $number
    DIFF=`./test$number.sh 2>&1 | diff - test$number.out 2>&1`
    printf "Done. \tComparing output with test%d.out...   " $number 
    write_diff_result "$DIFF"
  fi 
}

function test_and_compare_file() {
  number=$1
  if [ -f "test$number.log" ]; then
    printf "test %-4d\tRunning test%d.sh...    " $number $number
    DIFF=`diff test$number_current.log test$number.log 2>&1`
    printf "Done. \tComparing output with test%d.out...   " $number 
    write_diff_result "$DIFF" 
  fi
}
  
function test_full() {
  number=$1
  test_and_compare      $number
  test_and_compare_file $number
}


test_full 1
test_full 2
test_full 3
test_full 4

