#!
#/bin/sh
# setup environment for arm architecture

sudo apt-get update
sudo apt-get install git -y

# setup pwndbg
cd /tmp
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# setup qemu
sudo apt-get install qemu -y
sudo apt-get install qemu-user-static -y

# setup arm lib
sudo apt-get install gcc-arm-linux-gnueabihf -y
sudo apt-get install gdb-multiarch -y

#  make symbolic links
sudo ln -s /usr/arm-linux-gnueabihf/lib/libc-2.23.so /lib/libc.so.6
sudo ln -s /usr/arm-linux-gnueabihf/lib/ld-linux-armhf.so.3 /lib/ld-linux-armhf.so.3
