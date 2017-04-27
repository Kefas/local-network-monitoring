#!/usr/bin/env bash

if [ $# != 4 ]; then
    echo "Not enough args";
    exit  1;
fi;

if [ $2 == "TCP" ]; then
            IS_TCP="true";
      else
            IS_TCP="false";
      fi;

echo "{package: {\"from_ip\": \"$3\", \"to_ip\" : \"$4\", \"time\": \"$(date +%d.%m.%Y) $1\", \"is_tcp\" : \"$IS_TCP\"}}"
