#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
else
    echo "You are a super user"
fi

# Install MySQL Server
echo "Installing MySQL Server..."
 
dnf install mysql -y
 
if [ $? -eq 0 ]; then
    echo "Installation of MySQL Server succeeded"
else
    echo "Installation of MySQL Server failed"
    exit 1
fi

# Install Git
echo "Installing Git..."
dnf install git -y

# Check the exit status of the Git installation
if [ $? -eq 0 ]; then
    echo "Installation of Git succeeded"
else
    echo "Installation of Git failed"
    exit 1
fi
