#!/bin/bash

# read file into a variable
chapters=$(<07_chapters.txt)

for chapter in ${chapters[*]}
do
   echo "$chapter"
done

#$ ./07_file_input.sh
#Chapter_1
#Chapter_2
#Chapter_3