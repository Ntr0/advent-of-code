#!/bin/bash

./solve.sh| sort -n | tail -n 3 | awk 'BEGIN {sum=0} {sum+=$1} END {print sum}'
