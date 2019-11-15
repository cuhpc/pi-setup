#!/bin/bash
#PREREQ: init

sudo adduser "$1"
sudo passwd "$1"
sudo usermod -aG wheel "$1"

#if NFS has been installed, add user to nfsnobody group
if grep -q nfsnobody /etc/group; then
	sudo usermod -aG nfsnobody "$1"
fi

