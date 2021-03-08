#!/bin/bash
for n in {1..100}
do
    echo "this is the $n -th file" > "file_$n.txt"
    cat "file_$n.txt"
done
for n in {1..100}
do
echo
    rm "file_$n.txt"
done
