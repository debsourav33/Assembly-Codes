segment .bss
a: resq 1
b: resq 2

segment .data
fmt: db "%d",0
fmt2: db "Max element is: %d",10,0

segment .text
global main
extern printf, scanf

main:
push RBP
mov RAX, 0
mov RDI, fmt
mov RSI, b
call scanf

mov RDX, [b]
push RDX

mov RCX, [b]
mov RBX, a

scan:
	push RBX
	push RCX
	mov RAX, 0
	mov RDI, fmt
	mov RSI, RBX
	call scanf

	pop RCX
	pop RBX

	add RBX, 8
	loop scan

pop RDX

mov RCX, RDX
mov RBX, a
mov RAX, 0

max:
cmp RAX, [RBX]
jge cont
mov RAX, [RBX]
cont:
add RBX, 8
loop max

mov RDI, fmt2
mov RSI, RAX
call printf






pop RBP
ret

