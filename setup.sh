#!/bin/bash -x
sudo apt update
sudo apt upgrade -y
sudo apt install git make
mv ~/.bashrc ~/.bashrc.bak
wget https://raw.githubusercontent.com/0000xFFFF/dotfiles/refs/heads/master/.bashrc -O ~/.bashrc
