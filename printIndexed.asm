segment .bss
a: resq 10
b: resq 10
c: resq 1

segment .data
fmt: db "%d",0
fmt2: db "Max element is: %d",10,0

segment .text
global main
extern printf, scanf

main:
push RBP
mov RCX, 10
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

mov RDI, fmt
mov RSI, c
mov RAX, 0
call scanf

mov RBX, a
mov RCX, [c]
mov RSI, [RBX+8*RCX]
mov RDI, fmt
call printf


pop RBP
ret

