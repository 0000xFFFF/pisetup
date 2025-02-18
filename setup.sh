#!/bin/bash -x
sudo apt update
sudo apt upgrade -y

cat << EOF >> packages.txt
git
make
zoxide
neovim
exa
EOF

xargs -a packages.txt sudo apt-get install -y

sudo apt autoremove -y

mv -n ~/.bashrc ~/.bashrc.bak
wget https://raw.githubusercontent.com/0000xFFFF/dotfiles/refs/heads/master/.bashrc -O ~/.bashrc

git clone https://github.com/0000xFFFF/dotfiles
cp -rf dotfiles/.vip ~/.vip
cp -rf dotfiles/.vip ~/.config
