# Bash-Scripts
### 5 simple bash programs

---

1. Moves all .c files from a source directory to a destination directory, preserving the directory structure, while keeping all .o files in source. 
#### Use
`$ prog1.sh <src> <dest>`
- If more than 3 files affected, user must confirm move with 'y' or 'Y'. Any other string will skip over these files. 
<br> 
---

2. Sums up columns in an input file separated by ';' or ',' or ';' and writes to an output file. Creates output file if doens't exist, or overwrites it if it does.
#### Use
`$ prog2.sh <input> <output>`
- example input file: <br>
`1;2:3,4;5` <br>
`1:2;3:4;5`
- example output file: <br>
`Col 1 : 2` <br>
`Col 2 : 4` <br>
`etc...`
*Be advised* script expects input file in specified format
<br>
---

3. Computes the weighted average of a set of scores on test questions in an input file, and prints to console.
#### Use
`$ prog3.sh <input> [ <weight1> <weight2> ... ]`
- If more weights are provided than questions, extras will be ignored. If fewer weights, subsequent questions default to weight of 1.
- example input file:
`ID,Q1,Q2,Q3,Q4,Q5` <br>
`101,8,6,9,4,4` <br>
`102,9,9,9,10,4` <br>
`etc...`
*Be advised* script expects first line as above and ids to be present 
<br> 
---

4. Computes the letter grade from a directory of files with each student's test score. Grades are printed to console for each student. Test is always worth 50 points and letter grades as follows:
Percentage Score Range  Letter Grade
93-100                  A
80-92                   B
65-79                   C
<65                     D
#### Use
`$ prog4.sh <directory>`
- example input file:
`ID,Q1,Q2,Q3,Q4,Q5` <br>
`101,8,6,9,4,4` <br>
*Be advised* script expects each file to look exactly as above.
<br> 
---
