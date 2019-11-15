#!/bin/bash
#PREREQ: init

#install environmental modules software
sudo yum install environment-modules -y
echo "export MODULEPATH=\"/usr/share/Modules/modulefiles:/etc/modulefiles:/software/modulefiles\"" | sudo tee /etc/profile.d/modulefiles.sh > /dev/null

#setup folder structure to match Palmetto
sudo mkdir /software/
sudo mkdir /software/modulefiles

#add specific software and associated modulefiles
sudo mkdir /software/modulefiles/python
sudo mkdir /software/python
sudo mkdir /software/modulefiles/openmpi
sudo mkdir /software/openmpi
sudo mkdir /software/modulefiles/gcc
sudo mkdir /software/gcc
sudo mkdir /software/modulefiles/git
sudo mkdir /software/git

#make sure new folders have correct permissions
sudo chown -R root:wheel /software/
sudo chmod -R 775 /software/

#copy stock install into correct location
#sudo cp -r modules_assets/* /software/


echo "Please restart terminal to make module system available"