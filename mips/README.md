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
set endian big
set architecture mips
target remote localhost:1234
```

> Example
```bash
pwndbg> target remote localhost:1234
Remote debugging using localhost:1234
0x767cbcf0 in ?? ()
LEGEND: STACK | HEAP | CODE | DATA | RWX | RODATA
───────────────────────────────────────────────────────────────────────────[ REGISTERS ]───────────────────────────────────────────────────────────────────────────
 V0   0x0
 V1   0x0
*A0   0x0
 A1   0x0
 A2   0x0
 A3   0x0
*T0   0x0
 T1   0x0
 T2   0x0
 T3   0x0
 T4   0x0
 T5   0x0
 T6   0x0
 T7   0x0
 T8   0x0
*T9   0x0
 S0   0x0
 S1   0x0
 S2   0x0
 S3   0x0
 S4   0x0
 S5   0x0
 S6   0x0
 S7   0x0
 S8   0x0
 FP   0x0
*SP   0x76fff720 ◂— 0x1
*PC   0x767cbcf0 ◂— move   $t9, $ra
────────────────────────────────────────────────────────────────────────────[ DISASM ]─────────────────────────────────────────────────────────────────────────────
 ► 0x767cbcf0    move   $t9, $ra
   0x767cbcf4    bal    0x767cbcfc
   0x767cbcf8    nop    
   0x767cbcfc    lui    $gp, 4
   0x767cbd00    addiu  $gp, $gp, -0x5cfc
   0x767cbd04    addu   $gp, $gp, $ra
   0x767cbd08    move   $ra, $t9
   0x767cbd0c    lw     $a0, -0x7fe8($gp)
   0x767cbd10    sw     $a0, -0x7ff0($gp)
   0x767cbd14    move   $a0, $sp
   0x767cbd18    addiu  $sp, $sp, -0x10
─────────────────────────────────────────────────────────────────────────────[ STACK ]─────────────────────────────────────────────────────────────────────────────
00:0000│ sp  0x76fff720 ◂— 0x1
01:0004│     0x76fff724 —▸ 0x76fff81d ◂— './test'
02:0008│     0x76fff728 ◂— 0x0
03:000c│     0x76fff72c —▸ 0x76fff824 ◂— 0x5f3d2f75 ('_=/u')
04:0010│     0x76fff730 —▸ 0x76fff840 ◂— 0x4c455353 ('LESS')
05:0014│     0x76fff734 —▸ 0x76fff862 ◂— 0x5844475f ('XDG_')
06:0018│     0x76fff738 —▸ 0x76fff881 ◂— 0x4c455353 ('LESS')
07:001c│     0x76fff73c —▸ 0x76fff8a1 ◂— 0x5353485f ('SSH_')
───────────────────────────────────────────────────────────────────────────[ BACKTRACE ]───────────────────────────────────────────────────────────────────────────
 ► f 0 767cbcf0
pwndbg> 
```
