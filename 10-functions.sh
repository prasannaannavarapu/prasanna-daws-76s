#!/bin/bash
VALIDATE(){
    if [ $1 -ne 0 ]
then
echo "ERROR::Installing is failed"
exit1
else
echo "Installing is success"
fi
}
if [ $? -ne 0 ]
then
echo "ERROR::Please run this script with root access"
exit1
else
echo "You are root user"
fi
yum install mysql -y
VALIDATE $? "Installing mysql"
yum install git -y
VALIDATE $? "Installing git"