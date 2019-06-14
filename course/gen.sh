#!/usr/bin/env bash
pwd
mapfile -t file_array < <(ls | grep .md)
#declare -p file_array

for i in "${file_array[@]}"; do
    echo $i
    pandoc $i -H preamble.tex -t beamer --slide-level=2 -o $i.pdf
done
