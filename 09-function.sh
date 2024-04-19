#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +F%-H%-M%-%s)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log


VALIDATE()
{
    if [ $1 -ne 0 ] 
    then 
        echo "$2...Failure"
    else
        echo "$2...SUCCESS"
    
    fi
}


 
# Install MySQL Server
 
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing My SQL Server..."

# Install Git
 
dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git..."

# Check the exit status of the Git installation
 
