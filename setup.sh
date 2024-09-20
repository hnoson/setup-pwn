#!/bin/sh

echo "\$nrconf{restart} = 'a';" | sudo tee /etc/needrestart/conf.d/50-autorestart.conf

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y python3 python3-pip zsh tmux ruby xclip auditd curl socat pkg-config hexdiff cmake qemu-user-static gcc-arm-linux-gnueabihf gdb-multiarch
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

# ninja
git clone https://github.com/ninja-build/ninja.git
(
    cd ninja
    ./configure --bootstrap
)

# rp++
git clone https://github.com/0vercl0k/rp.git
(
    cd rp
    chmod u+x ./build-release.sh && ./build-release.sh
)

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
