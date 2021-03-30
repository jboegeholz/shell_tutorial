#!/bin/bash
TEXT_FILES=(
./data/01.txt
./data/02.txt
./data/03.txt
)

for text_file in ${TEXT_FILES[*]}
do
	cat "$text_file"
	printf "\n"
done