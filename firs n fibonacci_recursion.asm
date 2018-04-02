	segment .data
scanfmt: db "%d",0
printfmt: db "Fist %d fibonacci numbers: ",0
printfmt2: db "%d ",0
nl: db "",10
	segment .bss
x:	resq 1

	segment .text
	global main
	global fibo
	extern scanf, printf
	
main:
	push RBP
	mov RDI, scanfmt
	mov RSI, x
	xor RAX, RAX
	call scanf
	
	mov RDI, printfmt
	mov RSI, [x]
	xor RAX, RAX
	call printf
	
	mov RDX, 0
	
	repet:	
		push RDX
		mov RDI, RDX
		call fibo
	
		mov RDI, printfmt2
		mov RSI, RAX
		xor RAX, RAX
		call printf
		
		pop RDX
		inc RDX
		cmp RDX, [x]
		jl repet
	
	mov RDI, nl
	call printf
		
	pop RBP
	ret

fibo:	
	cmp RDI, 0
	jne check1
	mov RAX, 0
	ret
	check1:
		cmp RDI, 1
		jne repeat
		mov RAX, 1
		ret

repeat:	
	dec RDI
	push RDI
	call fibo
	
	pop RDI
	dec RDI
	push RAX
	call fibo
	
	pop RDX
	add RAX, RDX
	ret
	
	
	
	
	
	
	
