segment .bss
a: resq 1
b: resq 2

segment .data
fmt: db "%d",0
fmt2: db "%d ",0
segment .text
global main
extern printf, scanf

main:
push RBP


mov RCX, 5
mov RBX, a

scan:
	push RBX
	push RCX
	mov RAX, 0
	mov RDI, fmt
	mov RSI, RBX
	call scanf

	pop RCX
	pop RBX

	add RBX, 8
	loop scan

mov RBX, a
mov RCX, 5
mov RSI, 0
mov RDI, 0

outer:	
	mov RDI, RSI
	inc RDI
	inner:
	
mov RAX, [RBX+RSI*8]
cmp RAX, [RBX+RDI*8]
jle cont
mov RDX, [RBX+RDI*8]
mov [RBX+RDI*8], RAX
mov [RBX+RSI*8], RDX

cont: 
	inc RDI
	cmp RDI, 5
	jge break
	jmp inner
break:  inc RSI
	cmp RSI, 4
	jge exit
	jmp outer
exit:

mov RCX, 5
mov RBX, a

scan2:
	push RBX
	push RCX
	mov RAX, 0
	mov RDI, fmt2
	mov RSI, [RBX]
	call printf

	pop RCX
	pop RBX

	add RBX, 8
	loop scan2	
		 

pop RBP
ret
