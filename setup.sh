#!/bin/bash -x
cd ~
sudo apt update
sudo apt upgrade -y

cat << EOF >> packages.txt
bat
git
make
zoxide
neovim
exa
i3-wm
i3blocks
i3status
rofi
xorg
xinit
fonts-noto-core
fonts-noto-color-emoji
EOF

xargs -a packages.txt sudo apt-get install -y

sudo apt autoremove -y

mv -n ~/.bashrc ~/.bashrc.bak
wget https://raw.githubusercontent.com/0000xFFFF/dotfiles/refs/heads/master/.bashrc -O ~/.bashrc

cd ~
git clone https://github.com/0000xFFFF/dotfiles
cp -rf dotfiles/.vip ~/.vip
cp -rf dotfiles/.config ~/.config
rm -rf ~/.config/nvim

cd ~
git clone https://github.com/0000xFFFF/pisetup
cp -rf pisetup/configs/i3config ~/.config/i3/config
cp -rf pisetup/configs/.bashrc_start ~/.bashrc_start
grep -qxF 'source .bashrc_start' ~/.bashrc || echo 'source .bashrc_start' >> ~/.bashrc

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Inconsolata.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Gohu.zip
unzip Inconsolata.zip -d Inconsolata
unzip Gohu.zip -d Gohu
fc-cache -fv
