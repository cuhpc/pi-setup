#!/bin/bash
#PREREQ: init

sudo adduser "$1"
sudo passwd "$1"
sudo usermod -aG wheel "$1"