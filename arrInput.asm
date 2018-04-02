segment .bss
a: resq 1
b: resq 2

segment .data
puts: db "Enter the array size: ",0
puts2: db "Enter the array elements: ",0
fmt: db "%d",0
fmt2: db "The array contains: ",0
fmt3: db "%d ",0
fmt4: db "%d",10

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
mov RSI, RDX


mov RCX, RDX
mov RBX, a

print:
	push RBX
	push RCX
	mov RDI, fmt3
	mov RSI, [RBX]
	mov RAX, 0
	call printf
	pop RCX
	pop RBX
	add RBX, 8
	loop print

pop RBP
ret

