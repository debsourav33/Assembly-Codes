	segment .data
scanfmt: db "%d",0
printfmt: db "Fact(%d)= %d",10,0
x dq 0

	segment .text
	global main
	extern scanf, printf

main:
	push RBP
	mov RDI, scanfmt
	mov RSI, x
	xor rax, rax
	call scanf
	
	mov RDI, [x]
	call fact
	mov RDI, printfmt
	mov RSI, [x]
	mov RDX, RAX
	xor RAX, RAX
	call printf
	
	pop RBP
	ret
	
fact:
	n equ 8
	cmp RDI, 1
	jg greater
	mov RAX, 1
	ret
	
greater:
	push RDI
	dec RDI
	call fact
	pop RDI
	imul RAX, RDI
	ret		
		
	
