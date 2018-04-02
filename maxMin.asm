segment .bss
a: resq 1
b: resq 2

segment .data
fmt: db "%d",0
fmt2: db "Max element: %d was found at: %d",10,0
fmt3: db "Min element: %d was found at: %d",10,0
segment .text
global main
extern printf, scanf

main:
push RBP


mov RCX, 5
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


mov RCX, 5
mov RBX, a
mov RAX, -99999
mov RSI, 0

max:
	cmp RAX, [RBX]
	jge cont
	mov RAX, [RBX]
	mov RDX, RSI 
	cont:
	inc RSI
	add RBX, 8
	loop max

mov RDI, fmt2
mov RSI, RAX
mov RAX, 0
call printf


mov RCX, 5
mov RBX, a
mov RAX, 99999
mov RSI, 0

min:
	cmp RAX, [RBX]
	jle cont2
	mov RAX, [RBX]
	mov RDX, RSI
	cont2:
	add RBX, 8
	inc RSI
	loop min

mov RDI, fmt3
mov RSI, RAX
mov RAX, 0
call printf

pop RBP
ret

