#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "Please run the script with superuser"
    exit 1
else 
    echo "You are superuser"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installation of mysql is Failed"
exit 1
else 
    echo "Installation of mysql is successful"

fi

dnf install git  -y

if [ $? -ne 0 ]
then 
    echo "Installation of Git is Failed"
    exit 1
else 
    echo "Installation of GIT is successful"

fi
