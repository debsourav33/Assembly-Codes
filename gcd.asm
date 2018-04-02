segment .data
fmt: db "%d %d", 0
fmt2: db "GCD is: %d",10, 0

segment .bss
a: resq 1
b: resq 2

segment .text
global main
extern printf, scanf

main:
	push RBP
	mov RAX, 0
	mov RDI, fmt
	mov RSI, a
	mov RDX, b
	call scanf
	
	mov RAX, [a]
	mov RBX, [b]

gcd:
	cqo
	idiv RBX
	mov RAX, RBX
	mov RBX, RDX
	cmp RDX, 0
	jne gcd	
	
mov RDI, fmt2
mov RSI, RAX
xor RAX, RAX
call printf

pop RBP
ret

