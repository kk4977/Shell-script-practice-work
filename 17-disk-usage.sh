#!/bin/bash

DISK_USAGE=${df -hT | grep /dev/xvda}

DISK_THRESHOLD=6

df -hT | grep /dev/xvda | awk -F " " '{print $6}' | cut -d "%" -f1

while (IFS= read -r line)
do  
     USAGE= $(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
     FOLDER= $(echo $line | awk -F " " '{print $NF}' )

     if [ $USAGE -ge $DISK_THRESHOLD ]
     then 
        "echo $FOLDER is more than $THRESHOLD, Current usage: $USAGE \n"
    fi

done <<< DISK_USAGE 

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" kadalisivakumar789@gmail.com

# echo "body" | mail -s "subject" to-address