#!/bin/bash

DISK_USAGE=$(df -hT | grep tmpfs)

DISK_THRESHOLD=90  # Change this to your desired threshold percentage

MESSAGE=""

while IFS= read -r line; do  
    USAGE=$(echo "$line" | awk '{print $6}' | cut -d '%' -f1)
    FOLDER=$(echo "$line" | awk '{print $7}')

    if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
        MESSAGE+="Folder $FOLDER is using more than $DISK_THRESHOLD%. Current usage: $USAGE%\n"
    fi
done <<< "$DISK_USAGE"

if [ -n "$MESSAGE" ]; then
    echo -e "Message:\n$MESSAGE"
    echo -e "$MESSAGE" | mail -s "Disk Usage Alert" kadalisivakumar789@gmail.com
fi
