#!/bin/sh

sudo apt install -y vim-gnome python python-pip zsh tmux ruby xclip auditd
chsh -s /bin/zsh
sudo pip install pwntools
cp .vimrc .zshrc .tmux.conf ~
mkdir ~/programs
cd ~/programs

# gdb
git clone https://github.com/longld/peda.git
git clone https://github.com/hnoson/gdbheap.git
echo 'source ~/programs/peda/peda.py\nsource ~/programs/gdbheap/gdbheap.py' >> ~/.gdbinit

# libc-database (sometimes fails)
git clone https://github.com/niklasb/libc-database.git
(
    cd libc-database
    ./get
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
