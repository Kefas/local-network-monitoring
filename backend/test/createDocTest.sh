#!/usr/bin/env bash

COMMAND="../../src/createDoc.sh"

#############
TEST_NAME="should show error when too little args"
$COMMAND


if [ $? != 0 ]; then
            echo -e "PASSED: $TEST_NAME \n"
      else
            echo -e "FAILED:  $TEST_NAME \n"
fi;
#############


#############
TEST_NAME="should show error when too much args"
$COMMAND ARG1 ARG2 ARG3 ARG4 ARG5

if [ $? != 0 ]; then
            echo -e "PASSED: $TEST_NAME \n"
      else
            echo -e "FAILED:  $TEST_NAME \n"
fi;
#############


#############
TEST_NAME="should create document"
$COMMAND A1 A2 A3 A4 > OUTPUT

if [[ "{package: {\"from_ip\": \"A3\", \"to_ip\" : \"A4\", \"time\": \"$(date +%d.%m.%Y) A1\", \"is_tcp\" : \"false\"}}" == $(< OUTPUT) ]]; then
            echo -e "PASSED: $TEST_NAME \n"
      else
            echo -e "FAILED:  $TEST_NAME \n"
fi;
#############