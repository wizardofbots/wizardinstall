#!/bin/bash
# ******************************************
# Program: Dev mode install
# Developer: Wizard of Bots
# Site: http://wizardofbots.com/network
# Date: 16-07-2016
# ******************************************

if [ "`lsb_release -is`" == "Ubuntu" ] || [ "`lsb_release -is`" == "Debian" ]
then
    # save time and install essential
    sudo apt-get install -y build-essential;
    # install git
    sudo apt-get install git;
    # install python
    sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev;
    sudo apt-get python2.7;
    sudo apt-get install python-software-properties;
    # install php
    sudo apt-get install apache2;
    sudo apt-get install curl;
    sudo apt-get install mysql-server;
    sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql;
    sudo systemctl restart apache2;
    sudo systemctl status apache2;
    sudo apt-get install php-cli;
    # install package manager for PHP: Composer
    sudo apt-get update;
    # install perl
    sudo apt-get install perl;
    # install ruby
    sudo apt-add-repository ppa:brightbox/ruby-ng
    sudo apt-get update
    sudo apt-get install ruby1.9.3
    # installing nodejs
    sudo apt-get update;
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -;
    sudo apt-get install -y nodejs;
    sudo chmod 777 -R /var/www/;
    sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
    sudo service apache2 restart;

elif [ "`lsb_release -is`" == "CentOS" ] || [ "`lsb_release -is`" == "RedHat" ]
then
    sudo yum -y install httpd mysql-server mysql-devel php php-mysql php-fpm;
    sudo yum -y install epel-release phpmyadmin rpm-build redhat-rpm-config;
    sudo yum -y install mysql-community-release-el7-5.noarch.rpm proj;
    sudo yum -y install tinyxml libzip mysql-workbench-community;
    sudo chmod 777 -R /var/www/;
    sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
    sudo service mysqld restart;
    sudo service httpd restart;
    sudo chkconfig httpd on;
    sudo chkconfig mysqld on;

else
    echo "Unsupported Operating System";
fi