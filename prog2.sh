#!/bin/bash

# arg1 is source data file, arg2 is output file

# if numArgs != 2, display "src and dest dirs missing"
if [ "$#" -ne 2 ]; then
  echo "data file or output file not found"
  exit 0
fi

# check if data file exists
data=$1
if [ ! -f "$data" ]; then
  echo "$data not found"
  exit 0
fi

# check if output file exists, if not create it
output=$2
if [ ! -f "$output" ]; then
  touch "$output"
fi

`printf "" > "$output"`

x=`awk -F"[,;:]" '$0 { for (i=1; i<=NF; i++) sum[i] += $i; } END {for (i=1; i<=NF; i++) print sum[i]}' "$data"`
#echo $x
j=1
for i in $x; do
  echo "Col $j : "$i >> "$output"
  j=$((j+1))
done
