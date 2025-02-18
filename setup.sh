#!/bin/bash -x
sudo apt update
sudo apt upgrade -y

cat << EOF >> packages.txt
git
make
zoxide
exa
EOF

xargs -a packages.txt sudo apt-get install -y
mv ~/.bashrc ~/.bashrc.bak
wget https://raw.githubusercontent.com/0000xFFFF/dotfiles/refs/heads/master/.bashrc -O ~/.bashrc
