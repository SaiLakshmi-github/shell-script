#!/bin/bash

if $(id -u)
then    
    echo "Please run the script with superuser"
else 
    echo "You are superuser"
    exit 1
fi

dnf install mysql -y
exit 1 #Manually exit if there is an error

if [ $? -ne 0 ]
then 
    echo "Installation of mysql is Failed"
exit 1
else 
    echo "Installation of mysql is successful"

fi

dnf install git  -y
exit 1 #Manually exit if there is an error

if [ $? -ne 0 ]
then 
    echo "Installation of Git is Failed"
else 
    echo "Installation of GIT is successful"
exit 1
fi
