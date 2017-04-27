#!/usr/bin/env bash



FILE=$1

#cut -s --delimiter=' ' --fields=1,14,18,20  |while read P; do   mongo --eval "db.sniff5.insertOne($(./createDoc.sh $P))" &> /dev/null

while read P; do
#echo $P
    if [[ "$P"  =~ .*PTR.*  ]]; then
        echo "consider PTR";
        if [[ "$P"  =~ .*PTR\?.*  ]]; then
        echo "PTR?"
          RESULT=`cut -s --delimiter=' ' --fields=1,14,25,20   "$P"`;
        else
        echo "PTR"
            RESULT=`cut -s --delimiter=' ' --fields=1,14,18,23   $P`;
        fi;
    else
    echo "standard"
      RESULT=`cut -s --delimiter=' ' --fields=1,14,18,20`;
    fi;

echo $RESULT;
done < $FILE