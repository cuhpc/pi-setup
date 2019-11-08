#install environmental modules software
sudo yum install environment-modules -y
echo "export MODULEPATH=\"/usr/share/Modules/modulefiles:/etc/modulefiles:/software/modulefiles\"" > /etc/profile.d/modulefiles.sh

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

sudo cp -r modules_assets/* /software/

#make sure new folders have correct permissions
sudo chown -R root:wheel /software/
sudo chmod -R 775 /software/




echo "Please restart terminal to make module system available"