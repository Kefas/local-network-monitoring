#!/usr/bin/env bash

# run with active program with zero interval time

#############
TEST_NAME="should record traffic to specified service"
source properties.sh
SERVICE_NAME='redhat'

NUMBER_OF_REC_PACKAGES_BEFORE=`mongo --eval "${NAME_OF_DB_COLLECTION}.count({"to_ip":/${SERVICE_NAME}/})"|tail -n 1`

curl http://www.${SERVICE_NAME}.org
sleep 30s #time for feeding data in db

NUMBER_OF_REC_PACKAGES_AFTER=`mongo --eval "${NAME_OF_DB_COLLECTION}.count({"to_ip":/${SERVICE_NAME}/})"|tail -n 1`


if [ ${NUMBER_OF_REC_PACKAGES_AFTER} -gt ${NUMBER_OF_REC_PACKAGES_BEFORE} ]; then
            echo -e "PASSED: $TEST_NAME \n"
      else
            echo -e "FAILED:  $TEST_NAME \n"
fi;
#############
