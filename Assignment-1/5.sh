#!/bin/bash
#part a
echo $1 | rev

#part b
echo $1 | rev | tr "a-zA-Z" "b-zaB-ZA"

#part c
string=$1
LEN=${#string}
mid=$(( $LEN/2 ))
for (( i=mid-1; i>=0; i-- )); do
	echo -n "${string:$i:1}"
done
for (( j=mid; j<LEN; j++ )); do
	echo -n "${string:$j:1}"
done
echo
