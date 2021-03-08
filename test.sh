#!/bin/bash

if [ $# -ne 2 ];then
    echo "Usage: $0 [base directory] [mount directory]";
    exit;
fi

printPass=false
printDiff=false

base=$1
mount=$2

numPass=0
numFail=0
for f in ./tests/*.sh; do
    cd $mount
    output1=$(../$f)
    code1=$?
    cd ../$base
    output2=$(../$f)
    code2=$?
    cd ..

    #echo $output1
    #echo $output2
    #echo $code1
    #echo $code2

    if [ "$output1" = "$output2" ] && [ $code1 -eq $code2 ]; then
        if [ "$printPass" = true ]; then
            echo PASSED: $f
        fi
        let "numPass+=1"
    else
        echo FAILED: $f
        if [ "$printDiff" = true ]; then
            diff <(echo "$output1") <(echo "$output2")
            echo ""
        fi
        let "numFail+=1"
    fi
done

echo ""
echo "NUMBER PASSED: $numPass    NUMBER FAILED: $numFail"