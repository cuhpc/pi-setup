#!/bin/bash
#PREREQ: create-sudoer-user(on all nodes)

ssh-keygen -C "intra-cluster connection"
ssh-copy-id localhost

#add all nodes to known_hosts
for node in `seq 1 8`; do
	ssh pi0$i "cd"

#copy known_hosts and keys to all nodes
for node in `seq 1 8`; do
scp -r .ssh pi0$i:.ssh