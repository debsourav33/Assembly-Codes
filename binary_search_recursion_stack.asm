	segment .bss
a: resq 15
n: resq 1
x: resq 1
	segment .data
scanfmt: db "%d",0
printfmt: db "Found at: %d",10
	
	segment .text
	global main
	extern printf, scanf
	
main:
	push RBP
	mov RBP, RSP
	
	mov RDI, scanfmt
	mov RSI, n
	xor RAX, RAX
	call scanf
	
	mov RBX, a
	mov RCX, [n]
	
	scan:	
		push RBX
		push RCX
		mov RDI, scanfmt
		mov RSI, RBX
		xor RAX, RAX
		call scanf
		
		pop RCX
		pop RBX
		add RBX, 8
		loop scan
	
	mov RDI, scanfmt
	mov RSI, x
	xor RAX, RAX
	call scanf 
		
		
	push a
	mov RBX, [x]
	push RBX
	push 0
	mov RCX, [n]
	dec RCX
	push RCX
	
	call bin
	
	mov RDI, printfmt
	mov RSI, RAX
	xor RAX, RAX
	call printf 
	
	leave
	ret

bin:
	push RBP
	mov RBP, RSP
	
	mov RAX, [RBP+16]
	mov RBX, [RBP+24]
	mov RCX, [RBP+32]
	mov RDX, [RBP+40]
	
	push RAX
	push RBX
	push RCX
	push RDX
	add RAX, RBX
	mov RSI, 2
	cqo
	idiv RSI
	mov RSI, RAX
	
	pop RDX
	pop RCX
	pop RBX
	pop RAX
	
	cmp RBX,RAX
	jg end2
	
	
	cmp [RDX+RSI*8], RCX
	je end
	
	cmp RCX, [RDX+RSI*8]
	jg check
	
	push RDX
	push RCX
	push RBX
	dec RSI
	push RSI
	
	call bin
	jmp end3

check:  push RDX
	push RCX
	inc RSI
	push RSI
	push RAX
	
	call bin
	jmp end3
 
	
	
	
end:	
	mov RAX, RSI
	leave
	ret	

end2:	
	mov RAX, -1
	leave 
	ret
	
		
end3:	
	leave
	ret	

