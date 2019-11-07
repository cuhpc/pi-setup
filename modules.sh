#install environmental modules software
sudo yum install environment-modules -y
MODULEPATH="/usr/share/Modules/modulefiles:/etc/modulefiles:/software/modulefiles"

#setup folder structure to match Palmetto
sudo mkdir /software/
sudo mkdir /software/modulefiles
sudo mkdir /software/modulefiles/python
sudo mkdir /software/python

#make sure new folders have correct permissions
sudo chown -R root:root /software/
sudo chmod -R a+rx /software/