#!/bin/bash
SOURCEDIRECTORY=/tmp/applogs

if [ -d $SOURCEDIRECTORY ]
then
    echo "Sourcedirectory exists"
else
    echo "Please makesure sourcedirectory exists"
    exit 1
fi

Files=$(find $SOURCEDIRECTORY -name "*.log" -mtime +14)

while IFS= read -r line
do
    echo "Deleting the files: $line"
    rm -rf $line
done <<< $Files

