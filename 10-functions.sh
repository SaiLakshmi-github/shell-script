#!/bin/bash

USERID=$(id -u)

VALIDATE() {
if [ $1 -ne 0 ]
then
    echo "$2 is FAILURE"
    exit 1
else
    echo "$2 is SUCCESS"
fi
}
if [ $USERID -ne 0 ]
then    
    echo "Please run the script with superuser"
    exit 1
else 
    echo "You are superuser"
fi

dnf install mysqll -y
VALIDATE $? "Installing mysql"

