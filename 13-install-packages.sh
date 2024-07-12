#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/
LOGFILE="tmp/$0-$TIMESTAMP.log"
echo "script started execting at $TIMESTAMP" &> $LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
then
echo -e "$2..$Rfailed$N"
exit1
else
echo -e "$2..$Gsuccess$N"
fi
}
if [ $ID -ne 0 ]
then
echo -e "$RERROR::Please run this script with root access$N"
exit1
else
echo You are root user
fi
for package in $@ 
do 
yum list installed $package &> $LOGFILE
if [ $? -ne 0 ]
then
yum install $package -y
VALIDATE $? "Installing of  $package"
else
echo -e "$package is already installed...$YSKIPPING$N"
fi
done