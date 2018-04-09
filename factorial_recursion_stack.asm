	segment .data
scanfmt: db "%d",0
printfmt: db "%d",10,0

	segment .bss
n: 	resq 1

	segment .text
global main, series
extern printf, scanf

main:
	push RBP
	mov RBP, RSP
	
	mov RDI, scanfmt
	mov RSI, n
	xor RAX, RAX
	call scanf
	
	mov RSI, [n]
	push RSI

	call series
	mov RDI, printfmt
	mov RSI, RAX
	xor RAX, RAX
	call printf

	leave
	ret

series:
 	push RBP
	mov RBP, RSP	
 	
 	mov RDX, [RBP+16]
 	
 	cmp RDX, 1
 	jle end
 	
 	push RDX
 	
	dec RDX
	push RDX
	call series
	
	mov RDX, [RBP-8]
	imul RAX, RDX
 	
 end:
 	leave
 	ret
 
 
