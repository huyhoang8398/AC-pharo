#!/usr/bin/env bash
pwd
wget https://raw.githubusercontent.com/huyhoang8398/script/master/preamble.tex
mapfile -t file_array < <(ls | grep .md)
#declare -p file_array

for i in "${file_array[@]}"; do
    echo $i
    pandoc -H preamble.tex -t beamer --slide-level=2 $i -o $i.pdf
done
