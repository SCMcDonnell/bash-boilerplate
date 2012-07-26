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
  unit_script=$2
  unit_output=$3
  if [ -f "$unit_script" ]; then
    printf "unit %04d: Running %s... " $number $unit_script
    DIFF=`./$unit_script 2>&1 | diff - $unit_output 2>&1`
    printf "Done.\t\t(output == %s) ?                   " $unit_output
    write_diff_result "$DIFF"
  fi 
}

function test_and_compare_file() {
  number=$1
  unit_script=$2
  unit_log=$3
  current_unit_log="unit"$number"_current.log"
  if [ -f "$unit_log" ]; then
	rm $current_unit_log
	eval "./$unit_script" 2>&1 > /dev/null
    printf "unit %04d: Running unit%04d.sh... " $number $number
	diff unit"$number"_current.log unit$number.log 2>&1
    DIFF=`diff unit"$number"_current.log unit$number.log 2>&1`
    printf "Done.\t\t(unit%04d_current.log == unit%04d.log) ?     " $number $number
    write_diff_result "$DIFF" 
  fi
}
  
function test_full() {
  number=$1
  unit_script="unit$number.sh"
  unit_output="unit$number.out"
  unit_log="unit$number.log"

  test_and_compare $number $unit_script $unit_output
  if [ -f $unit_log ]; then
	  test_and_compare_file $number $unit_script $unit_log
  fi
}

for index in `seq -f "%04g" 1 1000`; do
	test_full $index
done 