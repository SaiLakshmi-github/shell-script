#!/bin/bash


USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE() {
if [ $1 -ne 0 ]
then
    echo -e "$2 $R is FAILURE $N"
    exit 1
else
    echo -e "$2 $G is SUCCESS $N"
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
