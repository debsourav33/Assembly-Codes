	segment .bss
str:	resq 21

	segment .data
printfmt: db "You have typed: %s",10,0
printfmt2: db "%c",10,0
printfmt3: db "String length: %d",10,0
	
	segment .text
	global main
	extern printf, gets

main:	
	push RBP
	mov RBP, RSP
	
	mov RDI, str
	call gets
	
	mov RDI, printfmt
	mov RSI, str
	call printf
	
	mov RBX, str
	mov RCX, 0
	repeat:	
		cmp BYTE[RBX], 0
		je end
		
		inc RBX
		inc RCX
		jmp repeat
end:	
	mov RDI, printfmt3
	mov RSI, RCX
	xor RAX, RAX
	call printf
	
		
	leave
	ret
