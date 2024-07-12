#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
TIME_STAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIME_STAMP.log"
echo "script started execting at $TIME_STAMP" &> $LOG_FILE
VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "$2 ... $R failed $N"
    exit 1
else
   echo -e "$2 .. $G success $N"
fi
}
if [ $ID -ne 0 ]
then
echo -e "$R ERROR::Please run this script with root access $N"
exit 1
else
echo You are root user
fi
for package in $@ 
do 
yum list installed $package &> $LOG_FILE
if [ $? -ne 0 ]
then
yum install $package -y
VALIDATE $? "Installing of  $package"
else
echo -e "$package is already installed...$Y SKIPPING $N"
fi
done