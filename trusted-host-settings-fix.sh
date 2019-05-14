#!/bin/sh

echo "Copyright (C) <2019> <Frank Fiorante> <https://github.com/frankfiorante>"

#Check that argument is provided
if [ $# -eq 0 ]; then
    echo "No argument provided"
    echo "Please enter your codeanywhere site URL"
    echo "Example site URL: d8-chakra-backup-ffiorant917627"
    exit 1
fi

#copy settings.php from sites/default to workspace
#delete original after making a copy
cd sites/default/
cp settings.php ../../
sudo rm settings.php
cd ../../

#Use Linix Stream Editor Command to append the trusted_host_patterns settings
#-i means in-place command and 731 is the line number we want to move this to
#$1 is the first argument passed in
sed -i 731i\ "\$settings[\'trusted_host_patterns\'] = array(\'^$1\.codeanyapp\.com\$\',);" settings.php

#Moving new settings.php to sites/default and setting permission 644
sudo mv settings.php sites/default
sudo chmod 644 sites/default/settings.php

#Changing .htaccess to allow lager file sizes
sudo echo "" >> .htaccess
sudo echo "php_value	upload_max_filesize	20M" >> .htaccess
sudo echo "php_value	post_max_size	50M" >> .htaccess

echo "settings.php was updated"
echo ".htaccess was updated"