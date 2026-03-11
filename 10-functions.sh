#!/bin/bash


USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

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

dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Installing mysql"

dnf install git  -y &>>LOGFILE

VALIDATE $? "Installing GIT"
