	segment .data
scanfmt: db "%d",0
printfmt: db "No. %d fibonacci number= %d",10,0

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
	
	mov RDI, [x]
	call fibo
	
	mov RDI, printfmt
	mov RSI, [x]
	mov RDX, RAX
	xor RAX, RAX
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
	
	
	
	
	
	
	
