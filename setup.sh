#!/bin/bash -x
sudo apt update
sudo apt upgrade -y
xargs -a packages.txt sudo apt-get install
mv ~/.bashrc ~/.bashrc.bak
wget https://raw.githubusercontent.com/0000xFFFF/dotfiles/refs/heads/master/.bashrc -O ~/.bashrc
