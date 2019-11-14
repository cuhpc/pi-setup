#!/bin/bash
#PREREQ: network

#install package
sudo yum install nfs-utils -y

#configure what to import (mount on boot)
printf "pi01:/mnt/netstorage  /mnt/nfs/netstorage  nfs rw,sync,hard,intr  0  0\n" | sudo tee -a /etc/fstab

#create target of mount(s)
sudo mkdir -p /mnt/nfs/netstorage

#mount for current boot (will be auto-mounted upon reboot)
sudo mount pi01:/mnt/netstorage /mnt/nfs/netstorage
