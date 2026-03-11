#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d '.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
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

for i in $@
do
  echo "Package to install: $i"
  dnf list installed $i &>>$LOGFILE
  if [ $? -eq 0 ]
  then
   echo -e "Package is already installed.. $Y SKIPPING $N"
  else
    dnf install $i -y &>>$LOGFILE
    VALIDATE $? "Installation of $i"
    fi 
done

