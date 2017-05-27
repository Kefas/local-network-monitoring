#!/usr/bin/env bash
#call me with sudo

source properties.sh


while true; do
     for ((N=1; N<=$NUM_OF_TEMP_FILES; N++)); do
        tcpdump -v  -c $SIZE_OF_SAMPLE > tmpfile$N.txt
        ./parser.sh  tmpfile$N.txt &

        sleep $INTERVAL_IN_SEC
    done

done
