# Create by chung6vn

## Step 1: Setup environment
```bash
cd /tmp
wget https://raw.githubusercontent.com/chung96vn/env-setup/master/mips/setup.sh
chmod +x ./setup.sh
./setup.sh
```

## Step 2: Testing environmet
```bash
cd /tmp
wget https://raw.githubusercontent.com/chung96vn/env-setup/master/mips/test.c
mips-linux-gnu-gcc test.c -o test
file ./test
./test
```

## Step 3: Debug
> in first terminal
```bash
qemu-mips-static -g 1234 ./test
```
> in second terminal
```bash
gdb-multiarch
```
> in pwndbg
```bash
set architecture mips
target remote localhost:1234
```
