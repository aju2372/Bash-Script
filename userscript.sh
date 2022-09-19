#!/bin/bash
# Main display
echo "Enter number to select an option"
echo "1 = Add Single User"
echo "2 = Delete Single User"

read choice

if [ $choice -eq 1 ] ; then

     echo "Enter Userneame?"
     read  Username
     if [[ -z $Username ]]; then
         echo "User name can not be empty."
         exit 1
     else
     # Set Password...
         useradd $Username
         passwd $username
         if [ $? == 0 ]; then
             echo "user and password createdd successfully..."
         else
             echo "Password not created successfully..."
             exit 1
         fi
     fi


elif [ $choice -eq 2 ]; then

     echo "Which user you want to delete"
     read Username
     if [[ -z $Username ]]; then
         echo "User name can not be empty."
         exit 1
     fi
     var=$(cat /etc/passwd | grep -i $Username)
     if [[ -z $var ]]; then
        echo "User $Username not found"
        exit 2
     else
        userdel -r $Username
     fi
#     RC=$?
     if [ $? == 0 ]; then
        echo "User $Username deleted successfully..."
     else
        echo "user could not be be deleted"
     fi

else
 echo "The given input is not a valid input."
 exit 1

fi

