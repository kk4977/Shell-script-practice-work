#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +F%-H%-M%-%s)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"


VALIDATE(){
    if [$1 -ne 0] {
    then 
        echo -e "$2...$R Failure $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
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

 