#!/bin/bash

set -e

failure() {
    echo " failed at $1:$2"
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
   echo " Please install the package with superuser"
   exit 1
else
   echo " You are Superuser"
fi

dnf install mysqlfff -y
dnf install git 

