# Create By chung6vn

## Step 1: Setup environment
```bash
cd /tmp
wget https://raw.githubusercontent.com/chung96vn/env-setup/master/arm/setup.sh
chmod +x ./setup.sh
./setup.sh
```

## Step 2: Testing environmet
```bash
cd /tmp
wget https://raw.githubusercontent.com/chung96vn/env-setup/master/arm/test.c
arm-linux-gnueabihf-gcc test.c -o test
file ./test
./test
```

## Step 3: Debug
> in first terminal
```bash
qemu-arm-static -g 1234 ./test
```
> in second terminal
```bash
gdb-multiarch
```
> in pwndbg
```bash
set architecture arm
target remote localhost:1234
```
