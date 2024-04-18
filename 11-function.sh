#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(data +F%-H%-M%-%s)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/temp/$SCRIPT_NAME-$TIMESTAMP.log


VALIDATE(){
    if ($1 -ne 0) {
        then 
        echo "$2...Failure"
    else
        echo "$2...SUCCESS"
}


if [ $USERID -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
else
    echo "You are a super user"
fi
# Install MySQL Server
 
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing My SQL Server..."

# Install Git
 
dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git..."

# Check the exit status of the Git installation
if [ $? -eq 0 ]; then
    echo "Installation of Git succeeded"
else
    echo "Installation of Git failed"
    exit 1
fi
