#!/bin/sh

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y vim-gnome python python-pip zsh tmux ruby xclip auditd curl socat pkg-config hexdiff cmake qemu-user-static gcc-arm-linux-gnueabihf gdb-multiarch
sudo apt install -y libc6:i386 libc6-dbg:i386
chsh -s /bin/zsh
sudo pip install pwntools
cp .vimrc .zshrc .tmux.conf ~
mkdir ~/tools
cd ~/tools

# gdb
git clone https://github.com/pwndbg/pwndbg
(
    cd pwndbg
    ./setup.sh
)
git clone https://github.com/alset0326/peda-arm.git

# rp++
mkdir rp++
wget https://github.com/downloads/0vercl0k/rp/rp-lin-x64 -O rp++/rp++
chmod +x rp++/rp++

# one_gadget
sudo gem install one_gadget

# libc-database
git clone https://github.com/niklasb/libc-database.git
(
    cd libc-database
    ./get
)

# z3py
git clone https://github.com/Z3Prover/z3.git
(
    cd z3
    python scripts/mk_make.py --python
    cd build
    make
    sudo make install
)
