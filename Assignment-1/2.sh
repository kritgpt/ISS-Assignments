#!/bin/bash
awk -F'~' '{outp=$2" once said, \""$1"\""; print outp}' output1.txt > speech.txt
