# Create by chung6vn

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

> Example
```bash
pwndbg> target remote localhost:1234
Remote debugging using localhost:1234
0xf67d6a40 in ?? ()
LEGEND: STACK | HEAP | CODE | DATA | RWX | RODATA
───────────────────────────────────────────────────────────────────────────[ REGISTERS ]───────────────────────────────────────────────────────────────────────────
 R0   0x0
 R1   0xf6fff824 ◂— './test'
 R2   0x0
 R3   0x0
 R4   0x0
 R5   0x0
 R6   0x0
 R7   0x0
 R8   0x0
 R9   0x0
 R10  0x20f04 —▸ 0x10551 ◂— ldcleq p0, c4, [r6], #0x2d4
 R11  0x0
 R12  0x0
 SP   0xf6fff720 ◂— 0x1
 PC   0xf67d6a40 ◂— ldr    sl, [pc, #0x94]
────────────────────────────────────────────────────────────────────────────[ DISASM ]─────────────────────────────────────────────────────────────────────────────
 ► 0xf67d6a40    ldr    sl, [pc, #0x94]
   0xf67d6a44    ldr    r4, [pc, #0x94]
   0xf67d6a48    mov    r0, sp
   0xf67d6a4c    blx    #0xf67d9848
 
   0xf67d6a50    add    r6, pc, #0x84
   0xf67d6a54    add    sl, sl, r6
   0xf67d6a58    ldr    r4, [sl, r4]
   0xf67d6a5c    mov    r6, r0
   0xf67d6a60    ldr    r1, [sp]
   0xf67d6a64    add    r2, sp, #4
   0xf67d6a68    cmp    r4, #0
─────────────────────────────────────────────────────────────────────────────[ STACK ]─────────────────────────────────────────────────────────────────────────────
00:0000│ sp  0xf6fff720 ◂— 0x1
01:0004│     0xf6fff724 —▸ 0xf6fff824 ◂— './test'
02:0008│     0xf6fff728 ◂— 0x0
03:000c│     0xf6fff72c —▸ 0xf6fff82b ◂— 0x50444c4f ('OLDP')
04:0010│     0xf6fff730 —▸ 0xf6fff842 ◂— 0x752f3d5f ('_=/u')
05:0014│     0xf6fff734 —▸ 0xf6fff85d ◂— 0x5353454c ('LESS')
06:0018│     0xf6fff738 —▸ 0xf6fff87f ◂— 0x5f474458 ('XDG_')
07:001c│     0xf6fff73c —▸ 0xf6fff89e ◂— 0x5353454c ('LESS')
───────────────────────────────────────────────────────────────────────────[ BACKTRACE ]───────────────────────────────────────────────────────────────────────────
 ► f 0 f67d6a40
pwndbg> 
```
