#!/bin/bash

#constants
DB_NAME=moodle

#Local variables
file_name_prefix=$DB_NAME"_"


#functions
mariadbservice=`systemctl status mariadb | grep running`
date_of_backup=`date +%d%m%Y__%H%M`
filename=$file_name_prefix$date_of_backup".sql"



#check if service running
if [[ ${#mariadbservice} == "0" ]] # function retun 0 --> show error
then
echo $(tput setaf 1)"Data base service not started!!! Run it to use sudo  systemctl start mariadb>
exit 1
else
mysqldumpresul=`mysqldump -u $USERNAME -p$PASSWORD moodle > $filename`
fi
