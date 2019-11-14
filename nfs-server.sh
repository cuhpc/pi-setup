#!/bin/bash


#install package
sudo yum install nfs-utils -y

#configure what to export
printf "/mnt/netstorage          192.168.0.0/24(rw,sync)\n" | sudo tee -a /etc/exports

#set permissions on storage
sudo chown nfsnobody:nfsnobody /mnt/netstorage/

#enable and start service
sudo systemctl enable nfs-server.service
sudo systemctl start nfs-server.service