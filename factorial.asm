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
	;push RBP
	;mov RBP, RSP
	;sub RSP, 16
	cmp RDI, 1
	jg greater
	mov RAX, 1
	;leave
	;pop RBP
	ret
	
greater:
	;mov [RSP+n], RDI
	push RDI
	dec RDI
	call fact
	;mov RDI, [RSP+n]
	pop RDI
	imul RAX, RDI
	;leave
	ret		
		
	
