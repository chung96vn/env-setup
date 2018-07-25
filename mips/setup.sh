#!
#/bin/sh
# setup environment for arm architecture

sudo apt-get update
sudo apt-get install git -y
sudo apt-get install pip -y

# setup pwndbg
mkdir ~/setup
cd ~/setup
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# setup pwntools
sudo pip install pwntools

# setup qemu
sudo apt-get install qemu -y
sudo apt-get install qemu-user-static -y

# setup arm lib
sudo apt-get install gcc-mips-linux-gnu -y
sudo apt-get install gdb-multiarch -y

#  make symbolic links
sudo ln -s /usr/mips-linux-gnu/lib/libc-2.23.so /lib/libc.so.6
sudo ln -s /usr/mips-linux-gnu/lib/ld.so.1 /lib/ld.so.1
