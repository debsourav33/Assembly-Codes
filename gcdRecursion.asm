	segment .data
scanfmt: db "%d %d",0
printfmt: db "GCD(%d, %d)= %d",10,0

	segment .bss
a:	resq 1
b: 	resq 1 

	segment .text
	global main
	global gcd
	extern scanf, printf

main:
	push RBP
	mov RDI, scanfmt
	mov RSI, a
	mov RDX, b
	xor RAX, RAX
	call scanf
	
	mov RDI, [a]
	mov RSI, [b]
	call gcd
	
	mov RDI, printfmt
	mov RSI, [a]
	mov RDX, [b]
	mov RCX, RAX
	mov RAX, 0
	call printf
	
	pop RBP
	ret

gcd:	
	mov RAX, RDI
	mov RBX, RSI
	cqo
	idiv RBX
	cmp RDX, 0
	jne repeat
	mov RAX, RSI
	ret
	
repeat:
	mov RDI, RSI
	mov RSI, RDX
	call gcd
	ret 
	
	


