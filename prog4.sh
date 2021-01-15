#!/bin/bash

# if numArgs != 1, display "score directory missing"
if [ "$#" -ne 1 ]; then
  echo "score directory missing"
  exit 0
fi

direc=$1
# check if directory passed is valid
if [ ! -d "$direc" ]; then
  echo "$direc is not a directory"
  exit 0
fi

ids=()
percs=()
# ids=`find "$direc" -type f | while read LINE; do 
# id=$(cat "$LINE" | awk -F',' 'FNR == 2 {print $1}')
# echo $id
# ids=(${ids[@]} $id);
# done`
# percs=`find "$direc" -type f | while read LINE; do 
# sumScores=0
# for(( j=2; j<=6; j++ )); do
#   score=$(cat "$LINE" | awk -F',' -v var=$j 'FNR == 2 {print $var}')
#   #echo $score
#   sumScores=$((sumScores+($score * 10)))
# done
# #echo sum $sumScores
# sumScoresBig=$(expr $sumScores '*' 100)
# perc=$(expr $sumScoresBig / 500)
# echo $perc
# done`
# echo $ids
# echo $percs
# 
# for i in $ids do
#   echo $i
# done

for i in `find "$direc" -type f`
do
  #echo "${i}"
  id=`cat "$i" | awk -F',' 'FNR == 2 {print $1}'`
  #echo $id
  ids=(${ids[@]} $id)

  # find sum of scores * 10
  sumScores=0
  for(( j=2; j<=6; j++ )); do
    score=`cat "$i" | awk -F',' -v var=$j 'FNR == 2 {print $var}'`
    #echo $score
    sumScores=$((sumScores+($score * 10)))
  done
  #echo sum $sumScores

  sumScoresBig=`expr $sumScores '*' 100`

  # find the percentage = sumScores / 500
  perc=`expr $sumScoresBig / 500`
  percs=(${percs[@]} $perc)
done

# correlate percentages to grade
for(( i=0;i<${#percs[@]};i++ )) do
  #echo ${ids[$i]} ${percs[$i]}
  if [ ${percs[$i]} -gt 92 ]; then
    echo ${ids[$i]}:A
  elif [[ ${percs[$i]} -gt 79 ]]; then
    echo ${ids[$i]}:B
  elif [[ ${percs[$i]} -gt 64 ]]; then
    echo ${ids[$i]}:C
  else
    echo ${ids[$i]}:D
  fi
done
