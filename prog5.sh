#!/bin/bash

# if numArgs != 2, display "input file and dictionary missing"
if [ "$#" -ne 2 ]; then
  echo "input file and dictionary missing"
  exit 0
fi

# check if files passed are valid
if [ ! -f "$1" ]; then
  echo "$1 is not a file"
  exit 0
fi
if [ ! -f "$2" ]; then
  echo "$2 is not a file"
  exit 0
fi

targetWords=`egrep -iwo '[a-z]{4}' "${1}"`

for w in $targetWords; do
  test=`egrep $w "${2}"`
  #echo $w $test
  if [ "$test" == "" ]; then
    echo $w
  fi
done
