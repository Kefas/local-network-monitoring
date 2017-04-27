#!/usr/bin/env bash
#calll it with sudo

# check if install
# check if can be done
NUM_OF_PACKETS_TO_EXIT=2000
NUM_OF_TEMP_FILES=100
while true; do
     for ((N=1; N<=$NUM_OF_TEMP_FILES; N++)); do
        tcpdump -v  -c $NUM_OF_PACKETS_TO_EXIT > tmpfile$N.txt
        ./parser.sh  tmpfile$N.txt &

    done

done


##cleaning
#for N in {1..$NUM_OF_TEMP_FILES}; do
#        rm tmpfile{$N}.txt
#done