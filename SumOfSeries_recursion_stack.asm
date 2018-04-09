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
	
	push 2
	push 2
	push 1
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
 	
 	mov RCX, [RBP+16]
 	mov RBX, [RBP+24]
 	mov RDX, [RBP+32]
 	mov RAX, [RBP+40]
 	
 	add RDX, RBX
 	
 	cmp RDX, RCX
 	jg end
 	
 	
 	add RAX, RDX
 	inc RBX
 	
 	push RAX
 	push RDX
 	push RBX
 	push RCX
 	
 	call series
 	
end:
 	mov RSP, RBP
 	pop RBP
 	ret
 

 	
 	


