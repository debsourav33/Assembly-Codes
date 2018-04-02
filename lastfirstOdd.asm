segment .bss
a: resq 10
b: resq 10
c: resq 10

segment .data
fmt: db "%d",0
fmt2: db "First odd element: %d",10,0
fmt3: db "Last odd element: %d",10,0

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

mov RCX, 10
mov RBX, a
mov RDX, c
mov RSI, 0

check:
	mov RAX, [RBX]
	TEST RAX, 1
	jz cont
	mov [RDX], RAX
	add RDX, 8
	INC RSI
	cont:
	add RBX, 8
	loop check

mov RCX, RSI
mov RBX, c

push RCX
push RBX

mov RDI, fmt2
mov RSI, [RBX]
call printf

pop RBX
pop RCX

DEC RCX
mov RDI, fmt3
mov RSI, [RBX+ RCX* 8]
call printf 

pop RBP
ret

