#!/bin/bash
# Main display
echo "Enter number to select an option"
echo "1 = Add Single User"
echo "2 = Delete Single User"
echo "3 = Enter username you want to change password"

read choice

if [ $choice -eq 1 ] ; then

     echo "Enter Userneame?"
     read  Username
     if [[ -z $Username ]]; then
         echo "User name can not be empty."
         exit 1
     else
        var=$(cat /etc/passwd | grep -i $Username)
           if [[ -z $var ]]; then
     # Set Password...
              echo "new user"
              useradd $Username
              passwd $Username
                if [ $? == 0 ]; then
                   echo "user and password createdd successfully..."
                else
                   echo "Password not created successfully..."
                   exit 1
                 fi
           else
             echo "User $Username already exists..."

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
        exit 1
     else
        userdel -r $Username
     fi

     if [ $? == 0 ]; then
        echo "User $Username deleted successfully..."
     else
        echo "user could not be be deleted"
     fi


elif [ $choice -eq 3 ] ; then

     echo "Enter existing username you want change password?"
     read  Username
     if [[ -z $Username ]]; then
         echo "Username name can not be empty."
         exit 1
     fi
     var=$(cat /etc/passwd | grep -i $Username)
     if [[ -z $var ]]; then
        echo "User $Username not found"
     else
     # Set Password...
        passwd $username
        echo "Password Changed successfully..."
     fi
else
 echo "The given input is not a valid input."
 exit 1

fi



