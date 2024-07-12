#!/bin/bash
ID=$(id -u)
echo "script started execting at $TIMESTAMP" &>> $LOGFILE
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOG_FILE=/tmp/
LOG_FILE="tmp/$0-$TIMESTAMP.log
echo "script name ::$0"
VALIDATE(){
    if [ $? -ne 0 ]
then
echo "ERROR::$2..$Rfailed$N"
exit1
else
echo "$2..$Gsuccess"
fi
}
if [ $? -ne 0 ]
then
echo "$RERROR::Please run this script with root access$N"
exit1
else
echo "You are root user"
fi
yum install mysql -y &>> $LOGFILE
VALIDATE $? "Installing mysql"
yum install git -y &>> $LOGFILE
VALIDATE $? "Installing git"