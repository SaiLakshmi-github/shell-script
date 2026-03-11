#!/bin/bish
echo "All variables $@" #to print all variables
echo "Number of variables passed $#" # to print number of variables passed
echo "Script name: $0" #to print script name
echo "Current working directory $PWD"
echo "Home directory of current user $HOME"
echo "which user is running the script $USER"
echo "Hostname $HOSTNAME"
echo "Process ID of the current shell $$"
echo "Process ID of last backgroud cmd: $!"