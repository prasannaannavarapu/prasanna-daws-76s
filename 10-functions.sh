#!/bin/bash
VALIDATE(){
if [ $1 -ne 0 ]
then
   echo "ERROR::Installation is failed"
   exit 1
else
    echo "Installation is success"
fi
}
if [ $? -ne 0 ]
then
echo "ERROR::Please run this script with root access"
exit 1
else
echo "You are root user"
fi
yum install mysql -y
VALIDATE $? "Installing mysql"
yum install git -y
VALIDATE $? "Installing git"