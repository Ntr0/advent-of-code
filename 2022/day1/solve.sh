#!/bin/bash
cat input.txt| awk 'BEGIN {sum=0} /^[  ]*$/ {print sum; sum = 0} /^[0-9]*$/ {sum += $1} END {print sum}'
