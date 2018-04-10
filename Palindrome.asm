	segment .bss
str:	resb 21

	segment .data
printfmt: db "You have typed: %s",10,0
printfmt2: db "Yes! Palindrome :)",10,0
printfmt3: db "No! Not a palindrome :(",10,0
fmt: db "%d",10,0
	
	segment .text
	global main
	extern printf, gets

main:	
	push RBP
	mov RBP, RSP
	
	mov RDI, str
	call gets
	
	mov RBX, str
	mov RCX, 0
	repeat:	
		cmp BYTE[RBX], 0
		je end
		
		inc RBX
		inc RCX
		jmp repeat
end:	
	push str
	push 0
	dec RCX
	push RCX		
	call palin
	
	cmp RAX, -1
	je not
	
	mov RDI, printfmt2
	mov RSI, RAX
	xor RAX, RAX
	call printf
	
	leave
	ret
	
	not:
		mov RDI, printfmt3
		mov RSI, RAX
		xor RAX, RAX
		call printf
	
		leave
		ret
		



palin:
	push RBP
	mov RBP, RSP	
	
	mov RAX, [RBP+16]
	mov RBX, [RBP+24]
	mov RDX, [RBP+32]
	
	cmp RAX, RBX
	jle pal
	
	push RBX
	mov cl, [RDX+RBX]
	mov bl, [RDX+RAX]
	
	cmp bl, cl
	jne notPal
	pop RBX
	
	dec RAX
	inc RBX
	
	push RDX
	push RBX
	push RAX
	call palin
	
	leave
	ret

notPal:
	pop RBX
	mov RAX, -1
	leave
	ret
	
pal:	
	mov RAX, 1
	leave
	ret
	

