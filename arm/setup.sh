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
sudo apt-get install gcc-arm-linux-gnueabihf -y
sudo apt-get install gdb-multiarch -y

#  export LD_LIBRARY_PATH
echo -e "\nexport LD_LIBRARY_PATH=/usr/arm-linux-gnueabihf/lib/" >> ~/.bashrc
source ~/.bashrc
