#!/usr/bin/env bash

if [ $# != 4 ]; then
    echo "Wrong number of args - should be exactly 4";
    exit  1;
fi;

if [ $2 == "TCP" ]; then
            IS_TCP="true";
      else
            IS_TCP="false";
      fi;

echo "{\"from\": \"$3\", \"to\" : \"$4\", \"time\": \"$(date +%d.%m.%Y) $1\", \"is_tcp\" : \"$IS_TCP\"}"
exit 0
