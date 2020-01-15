#!/bin/bash
lineNum=0
count=0
read myline < $1
for i in $myline    
do
    count=`expr $count + 1`
done 

while read myLine
do
    lineNum=`expr $lineNum + 1`
done < $1
printf "$lineNum "
printf "$count\n"
