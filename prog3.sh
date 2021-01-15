#!/bin/bash

# check if data file exists
data=$1
if [ ! -f "$data" ]; then
  echo "missing data file"
  exit 0
fi

# get number of students
numStud=`awk -F',' 'END{print NR-1}' "$data"`
#echo $numStud

# get number of questions
numQ=`awk -F',' 'END{print NF-1}' "$data"`
#echo $numQ

weights=()
args=("$@")
for(( i=1; i<=$numQ; i++ )); do
  if [ $i -lt "$#" ]; then
    #echo $i ${args[$i]}
    weights[$i-1]=${args[$i]}
  else
    #echo $i 0
    weights[$i-1]=1
  fi
done

# now we have the weight of each question in weights
# calculate sum of weights for average
sumW=0
for t in ${weights[@]}; do
  #echo $t
  sumW=$((sumW+$t))
done
#echo $sumW

avgs=()
for(( i=1; i<=$numStud; i++ )); do
  sum=0
  scores=`awk -F',' "FNR == $i+1 {print}" "$data"`
  #echo $scores
  for(( j=2; j<=$numQ+1; j++ )); do
    score=`echo $scores | awk -F',' -v var=$j '$0 {print $var}'`
    #echo $score
    sum=$((sum+($score * weights[$j-2])))
  done
  #avg=$sum/$sumW
  avg=`expr $sum / $sumW`
  #echo sum $sum avg $avg
  avgs[$i-1]=$avg
done

sumAvg=0
for t in ${avgs[@]}; do
  #echo $t
  sumAvg=$((sumAvg+$t))
  #echo sumAvg $sumAvg
done

#echo $sumAvg

totalAvg=`expr $sumAvg / $numStud`

echo $totalAvg
