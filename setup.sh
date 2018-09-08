#!/bin/sh

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y vim-gnome python python-pip zsh tmux ruby xclip auditd curl socat pkg-config hexdiff cmake qemu-user-static gcc-arm-linux-gnueabihf
sudo apt install -y libc6:i386 libc6-dbg:i386
chsh -s /bin/zsh
sudo pip install pwntools
cp .vimrc .zshrc .tmux.conf ~
mkdir ~/programs
cd ~/programs

# gdb
git clone https://github.com/pwndbg/pwndbg
(
    cd pwndbg
    ./setup.sh
)

# rp++
mkdir rp++
wget https://github.com/downloads/0vercl0k/rp/rp-lin-x64 -O rp++/rp++
chmod +x rp++/rp++

# one_gadget
sudo gem install one_gadget

# radare2
git clone https://github.com/radare/radare2.git
radare2/sys/install.sh

# libc-database
git clone https://github.com/niklasb/libc-database.git
(
    cd libc-database
    ./get
)
