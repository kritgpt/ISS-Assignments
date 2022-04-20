#!/bin/bash
# part a
FILESIZE=$(stat -c%s "output1.txt")
echo "Size = $FILESIZE bytes."

#part b
LINES=$(wc -l < output1.txt)
echo "Number of lines in file = $LINES"

#part c
WORDS=$(wc -w < output1.txt)
echo "Number of words in file = $WORDS"

#part d
echo 'PART D'
awk '{print "Line No: " NR-1 " - Count of Words: " NF}' output1.txt

#part e
input="./words.txt"
containsElement () {
  local e match="$1"
  shift
  for e
  do [[ "$e" == "$match" ]] && echo 0;
  done
  echo 1
}
dict=()
while IFS=$'\n' read -r line
do
        IFS=' ' read -ra arr <<< "$line"

        for val in "${arr[@]}"
        do
                flags=$( containsElement "$val" "${dict[@]}" )
                IFS=' ' read -ra flag <<< "$flags"
                if [ ${flag[0]} -eq 1 ]
                then
                	dict+=($val)
                fi
        done
done < "$input"
for word in "${dict[@]}"
do
        freq=$( tr '[:space:]' '[\n*]' < $input | grep -c $word )
        if [ $freq -gt 1 ]
        then
                echo "Word: $word - Count of repetition: $freq"
        fi
done
