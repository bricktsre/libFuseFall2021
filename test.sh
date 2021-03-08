#!/bin/bash

if [ $# -ne 2 ];then
echo "Usage: $0 [base directory] [mount directory]";
exit;
fi

base=$1
mount=$2

for f in ./tests/*.sh; do
cd $mount
output1=$(../$f)
cd ..
cd $base
output2=$(../$f)
cd ..

#echo $output1
#echo $output2

if [ "$output1" = "$output2" ]; then
  echo PASSED: $f
else
  echo FAILED: $f
fi
done
