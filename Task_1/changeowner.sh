#!/bin/bash

username="$1"
if [ `sed -n "/^$username/p" /etc/passwd` ]
then
    echo $(tput setaf 2)"User [$username] Found"
    echo "Owner of all files & directory with subdirectories $PWD will be  changed to:" $(tput setaf 3)$1
    chown -R $1:$1 $PWD
    echo $(tput setaf 2)"All done!!! owner is $1"
else
    echo $(tput setaf 1)"User [$username] doesn't exist, please use command adduser"
fi
