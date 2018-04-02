segment .data
datas: db "Hello World",0
needle: db 'W'
n: dq 0
fmt: db "Found 'e' at: %d",10,0

segment .text
global main
extern printf

main:
push RBP

mov al, [datas]
mov bl, [needle]
mov RCX, 0

while:
cmp al, bl
je found
INC RCX
mov al, [datas+RCX*1]
cmp al, 0
jne while

end_while: mov RCX, -1


found: 
mov [n], RCX
mov RDI, fmt
mov RSI, [n]
xor RAX, RAX
call printf

pop RBP
ret


