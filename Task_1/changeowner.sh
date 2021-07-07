#!/bin/bash

username="$1"

if [ $# -ne 2 ] # check if all parameters are inputed
then
    echo $(tput setaf 1)"Script $0 must have two additional command line arguments <username> <directory> "
  elif [[ $UID -ne 0 ]]; # find if we run script with root permissions
  then
    echo $(tput setaf 1)"Permissions_ERROR!!! Run script with root|sudo permissions"
  elif [[ ! -d "$2" ]]; # check is directory exist in filesystem
  then
    echo $(tput setaf 1)"The directory :$2 dose'n exist in your filesystem"
  elif [[ `sed -n "/^$username/p" /etc/passwd` ]]; #find if user exist
  then echo $(tput setaf 2)"User [$username] Found"
       echo "Owner of all files & directory with subdirectories $PWD will be  changed to:" $(tput setaf 3)$1
       chown -R $1:$1 $2
       echo $(tput setaf 2)"All done!!! owner is $1"
else
    echo $(tput setaf 1)"User [$username] doesn't exist, please use command adduser"
fi
# need add check if few subdirectories with same
