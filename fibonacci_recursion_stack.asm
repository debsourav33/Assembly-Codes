	segment .data
scanfmt: db "%d",0
printfmt: db "Fib(%d)= %d",10,0

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
	mov RSI, [n]
	mov RDX, RAX
	xor RAX, RAX
	call printf

	leave
	ret

series:
 	push RBP
	mov RBP, RSP	
 	
 	mov RCX, [RBP+16]
 	
 	cmp RCX, 0
 	je end1
 	
 	cmp RCX, 1
 	je end2
 	
 	dec RCX
 	push RCX
 	
 	call series
 	
 	pop RCX
 	dec RCX
 	
 	push RAX
 	
 	push RCX
 	
 		
 	call series
 	
 	pop RCX
 	pop RBX
 	add RAX, RBX
 	
 	jmp end	
 		
 	
end1:
	mov RAX, 0
	leave
	ret
end2:
	mov RAX, 1
	leave
	ret
 	
end:
	leave
	ret
