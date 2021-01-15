#!/bin/bash

# arg1 is source directory, arg2 is destination directory

#echo "prog1 running..."

# if numArgs != 2, display "src and dest dirs missing"
if [ "$#" -ne 2 ]; then
  echo "src and dest dirs missing"
  exit 0
fi

# if source directory does not exist:
#     exit status = 0, display "<src-dir> not found"
sourceDir=$1
if [ ! -d "$1" ]; then
  echo "$1 not found"
  exit 0
fi

# if destination directory does not exist:
#     create it if necessary
destDir=$2
if [ ! -d "$2" ]; then
  mkdir "$2"
  #echo "$2 created"
fi

#echo "source: " $sourceDir "dest: " $destDir

# store paths subdirectories under sourceDir in n
# store full paths in s
n=()
s=()
for i in `find "$sourceDir" -type d`
do
  s=(${s[@]} $i)
  if [[ $i == "$sourceDir/"* ]]; then
    n=(${n[@]} `echo $i | sed -n -e 's,'"$sourceDir"'\/\(.*\),\1,p' | cat`)
  fi
done
#echo ${n[@]} # prints names of folders only in sourceDir
#echo ${s[@]} # prints full path of folders in sourceDir

# create subdirectories of destDir if does not exist
for i in ${n[@]}
do
  if [ ! -d "$destDir/$i" ]; then
    mkdir "$destDir/$i"
  fi
done

t=()
for i in `find "$destDir" -type d`
do
  t=(${t[@]} $i)
done
#echo ${t[@]} # prints full path of folders (newly created or not) in destDir

for i in ${!s[@]}
do
  #echo $i ${s[$i]}
  if [ `find "${s[$i]}" -maxdepth 1 -iname '*.c' | wc -l` -gt 3 ]
  then
    echo "Files: " `find ${s[$i]} -maxdepth 1 -iname '*.c' | awk -F/ '{print $NF}'`
    read -p "Would you like to move these files from '${s[$i]}'? (y if yes/anything else if no) " confirm
    if [ "$confirm" == 'y' ] || [ "$confirm" == 'Y' ]; then
      #echo $confirm
      find "${s[$i]}" -maxdepth 1 -iname '*.c' -exec mv {} "${t[$i]}" \;
    fi
  else
    #echo "smallDir"
    find "${s[$i]}" -maxdepth 1 -iname '*.c' -exec mv {} "${t[$i]}" \;
  fi
done
