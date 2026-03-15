#!/bin/bash
DISKUSAGE=$(df -hT | grep xfs)
DISKTHRESHOLD=6
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $N}')
    if [ $USAGE -ge $DISKTHRESHOLD ]
    then
     MESSAGE+="$FOLDER is more than $DISKTHRESHOLD, Current Usage: $USAGE \n"

    fi
done <<< $DISKUSAGE

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" sailakshmi88@gmail.com

# echo "body" | mail -s "subject" to-address