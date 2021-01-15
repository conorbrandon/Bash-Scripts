# Bash-Scripts
### 5 simple bash programs

1. Moves all .c files from a source directory to a destination directory, preserving the directory structure, while keeping all .o files in source. 
#### Use
`prog1.sh <src> <dest>`
- If more than 3 files affected, user must confirm move with 'y' or 'Y'. Any other string will skip over these files. 

2. Sums up columns in an input file separated by ';' or ',' or ';' and writes to an output file. Creates output file if doens't exist, or overwrites it if it does.
- example input file:
`1;2:3,4;5` <br>
`1:2;3:4;5`
- example output file:
`Col 1 : 2` <br>
`Col 2 : 4` <br>
`etc...`
#### Use
`prog2.sh <input> <output>`
###### Be advised <br> script expects input file in specified format
