#!/bin/bash
grep . quotes.txt >temp1.txt
awk '!seen[$0]++' temp1.txt > temp2.txt
mv temp2.txt output1.txt
cat output1.txt
