#!/usr/bin/env bash
source properties.sh


if [ $# != 1 ]; then
    echo "Parsing failed: Not enough args - lack of file to parse";
    exit  1;
fi;

FILE=$1
echo "START parse: " $FILE

#standard, no PTR
sed -n '/\(^[0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9][0-9][0-9][0-9]\)/ {N; s/[\r\n]   //g; p}'  $FILE | grep -v PTR |  cut -s --delimiter=' ' --fields=1,14,18,20  |while read P; do   mongo --eval "${NAME_OF_DB_COLLECTION}.insertOne($(./createDoc.sh $P))" &> /dev/null; done

#PTR
sed -n '/\(^[0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9][0-9][0-9][0-9]\)/ {N; s/[\r\n]   //g; p}'  $FILE | grep PTR | grep -v PTR? |  cut -s --delimiter=' ' --fields=1,14,25,20  |while read P; do   mongo --eval "${NAME_OF_DB_COLLECTION}.insertOne($(./createDoc.sh $P))" &> /dev/null; done

#PTR?
sed -n '/\(^[0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9][0-9][0-9][0-9]\)/ {N; s/[\r\n]   //g; p}'  $FILE | grep PTR? | cut -s --delimiter=' ' --fields=1,14,18,23   |while read P; do   mongo --eval "${NAME_OF_DB_COLLECTION}.insertOne($(./createDoc.sh $P))" &> /dev/null; done


echo "END parse: " $FILE