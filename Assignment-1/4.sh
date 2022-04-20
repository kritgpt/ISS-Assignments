#!/bin/bash
string=$1
IFS=',' read -ra array <<< "$string"
numEl=${#array[@]}
echo 'Original array:'
echo ${array[@]}

for (( i=0; i<${#array[@]}; i++ ))
do
    for (( j=0; j<11-i-1; j++ ))
    do
	k=$(( $j+1 ))
        if [[ ${array[j]} -gt ${array[k]} ]]
        then
            temp=${array[j]}
            array[$j]=${array[$((j+1))]}
            array[$((j+1))]=$temp
        fi

    done
done
echo 'Sorted array:'
echo ${array[@]}
