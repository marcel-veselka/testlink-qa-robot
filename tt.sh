#!/bin/bash

# Variables
DB_PSWD=testlab 
SECONDS=0
BRANCH=testlink_1_9

echo "Starting instaling new TestLink!"

cd /var/www/html/

#
# Clean up before install
#
sudo rm -f -r testlink-code
mysql -u root -p$DB_PSWD -e 'DROP DATABASE testlink_qa';

#
# Clone git locally
#
sudo git clone -b $BRANCH https://github.com/TestLinkOpenSourceTRMS/testlink-code.git
cd testlink-code
sudo git checkout 1.9.14

#
# Set up configuration file
#
sudo cp ~/config_db.inc.php config_db.inc.php
#sudo sed -i 's/mysqlroot/testlab/g' config_db.inc.php
#sudo sed -i 's/tlOctober2015/testlink_qa/g' config_db.inc.php

sudo chown -R www-data:www-data ../testlink-code

# DB set up
mysql -u root -p$DB_PSWD -e 'CREATE DATABASE testlink_qa CHARACTER SET utf8 COLLATE utf8_general_ci;';
mysql -u root -p$DB_PSWD testlink_qa < install/sql/mysql/testlink_create_tables.sql;
mysql -u root -p$DB_PSWD testlink_qa < install/sql/mysql/testlink_create_default_data.sql

sudo rm -f -r install

cd

echo "Installation finished."

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."