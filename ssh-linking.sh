#!/bin/bash
#PREREQ: create-sudoer-user

ssh-keygen -C "intracluster connection"
ssh-copy-id localhost
for node in `seq 1 8`; do
scp -r .ssh pi0$i:.ssh